#
# This file is part of LUNA.
#
# Copyright (c) 2020 Great Scott Gadgets <info@greatscottgadgets.com>
# SPDX-License-Identifier: BSD-3-Clause

""" Low-level USB analyzer gateware. """

import unittest

from amaranth          import Signal, Module, Elaboratable, Memory, Record, Mux, Cat

from ..stream          import StreamInterface
from ..test            import LunaGatewareTestCase, usb_domain_test_case


class USBAnalyzer(Elaboratable):
    """ Core USB analyzer; backed by a small ringbuffer in FPGA block RAM.

    If you're looking to instantiate a full analyzer, you'll probably want to grab
    one of the DRAM-based ringbuffer variants (which are currently forthcoming).

    If you're looking to use this with a ULPI PHY, rather than the FPGA-convenient UTMI interface,
    grab the UTMITranslator from `luna.gateware.interface.ulpi`.

    Attributes
    ----------
    stream: StreamInterface(), output stream
        Stream that carries USB analyzer data.

    idle: Signal(), output
        Asserted iff the analyzer is not currently receiving data.
    stopped: Signal(), output
        Asserted iff the analyzer is stopped and not capturing packets.
    overrun: Signal(), output
        Asserted iff the analyzer has received more data than it can store in its internal buffer.
        Occurs if :attr:``stream`` is not being read quickly enough.
    capturing: Signal(), output
        Asserted iff the analyzer is currently capturing a packet.
    discarding: Signal(), output
        Asserted iff the analyzer is discarding the contents of its internal buffer.


    Parameters
    ----------
    utmi_interface: UTMIInterface()
        The UTMI interface that carries the data to be analyzed.
    mem_depth: int, default=8192
        The depth of the analyzer's local ringbuffer, in bytes.
        Must be a power of 2.
    """

    # Header is 16-bit length and 16-bit timestamp.
    HEADER_SIZE_BITS = 32
    HEADER_SIZE_BYTES = HEADER_SIZE_BITS // 8

    # Support a maximum payload size of 1024B, plus a 1-byte PID and a 2-byte CRC16.
    MAX_PACKET_SIZE_BYTES = 1024 + 1 + 2

    def __init__(self, *, utmi_interface, mem_depth=32768):
        """
        Parameters:
            utmi_interface -- A record or elaboratable that presents a UTMI interface.
        """

        self.utmi = utmi_interface

        assert (mem_depth % 2) == 0, "mem_depth must be a power of 2"

        # Internal storage memory.
        self.mem = Memory(width=16, depth=mem_depth, name="analysis_ringbuffer")
        self.mem_size = 2 * mem_depth

        #
        # I/O port
        #
        self.stream         = StreamInterface()

        self.capture_enable = Signal()
        self.idle           = Signal()
        self.stopped        = Signal()
        self.overrun        = Signal()
        self.capturing      = Signal()
        self.discarding     = Signal()

        # Diagnostic I/O.
        self.sampling       = Signal()


    def elaborate(self, platform):
        m = Module()

        # Memory read and write ports.
        m.submodules.read  = mem_read_port  = self.mem.read_port(domain="usb")
        m.submodules.write = mem_write_port = self.mem.write_port(domain="sync", granularity=8)

        # Store the memory address of our active packet header, which will store
        # packet metadata like the packet size.
        header_location = Signal.like(mem_write_port.addr)
        write_location  = Signal(range(self.mem_size))
        event_location  = Signal.like(header_location)

        # Read FIFO status.
        read_location   = Signal(range(self.mem_size))
        fifo_count      = Signal(range(self.mem_size), reset=0)

        # Memory addresses point to words
        write_pointer = Signal.like(mem_write_port.addr)
        read_pointer  = Signal.like(mem_read_port.addr)
        read_odd      = Signal()
        write_odd     = Signal()
        m.d.comb += [
            Cat(read_odd, read_pointer)   .eq(read_location),
            Cat(write_odd, write_pointer) .eq(write_location),
        ]

        # Current receive status.
        packet_size     = Signal(16)
        packet_time     = Signal(16)

        # Triggers for memory write operations.
        write_packet    = Signal()
        write_header    = Signal()

        #
        # Read FIFO logic.
        #
        m.d.comb += [

            # We have data ready whenever there's data in the FIFO.
            self.stream.valid    .eq((fifo_count != 0) & (self.idle | self.overrun)),

            # Our data_out is always the output of our read port...
            self.stream.payload  .eq(mem_read_port.data.word_select(~read_odd, 8)),

            self.sampling        .eq(write_packet | write_header)
        ]

        # Once our consumer has accepted our current data, move to the next address.
        with m.If(self.stream.ready & self.stream.valid):
            m.d.usb  += read_location      .eq(read_location + 1)
            m.d.comb += mem_read_port.addr .eq(read_pointer + read_odd)
        with m.Else():
            m.d.comb += mem_read_port.addr .eq(read_pointer),

        #
        # FIFO count handling.
        #
        fifo_full = (fifo_count == self.mem_size)

        # Number of bytes popped from the FIFO this cycle.
        data_popped = Signal(1)

        # Number of bytes pushed to the FIFO this cycle.
        data_pushed = Signal(2)

        # One byte is popped if the stream is read.
        m.d.comb += data_popped.eq(self.stream.ready & self.stream.valid)

        # If discarding data, set the count to zero.
        with m.If(self.discarding):
            m.d.usb += [
                fifo_count.eq(0),
                read_location.eq(0),
                write_location.eq(0),
            ]
        # Otherwise, update the count acording to bytes pushed and popped.
        with m.Else():
            m.d.usb += fifo_count.eq(fifo_count + data_pushed - data_popped)

        # Timestamp counter.
        current_time = Signal(16)
        m.d.usb += current_time.eq(current_time + 1)

        #
        # Core analysis FSM.
        #
        with m.FSM(domain="usb") as f:
            m.d.comb += [
                self.idle      .eq(f.ongoing("AWAIT_START") | f.ongoing("AWAIT_PACKET")),
                self.stopped   .eq(f.ongoing("AWAIT_START") | f.ongoing("OVERRUN")),
                self.overrun   .eq(f.ongoing("OVERRUN")),
                self.capturing .eq(f.ongoing("CAPTURE_PACKET")),
                self.discarding.eq(self.stopped & self.capture_enable),
            ]

            # AWAIT_START: wait for capture to be enabled, but don't start mid-packet.
            with m.State("AWAIT_START"):
                with m.If(self.capture_enable & ~self.utmi.rx_active):
                    m.next = "AWAIT_PACKET"
                    m.d.usb += current_time.eq(0)


            # AWAIT_PACKET: capture is enabled, wait for a packet to start.
            with m.State("AWAIT_PACKET"):
                with m.If(~self.capture_enable):
                    m.next = "AWAIT_START"
                with m.Elif(self.utmi.rx_active):
                    m.next = "CAPTURE_PACKET"
                    m.d.usb += [
                        header_location  .eq(event_location),
                        write_location   .eq(write_location + write_odd + self.HEADER_SIZE_BYTES),
                        packet_size      .eq(0),
                        packet_time      .eq(current_time),
                        current_time     .eq(0),
                    ]


            # Capture data until the packet is complete.
            with m.State("CAPTURE_PACKET"):

                byte_received = self.utmi.rx_valid & self.utmi.rx_active

                # Capture data whenever RxValid is asserted.
                m.d.comb += [
                    write_packet    .eq(byte_received),
                    data_pushed     .eq(byte_received)
                ]

                # Advance the write pointer each time we receive a bit.
                with m.If(byte_received):
                    next_location = write_location + 1
                    m.d.usb += [
                        write_location  .eq(next_location),
                        event_location  .eq((next_location + next_location[0])[1:]),
                        packet_size     .eq(packet_size + 1)
                    ]

                    # If this would be filling up our data memory,
                    # move to the OVERRUN state.
                    with m.If(fifo_count == self.mem_size - 1 - self.HEADER_SIZE_BYTES):
                        m.next = "OVERRUN"

                # If we've stopped receiving, write header.
                with m.If(~self.utmi.rx_active):
                    m.d.comb += [
                        write_header .eq(1),
                        data_pushed  .eq(self.HEADER_SIZE_BYTES + (packet_size & 1))  # add padding length
                    ]
                    m.next = "AWAIT_PACKET"


            # BABBLE -- handles the case in which we've received a packet beyond
            # the allowable size in the USB spec
            with m.State("BABBLE"):

                # Trap here, for now.
                pass


            with m.State("OVERRUN"):
                # TODO: we should probably set an overrun flag and then emit an EOP, here?

                # If capture is stopped by the host, reset back to the ready state.
                with m.If(~self.capture_enable):
                    m.next = "AWAIT_START"


        #
        # Buffer write FSM.
        #
        with m.FSM(domain="sync"):
            # START: Begin write operation when requested.
            with m.State("START"):
                with m.If(write_packet):
                    # Write packet byte.
                    m.d.comb += [
                        mem_write_port.addr  .eq(write_pointer),
                        mem_write_port.data  .eq(self.utmi.rx_data.replicate(2)),
                        mem_write_port.en    .eq(Mux(write_odd, 0b01, 0b10)),
                    ]
                    m.next = "IDLE"
                with m.Elif(write_header):
                    # Write first word of header.
                    m.d.comb += [
                        mem_write_port.addr  .eq(header_location),
                        mem_write_port.data  .eq(packet_size),
                        mem_write_port.en    .eq(0b11)
                    ]
                    m.next = "FINISH_HEADER"

            # FINISH_HEADER: Write second word of header.
            with m.State("FINISH_HEADER"):
                m.d.comb += [
                        mem_write_port.addr  .eq(header_location + 1),
                        mem_write_port.data  .eq(packet_time),
                        mem_write_port.en    .eq(0b11)
                ]
                m.next = "START"

            # IDLE: Nothing to do this cycle.
            with m.State("IDLE"):
                m.next = "START"


        return m



