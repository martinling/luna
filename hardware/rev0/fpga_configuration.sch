EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 9
Title "LUNA: Configuration / Dev / Debug Section"
Date "2020-12-24"
Rev "r0"
Comp "Great Scott Gadgets"
Comment1 "Katherine J. Temkin"
Comment2 ""
Comment3 "Licensed under the CERN-OHL-P v2"
Comment4 ""
$EndDescr
$Comp
L fpgas_and_processors:ECP5-BGA256 IC1
U 8 1 5DCABD39
P 10500 2250
F 0 "IC1" H 11350 2400 50  0000 R CNN
F 1 "ECP5-BGA256" H 11350 2300 50  0000 R CNN
F 2 "luna:lattice_cabga256" H 7300 5700 50  0001 L CNN
F 3 "" H 6850 6650 50  0001 L CNN
F 4 "FPGA - Field Programmable Gate Array ECP5; 12k LUTs; 1.1V" H 6850 6550 50  0001 L CNN "Description"
F 5 "Lattice" H 6900 7500 50  0001 L CNN "Manufacturer"
F 6 "LFE5U-12F-6BG256C" H 6900 7400 50  0001 L CNN "Part Number"
F 7 "LFE5U-12F-*BG256*" H 10500 2250 50  0001 C CNN "Substitution"
	8    10500 2250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10300 2050 10300 1900
$Comp
L power:+3V3 #PWR056
U 1 1 5DCDEED8
P 10300 1900
F 0 "#PWR056" H 10300 1750 50  0001 C CNN
F 1 "+3V3" H 10315 2073 50  0000 C CNN
F 2 "" H 10300 1900 50  0001 C CNN
F 3 "" H 10300 1900 50  0001 C CNN
	1    10300 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C32
U 1 1 5DCEC8F9
P 1400 1300
F 0 "C32" H 1450 1400 50  0000 L CNN
F 1 "0.1uF" H 1450 1200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1438 1150 50  0001 C CNN
F 3 "~" H 1400 1300 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 1400 1300 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 1400 1300 50  0001 C CNN "Substitution"
	1    1400 1300
	1    0    0    -1  
$EndComp
Connection ~ 1400 1100
Wire Wire Line
	1400 1150 1400 1100
$Comp
L Device:C C33
U 1 1 5DCEDCE6
P 1700 1300
F 0 "C33" H 1750 1400 50  0000 L CNN
F 1 "0.1uF" H 1750 1200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1738 1150 50  0001 C CNN
F 3 "~" H 1700 1300 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 1700 1300 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 1700 1300 50  0001 C CNN "Substitution"
	1    1700 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C34
U 1 1 5DCEE41C
P 2000 1300
F 0 "C34" H 2050 1400 50  0000 L CNN
F 1 "0.1uF" H 2050 1200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2038 1150 50  0001 C CNN
F 3 "~" H 2000 1300 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 2000 1300 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 2000 1300 50  0001 C CNN "Substitution"
	1    2000 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C31
U 1 1 5DCEE96F
P 1100 1300
F 0 "C31" H 1150 1400 50  0000 L CNN
F 1 "0.1uF" H 1150 1200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1138 1150 50  0001 C CNN
F 3 "~" H 1100 1300 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 1100 1300 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 1100 1300 50  0001 C CNN "Substitution"
	1    1100 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1450 1400 1450
Connection ~ 1400 1450
Wire Wire Line
	1400 1450 1550 1450
Connection ~ 1700 1450
Wire Wire Line
	1700 1450 2000 1450
Wire Wire Line
	1550 1450 1550 1500
Connection ~ 1550 1450
Wire Wire Line
	1550 1450 1700 1450
$Comp
L power:GND #PWR041
U 1 1 5DCEFFC7
P 1550 1500
F 0 "#PWR041" H 1550 1250 50  0001 C CNN
F 1 "GND" H 1555 1327 50  0000 C CNN
F 2 "" H 1550 1500 50  0001 C CNN
F 3 "" H 1550 1500 50  0001 C CNN
	1    1550 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 1150 1700 1100
Connection ~ 1700 1100
Wire Wire Line
	1700 1100 1400 1100
Wire Wire Line
	2000 1150 2000 1100
Connection ~ 2000 1100
Wire Wire Line
	2000 1100 1700 1100
Wire Wire Line
	1100 1150 1100 1100
Wire Wire Line
	1100 1100 1400 1100
Text Notes 2600 4700 0    138  ~ 0
Development / Debug uC
Text Label 2150 2550 0    50   ~ 0
UC_RESET
$Comp
L Memory_Flash:W25Q32JVSS U7
U 1 1 5DD128B2
P 7850 1350
F 0 "U7" H 7550 950 50  0000 C CNN
F 1 "W25Q32JVSS" H 8300 950 50  0000 C CNN
F 2 "Package_SO:SOIC-8_5.23x5.23mm_P1.27mm" H 7850 1350 50  0001 C CNN
F 3 "http://www.winbond.com/resource-files/w25q32jv%20revg%2003272018%20plus.pdf" H 7850 1350 50  0001 C CNN
F 4 "IC FLASH 32M SPI 133MHZ 8SOIC" H 7850 1350 50  0001 C CNN "Description"
F 5 "Winbond" H 7850 1350 50  0001 C CNN "Manufacturer"
F 6 "W25Q32JVSSIQ" H 7850 1350 50  0001 C CNN "Part Number"
	1    7850 1350
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR051
U 1 1 5DD1D655
P 7850 900
F 0 "#PWR051" H 7850 750 50  0001 C CNN
F 1 "+3V3" H 7865 1073 50  0000 C CNN
F 2 "" H 7850 900 50  0001 C CNN
F 3 "" H 7850 900 50  0001 C CNN
	1    7850 900 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR052