class USBAnalyzerTest(LunaGatewareTestCase):

    SYNC_CLOCK_FREQUENCY = None
    USB_CLOCK_FREQUENCY = 60e6

    def instantiate_dut(self):
        self.utmi = Record([
            ('tx_data',     8),
            ('rx_data',    8),

            ('rx_valid',    1),
            ('rx_active',   1),
            ('rx_error',    1),
            ('rx_complete', 1),
        ])
        self.analyzer = USBAnalyzer(utmi_interface=self.utmi, mem_depth=128)
        return self.analyzer


    def advance_stream(self, value):
        yield self.utmi.rx_data.eq(value)
        yield


    @usb_domain_test_case
    def test_single_packet(self):
        # Enable capture
        yield self.analyzer.capture_enable.eq(1)
        yield

        # Ensure we're not capturing until a transaction starts.
        self.assertEqual((yield self.dut.capturing), 0)

        # Apply our first input, and validate that we start capturing.
        yield self.utmi.rx_active.eq(1)
        yield self.utmi.rx_valid.eq(1)
        yield self.utmi.rx_data.eq(0)
        yield
        yield

        # Provide some data.
        for i in range(1, 10):
            yield from self.advance_stream(i)
            self.assertEqual((yield self.dut.capturing), 1)

        # Ensure we're still capturing, _and_ that we have
        # data available.
        self.assertEqual((yield self.dut.capturing), 1)

        # End our packet.
        yield self.utmi.rx_active.eq(0)
        yield from self.advance_stream(10)

        # Idle for several cycles.
        yield from self.advance_cycles(5)
        self.assertEqual((yield self.dut.capturing), 0)

        # Try to read back the capture data, byte by byte.
        self.assertEqual((yield self.dut.stream.valid), 1)

        # First, we should get a header with the total data length.
        # This should be 0x00, 0x0B; as we captured 11 bytes.
        self.assertEqual((yield self.dut.stream.payload), 0)
        yield self.dut.stream.ready.eq(1)
        yield

        # Validate that we get all of the bytes of the packet we expected.
        expected_data = [0x00, 0x0a] + list(range(0, 10))
        for datum in expected_data:
            self.assertEqual((yield self.dut.stream.payload), datum)
            yield

        # We should now be out of data -- verify that there's no longer data available.
        self.assertEqual((yield self.dut.stream.valid), 0)


    @usb_domain_test_case
    def test_short_packet(self):
        # Enable capture
        yield self.analyzer.capture_enable.eq(1)
        yield

        # Apply our first input, and validate that we start capturing.
        yield self.utmi.rx_active.eq(1)
        yield self.utmi.rx_valid.eq(1)
        yield self.utmi.rx_data.eq(0)
        yield

        # Provide some data.
        yield from self.advance_stream(0xAB)

        # End our packet.
        yield self.utmi.rx_active.eq(0)
        yield from self.advance_stream(10)

        # Idle for several cycles.
        yield from self.advance_cycles(5)
        self.assertEqual((yield self.dut.capturing), 0)

        # Try to read back the capture data, byte by byte.
        self.assertEqual((yield self.dut.stream.valid), 1)

        # First, we should get a header with the total data length.
        # This should be 0x00, 0x01; as we captured 1 byte.
        self.assertEqual((yield self.dut.stream.payload), 0)
        yield self.dut.stream.ready.eq(1)
        yield

        # Validate that we get all of the bytes of the packet we expected.
        expected_data = [0x00, 0x01, 0xab]
        for datum in expected_data:
            self.assertEqual((yield self.dut.stream.payload), datum)
            yield

        # We should now be out of data -- verify that there's no longer data available.
        self.assertEqual((yield self.dut.stream.valid), 0)