U 1 1 5DD1E101
P 7850 1750
F 0 "#PWR052" H 7850 1500 50  0001 C CNN
F 1 "GND" H 7855 1577 50  0000 C CNN
F 2 "" H 7850 1750 50  0001 C CNN
F 3 "" H 7850 1750 50  0001 C CNN
	1    7850 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C35
U 1 1 5DD1E9FF
P 7100 900
F 0 "C35" V 7200 750 50  0000 C CNN
F 1 "0.1uF" V 7150 1150 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7138 750 50  0001 C CNN
F 3 "~" H 7100 900 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 7100 900 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 7100 900 50  0001 C CNN "Substitution"
	1    7100 900 
	0    1    1    0   
$EndComp
Wire Wire Line
	7250 900  7850 900 
Wire Wire Line
	7850 950  7850 900 
Connection ~ 7850 900 
$Comp
L power:GND #PWR050
U 1 1 5DD21DA8
P 6950 900
F 0 "#PWR050" H 6950 650 50  0001 C CNN
F 1 "GND" V 6955 772 50  0000 R CNN
F 2 "" H 6950 900 50  0001 C CNN
F 3 "" H 6950 900 50  0001 C CNN
	1    6950 900 
	0    1    1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 5DD22BB5
P 8750 4950
F 0 "R12" V 8700 4750 50  0000 C CNN
F 1 "10K" V 8750 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 8680 4950 50  0001 C CNN
F 3 "~" H 8750 4950 50  0001 C CNN
F 4 "GENERIC-RES-0402-10K" H 8750 4950 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 8750 4950 50  0001 C CNN "Substitution"
	1    8750 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R R13
U 1 1 5DD23434
P 8750 5050
F 0 "R13" V 8700 4850 50  0000 C CNN
F 1 "10K" V 8750 5050 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 8680 5050 50  0001 C CNN
F 3 "~" H 8750 5050 50  0001 C CNN
F 4 "GENERIC-RES-0402-10K" H 8750 5050 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 8750 5050 50  0001 C CNN "Substitution"
	1    8750 5050
	0    1    1    0   
$EndComp
$Comp
L Device:R R14
U 1 1 5DD23797
P 8750 5150
F 0 "R14" V 8700 4950 50  0000 C CNN
F 1 "10K" V 8750 5150 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 8680 5150 50  0001 C CNN
F 3 "~" H 8750 5150 50  0001 C CNN
F 4 "GENERIC-RES-0402-10K" H 8750 5150 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 8750 5150 50  0001 C CNN "Substitution"
	1    8750 5150
	0    1    1    0   
$EndComp
$Comp
L power:+3V3 #PWR055
U 1 1 5DD27B73
P 8450 5050
F 0 "#PWR055" H 8450 4900 50  0001 C CNN
F 1 "+3V3" V 8465 5178 50  0000 L CNN
F 2 "" H 8450 5050 50  0001 C CNN
F 3 "" H 8450 5050 50  0001 C CNN
	1    8450 5050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8450 5050 8600 5050
Wire Wire Line
	8900 4950 9450 4950
Wire Wire Line
	8900 5050 9450 5050
Wire Wire Line
	8900 5150 9450 5150
$Comp
L power:GND #PWR053
U 1 1 5DD2CC69
P 8400 4950
F 0 "#PWR053" H 8400 4700 50  0001 C CNN
F 1 "GND" V 8405 4822 50  0000 R CNN
F 2 "" H 8400 4950 50  0001 C CNN
F 3 "" H 8400 4950 50  0001 C CNN
	1    8400 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	8400 4950 8600 4950
$Comp
L power:GND #PWR054
U 1 1 5DD2DED3
P 8400 5150
F 0 "#PWR054" H 8400 4900 50  0001 C CNN
F 1 "GND" V 8405 5022 50  0000 R CNN
F 2 "" H 8400 5150 50  0001 C CNN
F 3 "" H 8400 5150 50  0001 C CNN
	1    8400 5150
	0    1    1    0   
$EndComp
Wire Wire Line
	8400 5150 8600 5150
Text Notes 7200 5150 0    44   ~ 0
By default, select MSPI \nmode, so the ECP5 will \nself-configure from flash.
Wire Wire Line
	9450 4750 6950 4750
Wire Wire Line
	6950 4750 6950 1450
Wire Wire Line
	6950 1450 7350 1450
Wire Wire Line
	8350 1150 9050 1150
Wire Wire Line
	9050 1150 9050 3400
Wire Wire Line
	9050 3400 9450 3400
Wire Wire Line
	9450 3300 8950 3300
Wire Wire Line
	8950 3300 8950 1250
Wire Wire Line
	8950 1250 8350 1250
Wire Wire Line
	8350 1450 8850 1450
Wire Wire Line
	8850 1450 8850 3200
Wire Wire Line
	8850 3200 9450 3200
Wire Wire Line
	9450 3100 8750 3100
Wire Wire Line
	8750 3100 8750 1550
Wire Wire Line
	8750 1550 8350 1550
Wire Wire Line
	9450 3700 7050 3700
Wire Wire Line
	7050 3700 7050 1250
Wire Wire Line
	7050 1250 7350 1250
Text Label 9200 3700 0    44   ~ 0
~CS_DI
Text Label 9250 3400 0    44   ~ 0
D0
Text Label 9250 3300 0    44   ~ 0
D1
Text Label 9250 3200 0    44   ~ 0
D2
Text Label 9250 3100 0    44   ~ 0
D3
Text Label 8900 4750 2    50   ~ 0
FPGA_CONFIG_CLK
Text Label 8900 4200 2    50   ~ 0
TMS
Text Label 8900 4300 2    50   ~ 0
FPGA_TCK
Text Label 8900 4400 2    50   ~ 0
FPGA_TDI
Text Label 8900 4500 2    50   ~ 0
FPGA_TDO
Text Label 9000 4950 0    50   ~ 0
FPGA_CFG0
Text Label 9000 5050 0    50   ~ 0
FPGA_CFG1
Text Label 9000 5150 0    50   ~ 0
FPGA_CFG2
Text Label 8900 5400 0    50   ~ 0
FPGA_DONE
Text Label 8900 5500 0    50   ~ 0
~FPGA_INIT
Text Label 8900 5600 0    50   ~ 0
~FPGA_PROGRAM
Text Label 5200 3150 0    50   ~ 0
FPGA_TDI
Text Label 5200 3250 0    50   ~ 0
FPGA_TCK
Text Label 5200 2950 0    50   ~ 0
FPGA_TDO
Text Label 5200 3050 0    50   ~ 0
FPGA_TMS
Text Label 8900 4200 2    50   ~ 0
FPGA_TMS
Wire Wire Line
	5750 4300 9450 4300
Wire Wire Line
	1350 6450 1550 6450
$Comp
L Connector:Conn_ARM_JTAG_SWD_10 J6
U 1 1 5DB28143
P 2050 6750
F 0 "J6" H 1800 7450 50  0000 R CNN
F 1 "Conn_ARM_JTAG_SWD_10" H 1800 7350 50  0000 R CNN
F 2 "luna:SWD_CONNECTOR_LARGE_BOX" H 2050 6750 50  0001 C CNN
F 3 "http://infocenter.arm.com/help/topic/com.arm.doc.ddi0314h/DDI0314H_coresight_components_trm.pdf" V 1700 5500 50  0001 C CNN
F 4 "CONN HEADER VERT 10POS 1.27MM" H 2050 6750 50  0001 C CNN "Description"
F 5 "Samtec" H 2050 6750 50  0001 C CNN "Manufacturer"
F 6 "FTSH-105-01-F-D-K" H 2050 6750 50  0001 C CNN "Part Number"
	1    2050 6750
	-1   0    0    -1  
$EndComp
NoConn ~ 1550 6850
NoConn ~ 1550 6950
$Comp
L power:GND #PWR049
U 1 1 5DB45414
P 2100 7500
F 0 "#PWR049" H 2100 7250 50  0001 C CNN
F 1 "GND" H 2104 7328 50  0000 C CNN
F 2 "" H 2100 7500 50  0001 C CNN
F 3 "" H 2100 7500 50  0001 C CNN
	1    2100 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 7400 2100 7500
Wire Wire Line
	2050 7350 2050 7400
Wire Wire Line
	2050 7400 2100 7400
Wire Wire Line
	2150 7350 2150 7400
Wire Wire Line
	2150 7400 2100 7400
Connection ~ 2100 7400
$Comp
L power:+3V3 #PWR048
U 1 1 5DB4C59C
P 2050 6000
F 0 "#PWR048" H 2050 5850 50  0001 C CNN
F 1 "+3V3" H 2064 6173 50  0000 C CNN
F 2 "" H 2050 6000 50  0001 C CNN
F 3 "" H 2050 6000 50  0001 C CNN
	1    2050 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 6000 2050 6150
Text Label 2150 2750 0    50   ~ 0
UC_SWDCLK
Wire Wire Line
	950  6650 1550 6650
Wire Wire Line
	850  6750 1550 6750
Text Label 2150 2850 0    50   ~ 0
UC_SWDIO
Wire Wire Line
	5750 4300 5750 3250
Wire Wire Line
	5950 3150 5950 4400
Wire Wire Line
	5950 4400 9450 4400
Wire Wire Line
	5850 2950 5850 4500
Wire Wire Line
	5850 4500 9450 4500
Wire Wire Line
	5650 3050 5650 4200
NoConn ~ 9450 2900
NoConn ~ 9450 3000
NoConn ~ 9450 3500
NoConn ~ 9450 3600
NoConn ~ 9450 3800
NoConn ~ 9450 3900
Wire Wire Line
	4000 6650 3400 6650
Wire Wire Line
	4000 6750 3400 6750
Wire Wire Line
	4000 6850 3400 6850
Wire Wire Line
	4000 6950 3400 6950
Text Label 3400 6650 0    50   ~ 0
FPGA_TCK
Text Label 3400 6750 0    50   ~ 0
FPGA_TMS
Text Label 3400 6850 0    50   ~ 0
FPGA_TDO
Text Label 3400 6950 0    50   ~ 0
FPGA_TDI
NoConn ~ 4000 6450
Wire Wire Line
	5650 4200 9450 4200