class USBAnalyzerStackTest(LunaGatewareTestCase):
    """ Test that evaluates a full-stack USB analyzer setup. """

    SYNC_CLOCK_FREQUENCY = None
    USB_CLOCK_FREQUENCY = 60e6


    def instantiate_dut(self):

        from ..interface.ulpi import UTMITranslator

        self.ulpi = Record([
            ('data', [
                ('i',  8),
                ('o',  8),
                ('oe', 8),
            ]),
            ('nxt', 1),
            ('stp', 1),
            ('dir', [('i', 1)]),
            ('clk', 1),
            ('rst', 1)
        ])

        # Create a stack of our UTMITranslator and our USBAnalyzer.
        # We'll wrap the both in a module to establish a synthetic hierarchy.
        m = Module()
        m.submodules.translator = self.translator = UTMITranslator(ulpi=self.ulpi, handle_clocking=False)
        m.submodules.analyzer   = self.analyzer   = USBAnalyzer(utmi_interface=self.translator, mem_depth=128)
        return m


    def initialize_signals(self):

        # Ensure the translator doesn't need to perform any register reads/writes
        # by default, so we can focus on packet Rx.
        yield self.translator.xcvr_select.eq(1)
        yield self.translator.dm_pulldown.eq(1)
        yield self.translator.dp_pulldown.eq(1)
        yield self.translator.use_external_vbus_indicator.eq(0)


    @usb_domain_test_case
    def test_simple_analysis(self):
        # Enable capture
        yield self.analyzer.capture_enable.eq(1)
        yield from self.advance_cycles(10)

        # Start a new packet.
        yield self.ulpi.dir.eq(1)
        yield self.ulpi.nxt.eq(1)

        # Bus turnaround packet.
        yield self.ulpi.data.i.eq(0x80)
        yield

        # Provide some data to be captured.
        for i in [0x2d, 0x00, 0x10]:
            yield self.ulpi.data.i.eq(i)
            yield

        # Mark our packet as complete.
        yield self.ulpi.dir.eq(0)
        yield self.ulpi.nxt.eq(0)
        yield

        # Wait for a few cycles, for realism.
        yield from self.advance_cycles(10)

        # Read our data out of the PHY.
        yield self.analyzer.stream.ready.eq(1)
        yield

        # Validate that we got the correct packet out; plus headers.
        for i in [0x00, 0x03, 0x2d, 0x00, 0x10]:
            self.assertEqual((yield self.analyzer.stream.payload), i)
            yield



if __name__ == "__main__":
    unittest.main()