$Comp
L Device:R R25
U 1 1 5E28BD64
P 2050 2300
F 0 "R25" H 2120 2345 50  0000 L CNN
F 1 "10K" V 2050 2250 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 1980 2300 50  0001 C CNN
F 3 "~" H 2050 2300 50  0001 C CNN
F 4 "GENERIC-RES-0402-10K" H 2050 2300 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 2050 2300 50  0001 C CNN "Substitution"
	1    2050 2300
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0103
U 1 1 5E29AB77
P 2050 2150
F 0 "#PWR0103" H 2050 2000 50  0001 C CNN
F 1 "+3V3" H 2064 2323 50  0000 C CNN
F 2 "" H 2050 2150 50  0001 C CNN
F 3 "" H 2050 2150 50  0001 C CNN
	1    2050 2150
	1    0    0    -1  
$EndComp
Text HLabel 1250 2550 0    50   Input ~ 0
RESET
Text HLabel 6050 3150 2    50   Output ~ 0
UC_TX_FPGA_RX
Text HLabel 6050 3050 2    50   Input ~ 0
UC_RX_FPGA_TX
NoConn ~ 9450 2700
NoConn ~ 9450 2800
Text Label 1050 6750 0    50   ~ 0
UC_SWDIO
Text Label 1050 6650 0    50   ~ 0
UC_SWDCLK
Wire Wire Line
	5650 3050 6050 3050
Connection ~ 5650 3050
Wire Wire Line
	5950 3150 6050 3150
Connection ~ 5950 3150
Text Notes 6000 2850 0    50   ~ 0
JTAG pins may be\nused for UART when\nJTAG is not in use
Wire Wire Line
	5950 3150 3700 3150
Wire Wire Line
	3800 3950 3900 3950
Connection ~ 3800 3950
Wire Wire Line
	3800 4150 3900 4150
Wire Wire Line
	3800 3950 3800 4150
Wire Wire Line
	3700 3850 5000 3850
Wire Wire Line
	5000 3750 3700 3750
Text HLabel 5000 3750 2    50   BiDi ~ 0
SIDEBAND_D-
Text HLabel 5000 3850 2    50   BiDi ~ 0
SIDEBAND_D+
Connection ~ 4900 3650
Wire Wire Line
	4900 3950 4900 3650
Wire Wire Line
	4900 3650 4900 3550
Text Notes 1600 3450 0    50   ~ 0
assert to enter recovery,\nor to force-enter DFU;\noverride INHIBIT_USB
Wire Wire Line
	2600 3150 2700 3150
Wire Wire Line
	2600 3050 2700 3050
Wire Wire Line
	3700 2850 3800 2850
Wire Wire Line
	5250 2650 3700 2650
Wire Wire Line
	3800 2550 3700 2550
Wire Wire Line
	3700 2450 3800 2450
Wire Wire Line
	3700 2350 3800 2350
Wire Wire Line
	3200 1850 3200 2150
$Comp
L power:+3V3 #PWR0112
U 1 1 5FAF747F
P 3200 1850
F 0 "#PWR0112" H 3200 1700 50  0001 C CNN
F 1 "+3V3" H 3215 2023 50  0000 C CNN
F 2 "" H 3200 1850 50  0001 C CNN
F 3 "" H 3200 1850 50  0001 C CNN
	1    3200 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 4150 3200 4250
$Comp
L MCU_Microchip_SAMD:ATSAMD11D14A-M U6
U 1 1 5FAD0234
P 3200 3150
F 0 "U6" H 3400 4250 50  0000 L CNN
F 1 "ATSAMD11D14A-MUT" H 3400 4150 50  0000 L CNN
F 2 "Package_DFN_QFN:QFN-24-1EP_4x4mm_P0.5mm_EP2.6x2.6mm" H 3200 1800 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-42363-SAM-D11_Datasheet.pdf" H 3200 2150 50  0001 C CNN
F 4 "IC MCU 32BIT 16KB FLASH 24QFN" H 3200 3150 50  0001 C CNN "Description"
F 5 "Microchip" H 3200 3150 50  0001 C CNN "Manufacturer"
F 6 "ATSAMD11D14A-MUT" H 3200 3150 50  0001 C CNN "Part Number"
	1    3200 3150
	1    0    0    -1  
$EndComp
Text Label 2600 3050 2    50   ~ 0
~FPGA_PROGRAM
Wire Wire Line
	3700 3350 3900 3350
Wire Wire Line
	3700 3450 3900 3450
Wire Wire Line
	3700 3550 3900 3550
Wire Wire Line
	3700 3950 3800 3950
Wire Wire Line
	3700 3650 3900 3650
$Comp
L Device:LED D10
U 1 1 5DB78DC3
P 4600 3350
F 0 "D10" H 4750 3400 50  0000 C CNN
F 1 "BLUE" H 4300 3400 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4600 3350 50  0001 C CNN
F 3 "~" H 4600 3350 50  0001 C CNN
F 4 "GENERIC-LED-0603-BLUE" H 4600 3350 50  0001 C CNN "Part Number"
	1    4600 3350
	1    0    0    1   
$EndComp
Text HLabel 2600 3150 0    50   BiDi ~ 0
INHIBIT_UC_USB
Text Notes 1600 4200 0    50   ~ 0
assert this signal from the\nFPGA to tristate the the uC’s \nUSB connections\n\nor assert from the UC to\nprevent the FPGA from\ndriving the USB (used in\nrecovery modes)
Text HLabel 3900 4150 2    50   Input ~ 0
FORCE_DFU
Text HLabel 3800 2750 2    50   Input ~ 0
TARGET_PHY_1V8
Text HLabel 3800 2450 2    50   Input ~ 0
HOST_PHY_1V8
Text HLabel 3800 2350 2    50   Input ~ 0
SIDEBAND_PHY_1V8
$Comp
L power:+2V5 #PWR046
U 1 1 5DC1FF9A
P 3800 2550
F 0 "#PWR046" H 3800 2400 50  0001 C CNN
F 1 "+2V5" V 3800 2700 50  0000 L CNN
F 2 "" H 3800 2550 50  0001 C CNN
F 3 "" H 3800 2550 50  0001 C CNN
	1    3800 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	4200 3950 4450 3950
Wire Wire Line
	4200 3650 4450 3650
Wire Wire Line
	4450 3550 4200 3550
Wire Wire Line
	4450 3450 4200 3450
Wire Wire Line
	4200 3350 4450 3350
$Comp
L Device:R R11
U 1 1 5DB9291B
P 4050 3950
F 0 "R11" V 4000 3750 50  0000 C CNN
F 1 "330" V 4050 3950 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 3980 3950 50  0001 C CNN
F 3 "~" H 4050 3950 50  0001 C CNN
F 4 "GENERIC-RES-0402-330" H 4050 3950 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 4050 3950 50  0001 C CNN "Substitution"
	1    4050 3950
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 5DB927C5
P 4050 3650
F 0 "R10" V 4000 3450 50  0000 C CNN
F 1 "330" V 4050 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 3980 3650 50  0001 C CNN
F 3 "~" H 4050 3650 50  0001 C CNN
F 4 "GENERIC-RES-0402-330" H 4050 3650 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 4050 3650 50  0001 C CNN "Substitution"
	1    4050 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 5DB925B2
P 4050 3550
F 0 "R9" V 4000 3350 50  0000 C CNN
F 1 "330" V 4050 3550 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 3980 3550 50  0001 C CNN
F 3 "~" H 4050 3550 50  0001 C CNN
F 4 "GENERIC-RES-0402-330" H 4050 3550 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 4050 3550 50  0001 C CNN "Substitution"
	1    4050 3550
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5DB92432
P 4050 3450
F 0 "R8" V 4000 3250 50  0000 C CNN
F 1 "330" V 4050 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 3980 3450 50  0001 C CNN
F 3 "~" H 4050 3450 50  0001 C CNN
F 4 "GENERIC-RES-0402-330" H 4050 3450 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 4050 3450 50  0001 C CNN "Substitution"
	1    4050 3450
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 5DB91130
P 4050 3350
F 0 "R7" V 4000 3150 50  0000 C CNN
F 1 "330" V 4050 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 3980 3350 50  0001 C CNN
F 3 "~" H 4050 3350 50  0001 C CNN
F 4 "GENERIC-RES-0402-330" H 4050 3350 50  0001 C CNN "Part Number"
F 5 "any equivalent" H 4050 3350 50  0001 C CNN "Substitution"
	1    4050 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 3550 4900 3550
$Comp
L power:+3V3 #PWR047
U 1 1 5DB8CD6C
P 5100 3550
F 0 "#PWR047" H 5100 3400 50  0001 C CNN
F 1 "+3V3" V 5114 3678 50  0000 L CNN
F 2 "" H 5100 3550 50  0001 C CNN
F 3 "" H 5100 3550 50  0001 C CNN
	1    5100 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 3950 4900 3950
Wire Wire Line
	4750 3650 4900 3650
Connection ~ 4900 3550
Wire Wire Line
	4900 3550 4750 3550
Wire Wire Line
	4900 3450 4900 3350
Connection ~ 4900 3450
Wire Wire Line
	4750 3450 4900 3450
Wire Wire Line
	4900 3350 4750 3350
Wire Wire Line
	4900 3550 4900 3450
$Comp
L Device:LED D14
U 1 1 5DB7B4CC
P 4600 3950
F 0 "D14" H 4750 4000 50  0000 C CNN
F 1 "BLUE" H 4300 4000 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4600 3950 50  0001 C CNN
F 3 "~" H 4600 3950 50  0001 C CNN
F 4 "GENERIC-LED-0603-BLUE" H 4600 3950 50  0001 C CNN "Part Number"
	1    4600 3950
	1    0    0    1   
$EndComp
$Comp
L Device:LED D13
U 1 1 5DB7B14B
P 4600 3650
F 0 "D13" H 4750 3700 50  0000 C CNN
F 1 "PINK" H 4300 3700 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4600 3650 50  0001 C CNN
F 3 "~" H 4600 3650 50  0001 C CNN
F 4 "GENERIC-LED-0603-PINK" H 4600 3650 50  0001 C CNN "Part Number"
	1    4600 3650
	1    0    0    1   
$EndComp
$Comp
L Device:LED D12
U 1 1 5DB7AE70
P 4600 3550
F 0 "D12" H 4750 3600 50  0000 C CNN
F 1 "WHITE" H 4300 3600 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4600 3550 50  0001 C CNN
F 3 "~" H 4600 3550 50  0001 C CNN
F 4 "GENERIC-LED-0603-WHITE" H 4600 3550 50  0001 C CNN "Part Number"
	1    4600 3550
	1    0    0    1   
$EndComp
$Comp
L Device:LED D11
U 1 1 5DB7AB4E
P 4600 3450
F 0 "D11" H 4750 3500 50  0000 C CNN
F 1 "PINK" H 4300 3500 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4600 3450 50  0001 C CNN
F 3 "~" H 4600 3450 50  0001 C CNN
F 4 "GENERIC-LED-0603-PINK" H 4600 3450 50  0001 C CNN "Part Number"
	1    4600 3450
	1    0    0    1   
$EndComp
Wire Wire Line
	3700 2950 5850 2950
Wire Wire Line
	3700 3250 5750 3250
Wire Wire Line
	3700 3050 5650 3050
$Comp
L power:GND #PWR044
U 1 1 5DD0C578
P 3200 4250
F 0 "#PWR044" H 3200 4000 50  0001 C CNN
F 1 "GND" H 3205 4077 50  0000 C CNN
F 2 "" H 3200 4250 50  0001 C CNN
F 3 "" H 3200 4250 50  0001 C CNN
	1    3200 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  2750 2700 2750
Wire Wire Line
	850  2850 2700 2850
Wire Wire Line
	1350 2550 2050 2550
Wire Wire Line
	2050 2450 2050 2550
Connection ~ 2050 2550
Wire Wire Line
	2050 2550 2700 2550
Wire Wire Line
	1250 2550 1350 2550
Connection ~ 1350 2550
$Comp
L Connector:TestPoint TP?
U 1 1 6001FEDC
P 6450 1150
AR Path="/6001FEDC" Ref="TP?"  Part="1" 
AR Path="/5DCAA6D2/6001FEDC" Ref="TP11"  Part="1" 
F 0 "TP11" H 6508 1268 50  0000 L CNN
F 1 "TestPoint" H 6508 1178 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 6650 1150 50  0001 C CNN
F 3 "~" H 6650 1150 50  0001 C CNN
F 4 "DNP" H 6450 1150 50  0001 C CNN "Note"
	1    6450 1150
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 60027FAC
P 5950 1150
AR Path="/60027FAC" Ref="TP?"  Part="1" 
AR Path="/5DCAA6D2/60027FAC" Ref="TP10"  Part="1" 
F 0 "TP10" H 6008 1268 50  0000 L CNN
F 1 "TestPoint" H 6008 1178 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 6150 1150 50  0001 C CNN
F 3 "~" H 6150 1150 50  0001 C CNN
F 4 "DNP" H 5950 1150 50  0001 C CNN "Note"
	1    5950 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 1250 6450 1250
Wire Wire Line
	6450 1250 6450 1150
Connection ~ 7050 1250
Wire Wire Line
	5950 1150 5950 1450
Wire Wire Line
	5950 1450 6950 1450
Connection ~ 6950 1450
Text Notes 4650 2450 0    50   ~ 0
rail monitors\nfor test
Wire Wire Line
	2000 1100 2800 1100
$Comp
L power:+3V3 #PWR045
U 1 1 5DD07968
P 2800 950
F 0 "#PWR045" H 2800 800 50  0001 C CNN
F 1 "+3V3" H 2815 1123 50  0000 C CNN
F 2 "" H 2800 950 50  0001 C CNN
F 3 "" H 2800 950 50  0001 C CNN
	1    2800 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 1100 2800 950 
Wire Wire Line
	9450 5400 7750 5400
Wire Wire Line
	9450 5500 8250 5500
Wire Wire Line
	9450 5600 8750 5600
Wire Wire Line
	8750 5600 8750 5700
$Comp
L Connector:TestPoint TP?
U 1 1 6003B95B
P 8750 5700
AR Path="/6003B95B" Ref="TP?"  Part="1" 
AR Path="/5DCAA6D2/6003B95B" Ref="TP14"  Part="1" 
F 0 "TP14" H 8808 5818 50  0000 L CNN
F 1 "TestPoint" H 8808 5728 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 8950 5700 50  0001 C CNN
F 3 "~" H 8950 5700 50  0001 C CNN
F 4 "DNP" H 8750 5700 50  0001 C CNN "Note"
	1    8750 5700
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 6007F34F
P 8250 5700
AR Path="/6007F34F" Ref="TP?"  Part="1" 
AR Path="/5DCAA6D2/6007F34F" Ref="TP13"  Part="1" 
F 0 "TP13" H 8308 5818 50  0000 L CNN
F 1 "TestPoint" H 8308 5728 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 8450 5700 50  0001 C CNN
F 3 "~" H 8450 5700 50  0001 C CNN
F 4 "DNP" H 8250 5700 50  0001 C CNN "Note"
	1    8250 5700
	-1   0    0    1   
$EndComp
Wire Wire Line
	8250 5500 8250 5700
$Comp
L Connector:TestPoint TP?
U 1 1 60089159
P 7750 5700
AR Path="/60089159" Ref="TP?"  Part="1" 
AR Path="/5DCAA6D2/60089159" Ref="TP12"  Part="1" 
F 0 "TP12" H 7808 5818 50  0000 L CNN
F 1 "TestPoint" H 7808 5728 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 7950 5700 50  0001 C CNN
F 3 "~" H 7950 5700 50  0001 C CNN
F 4 "DNP" H 7750 5700 50  0001 C CNN "Note"
	1    7750 5700
	-1   0    0    1   
$EndComp
Wire Wire Line
	7750 5400 7750 5700
$Comp
L power:+3V3 #PWR02
U 1 1 5FC94008
P 6950 5100
F 0 "#PWR02" H 6950 4950 50  0001 C CNN
F 1 "+3V3" H 6964 5273 50  0000 C CNN
F 2 "" H 6950 5100 50  0001 C CNN
F 3 "" H 6950 5100 50  0001 C CNN
	1    6950 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 5600 6950 5600
Wire Wire Line
	6950 5600 6950 5500
Connection ~ 8750 5600
Wire Wire Line
	6950 5100 6950 5200
Wire Wire Line
	6450 5600 6550 5600
Wire Wire Line
	6850 5600 6950 5600
Connection ~ 6950 5600
$Comp
L Device:R R?
U 1 1 5FD294F6
P 6950 5350
AR Path="/5FD294F6" Ref="R?"  Part="1" 
AR Path="/5DCAA6D2/5FD294F6" Ref="R6"  Part="1" 
F 0 "R6" V 7050 5350 50  0000 C CNN
F 1 "10K" V 6950 5350 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 6880 5350 50  0001 C CNN
F 3 "~" H 6950 5350 50  0001 C CNN
F 4 "GENERIC-RES-0402-10K" H 6950 5350 50  0001 C CNN "Part Number"
F 5 "DNP" V 6850 5350 50  0000 C CNN "Note"
F 6 "any equivalent" H 6950 5350 50  0001 C CNN "Substitution"
	1    6950 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FD39CA8
P 6700 5600
AR Path="/5FD39CA8" Ref="R?"  Part="1" 
AR Path="/5DCAA6D2/5FD39CA8" Ref="R5"  Part="1" 
F 0 "R5" V 6800 5600 50  0000 C CNN
F 1 "2.2K" V 6700 5600 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 6630 5600 50  0001 C CNN
F 3 "~" H 6700 5600 50  0001 C CNN
F 4 "GENERIC-RES-0402-2.2K" H 6700 5600 50  0001 C CNN "Part Number"
F 5 "DNP" V 6600 5600 50  0000 C CNN "Note"
F 6 "any equivalent" H 6700 5600 50  0001 C CNN "Substitution"
	1    6700 5600
	0    1    1    0   
$EndComp
Text Notes 5900 5450 0    44   ~ 0
Populate R5 and R6 to\nallow FPGA to trigger its\nown programming\n(not required unless U6\nis unpopulated).
Text HLabel 6450 5600 0    50   Input ~ 0
~FPGA_SELF_PROGRAM
$Comp
L power:+1V1 #PWR040
U 1 1 5DC0CC5E
P 3800 2850
F 0 "#PWR040" H 3800 2700 50  0001 C CNN
F 1 "+1V1" V 3815 2978 50  0000 L CNN
F 2 "" H 3800 2850 50  0001 C CNN
F 3 "" H 3800 2850 50  0001 C CNN
	1    3800 2850
	0    1    1    0   
$EndComp
$Comp
L power:+3V3 #PWR0124
U 1 1 5FF9BDE5
P 4500 6050
F 0 "#PWR0124" H 4500 5900 50  0001 C CNN
F 1 "+3V3" H 4514 6223 50  0000 C CNN
F 2 "" H 4500 6050 50  0001 C CNN
F 3 "" H 4500 6050 50  0001 C CNN
	1    4500 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 6050 4500 6150
$Comp
L power:GND #PWR043
U 1 1 5DCBE012
P 4500 7550
F 0 "#PWR043" H 4500 7300 50  0001 C CNN
F 1 "GND" V 4504 7422 50  0000 R CNN
F 2 "" H 4500 7550 50  0001 C CNN
F 3 "" H 4500 7550 50  0001 C CNN
	1    4500 7550
	0    1    1    0   
$EndComp
Wire Wire Line
	4550 7450 4600 7450
Connection ~ 4550 7450
Wire Wire Line
	4550 7550 4500 7550
Wire Wire Line
	4550 7450 4550 7550
Wire Wire Line
	4600 7450 4600 7350
Wire Wire Line
	4500 7450 4550 7450
Wire Wire Line
	4500 7350 4500 7450
$Comp
L Connector:Conn_ARM_JTAG_SWD_10 J5
U 1 1 5DC7E70D
P 4500 6750
F 0 "J5" H 4200 7450 50  0000 R CNN
F 1 "Conn_FPGA_JTAG_10" H 4200 7350 50  0000 R CNN
F 2 "luna:SWD_CONNECTOR_LARGE_BOX" H 4500 6750 50  0001 C CNN
F 3 "http://infocenter.arm.com/help/topic/com.arm.doc.ddi0314h/DDI0314H_coresight_components_trm.pdf" V 4150 5500 50  0001 C CNN
F 4 "CONN HEADER VERT 10POS 1.27MM" H 4500 6750 50  0001 C CNN "Description"
F 5 "Samtec" H 4500 6750 50  0001 C CNN "Manufacturer"
F 6 "FTSH-105-01-F-D-K" H 4500 6750 50  0001 C CNN "Part Number"
	1    4500 6750
	-1   0    0    -1  
$EndComp
NoConn ~ 2100 4750
$Comp
L power:GND #PWR0131
U 1 1 60198439
P 2100 5450
F 0 "#PWR0131" H 2100 5200 50  0001 C CNN
F 1 "GND" H 2104 5278 50  0000 C CNN
F 2 "" H 2100 5450 50  0001 C CNN
F 3 "" H 2100 5450 50  0001 C CNN
	1    2100 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 4550 950  4550
Wire Wire Line
	2000 4750 2000 4550
Wire Wire Line
	2000 5350 1350 5350
Wire Wire Line
	2000 5250 2000 5350
Wire Wire Line
	1900 4650 850  4650
Wire Wire Line
	1900 4750 1900 4650
$Comp
L power:+3V3 #PWR0133
U 1 1 60164576
P 1900 5450
F 0 "#PWR0133" H 1900 5300 50  0001 C CNN
F 1 "+3V3" H 1914 5623 50  0000 C CNN
F 2 "" H 1900 5450 50  0001 C CNN
F 3 "" H 1900 5450 50  0001 C CNN
	1    1900 5450
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J10
U 1 1 60114D15
P 2000 5050
F 0 "J10" V 2096 4862 50  0000 R CNN
F 1 "TC_SWD" V 2005 4862 50  0000 R CNN
F 2 "Connector:Tag-Connect_TC2030-IDC-FP_2x03_P1.27mm_Vertical" H 2000 5050 50  0001 C CNN
F 3 "~" H 2000 5050 50  0001 C CNN
F 4 "Tag-Connect" H 2000 5050 50  0001 C CNN "Manufacturer"
F 5 "DNP" H 2000 5050 50  0001 C CNN "Note"
F 6 "TC2030-IDC" H 2000 5050 50  0001 C CNN "Part Number"
	1    2000 5050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	950  2750 950  4550
Wire Wire Line
	850  2850 850  4650
Wire Wire Line
	1350 2550 1350 5350
Connection ~ 850  4650
Wire Wire Line
	850  4650 850  6750
Connection ~ 950  4550
Wire Wire Line
	950  4550 950  6650
Connection ~ 1350 5350
Wire Wire Line
	1350 5350 1350 6450
Wire Wire Line
	1900 5250 1900 5450
Wire Wire Line
	2100 5250 2100 5450
Text HLabel 5350 1450 0    50   Input ~ 0
TARGET_VBUS_C
$Comp
L Device:R R?
U 1 1 5FE432BE
P 5450 2200
AR Path="/5DCD9772/5FE432BE" Ref="R?"  Part="1" 
AR Path="/5DCAA6D2/5FE432BE" Ref="R43"  Part="1" 
F 0 "R43" H 5200 2100 50  0000 C CNN
F 1 "8.06k+1%" H 5200 2200 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 5380 2200 50  0001 C CNN
F 3 "~" H 5450 2200 50  0001 C CNN
F 4 "RES SMD 8.06K OHM 1% 1/10W 0402" H 5450 2200 50  0001 C CNN "Description"
F 5 "Panasonic" H 5450 2200 50  0001 C CNN "Manufacturer"
F 6 "ERJ-2RKF8061X" H 5450 2200 50  0001 C CNN "Part Number"
F 7 "any equivalent" H 5450 2200 50  0001 C CNN "Substitution"
	1    5450 2200
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5FE510BF
P 5450 1700
AR Path="/5DCD9772/5FE510BF" Ref="R?"  Part="1" 
AR Path="/5DCAA6D2/5FE510BF" Ref="R4"  Part="1" 
F 0 "R4" H 5200 1600 50  0000 C CNN
F 1 "8.06k+1%" H 5200 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 5380 1700 50  0001 C CNN
F 3 "~" H 5450 1700 50  0001 C CNN
F 4 "RES SMD 8.06K OHM 1% 1/10W 0402" H 5450 1700 50  0001 C CNN "Description"
F 5 "Panasonic" H 5450 1700 50  0001 C CNN "Manufacturer"
F 6 "ERJ-2RKF8061X" H 5450 1700 50  0001 C CNN "Part Number"
F 7 "any equivalent" H 5450 1700 50  0001 C CNN "Substitution"
	1    5450 1700
	-1   0    0    1   
$EndComp
Wire Wire Line
	5250 1950 5250 2650
Wire Wire Line
	5250 1950 5450 1950
Wire Wire Line
	5450 1950 5450 2050
Wire Wire Line
	5450 1950 5450 1850
Connection ~ 5450 1950
$Comp
L power:GND #PWR016
U 1 1 5FE88B44
P 5450 2450
F 0 "#PWR016" H 5450 2200 50  0001 C CNN
F 1 "GND" H 5455 2277 50  0000 C CNN
F 2 "" H 5450 2450 50  0001 C CNN
F 3 "" H 5450 2450 50  0001 C CNN
	1    5450 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2450 5450 2350
Wire Wire Line
	5350 1450 5450 1450
Wire Wire Line
	5450 1450 5450 1550
Wire Wire Line
	3700 2750 3800 2750
Text Label 4350 2650 0    50   ~ 0
HALF_TARGET_VBUS_C
$EndSCHEMATC
