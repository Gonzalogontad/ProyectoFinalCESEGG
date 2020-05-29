EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 8
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L BluePill:BP U801
U 1 1 5ED9CBD1
P 4650 3450
F 0 "U801" H 4650 4703 60  0000 C CNN
F 1 "BP" H 4650 4597 60  0000 C CNN
F 2 "BluePill:BLUEPILL" H 4550 4200 60  0001 C CNN
F 3 "" H 4550 4200 60  0001 C CNN
	1    4650 3450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0803
U 1 1 5ED9E304
P 4800 2300
F 0 "#PWR0803" H 4800 2150 50  0001 C CNN
F 1 "+5V" H 4815 2473 50  0000 C CNN
F 2 "" H 4800 2300 50  0001 C CNN
F 3 "" H 4800 2300 50  0001 C CNN
	1    4800 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 2300 4800 2400
$Comp
L power:GND #PWR0804
U 1 1 5ED9EF1C
P 4800 4600
F 0 "#PWR0804" H 4800 4350 50  0001 C CNN
F 1 "GND" H 4805 4427 50  0000 C CNN
F 2 "" H 4800 4600 50  0001 C CNN
F 3 "" H 4800 4600 50  0001 C CNN
	1    4800 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4600 4800 4500
Text HLabel 3600 2950 0    50   Input ~ 0
ADC0
Text HLabel 3600 3050 0    50   Input ~ 0
ADC1
Wire Wire Line
	3600 2950 3900 2950
Wire Wire Line
	3600 3050 3900 3050
Text HLabel 5750 3650 2    50   Input ~ 0
UART_RX
Text HLabel 5750 3750 2    50   Output ~ 0
UART_TX
Wire Wire Line
	5750 3650 5400 3650
Wire Wire Line
	5400 3750 5750 3750
$Comp
L power:GND #PWR0805
U 1 1 5EDA9158
P 5800 4750
F 0 "#PWR0805" H 5800 4500 50  0001 C CNN
F 1 "GND" H 5805 4577 50  0000 C CNN
F 2 "" H 5800 4750 50  0001 C CNN
F 3 "" H 5800 4750 50  0001 C CNN
	1    5800 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R801
U 1 1 5EDAA787
P 5550 4450
F 0 "R801" H 5620 4496 50  0000 L CNN
F 1 "R" H 5620 4405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5480 4450 50  0001 C CNN
F 3 "~" H 5550 4450 50  0001 C CNN
	1    5550 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R802
U 1 1 5EDAD0E8
P 5800 4450
F 0 "R802" H 5870 4496 50  0000 L CNN
F 1 "R" H 5870 4405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5730 4450 50  0001 C CNN
F 3 "~" H 5800 4450 50  0001 C CNN
	1    5800 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R803
U 1 1 5EDAD1E4
P 6050 4450
F 0 "R803" H 6120 4496 50  0000 L CNN
F 1 "R" H 6120 4405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5980 4450 50  0001 C CNN
F 3 "~" H 6050 4450 50  0001 C CNN
	1    6050 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R804
U 1 1 5EDAEC6A
P 6300 4450
F 0 "R804" H 6370 4496 50  0000 L CNN
F 1 "R" H 6370 4405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6230 4450 50  0001 C CNN
F 3 "~" H 6300 4450 50  0001 C CNN
	1    6300 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 4250 5550 4250
Wire Wire Line
	5550 4250 5550 4300
Wire Wire Line
	5400 4150 5800 4150
Wire Wire Line
	5800 4150 5800 4300
Wire Wire Line
	5400 4050 6050 4050
Wire Wire Line
	6050 4050 6050 4300
Wire Wire Line
	5400 3950 6300 3950
Wire Wire Line
	6300 3950 6300 4300
Wire Wire Line
	5550 4600 5550 4650
Wire Wire Line
	5550 4650 5800 4650
Wire Wire Line
	6300 4650 6300 4600
Connection ~ 5800 4650
Wire Wire Line
	5800 4650 6050 4650
Wire Wire Line
	6050 4600 6050 4650
Connection ~ 6050 4650
Wire Wire Line
	6050 4650 6300 4650
Wire Wire Line
	5800 4600 5800 4650
Wire Wire Line
	5800 4650 5800 4750
Text HLabel 3600 3150 0    50   Output ~ 0
ModPowerOut
Text HLabel 3600 3250 0    50   Output ~ 0
ModOut0
Text HLabel 3600 3350 0    50   Output ~ 0
ModOut1
Text HLabel 3600 3450 0    50   Output ~ 0
ModOut2
Wire Wire Line
	3600 3150 3900 3150
Wire Wire Line
	3900 3250 3600 3250
Wire Wire Line
	3600 3350 3900 3350
Wire Wire Line
	3600 3450 3900 3450
Text HLabel 5750 3250 2    50   Input ~ 0
ModIn0
Text HLabel 5750 3150 2    50   Input ~ 0
ModIn1
Text HLabel 5750 3050 2    50   Input ~ 0
ModIn2
Wire Wire Line
	5750 3050 5400 3050
Wire Wire Line
	5400 3150 5750 3150
Wire Wire Line
	5750 3250 5400 3250
Text HLabel 6300 2950 2    50   Output ~ 0
SCL
Text HLabel 6300 2850 2    50   BiDi ~ 0
SDA
$Comp
L Connector_Generic:Conn_01x06 J801
U 1 1 5EDBAA35
P 2350 3750
F 0 "J801" H 2268 3225 50  0000 C CNN
F 1 "Conn_01x06" H 2268 3316 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 2350 3750 50  0001 C CNN
F 3 "~" H 2350 3750 50  0001 C CNN
	1    2350 3750
	-1   0    0    1   
$EndComp
Wire Wire Line
	2550 3550 3900 3550
Wire Wire Line
	3900 3650 2550 3650
Wire Wire Line
	2550 3750 3900 3750
Wire Wire Line
	3900 3850 2550 3850
$Comp
L power:+3.3V #PWR0801
U 1 1 5EDC0299
P 2700 3250
F 0 "#PWR0801" H 2700 3100 50  0001 C CNN
F 1 "+3.3V" H 2715 3423 50  0000 C CNN
F 2 "" H 2700 3250 50  0001 C CNN
F 3 "" H 2700 3250 50  0001 C CNN
	1    2700 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 3250 2700 3450
Wire Wire Line
	2700 3450 2550 3450
$Comp
L power:GND #PWR0802
U 1 1 5EDC14E8
P 2700 4100
F 0 "#PWR0802" H 2700 3850 50  0001 C CNN
F 1 "GND" H 2705 3927 50  0000 C CNN
F 2 "" H 2700 4100 50  0001 C CNN
F 3 "" H 2700 4100 50  0001 C CNN
	1    2700 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4100 2700 3950
Wire Wire Line
	2700 3950 2550 3950
$Comp
L Connector:TestPoint TP?
U 1 1 5ED3083E
P 5600 2650
AR Path="/5ECD8445/5ED3083E" Ref="TP?"  Part="1" 
AR Path="/5ED9C9D6/5ED3083E" Ref="TP801"  Part="1" 
F 0 "TP801" H 5658 2768 50  0000 L CNN
F 1 "TestPoint" H 5658 2677 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 5800 2650 50  0001 C CNN
F 3 "~" H 5800 2650 50  0001 C CNN
	1    5600 2650
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5ED31409
P 6050 2650
AR Path="/5ECD8445/5ED31409" Ref="TP?"  Part="1" 
AR Path="/5ED9C9D6/5ED31409" Ref="TP802"  Part="1" 
F 0 "TP802" H 6108 2768 50  0000 L CNN
F 1 "TestPoint" H 6108 2677 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 6250 2650 50  0001 C CNN
F 3 "~" H 6250 2650 50  0001 C CNN
	1    6050 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 2850 6050 2850
Wire Wire Line
	5400 2950 5600 2950
Wire Wire Line
	6050 2650 6050 2850
Connection ~ 6050 2850
Wire Wire Line
	6050 2850 5400 2850
Wire Wire Line
	5600 2650 5600 2950
Connection ~ 5600 2950
Wire Wire Line
	5600 2950 6300 2950
NoConn ~ 3900 2650
NoConn ~ 3900 2750
NoConn ~ 3900 2850
NoConn ~ 5400 2650
NoConn ~ 5400 2750
NoConn ~ 5400 3350
NoConn ~ 5400 3450
NoConn ~ 5400 3550
NoConn ~ 5400 3850
NoConn ~ 4500 2400
NoConn ~ 4650 2400
NoConn ~ 3900 3950
NoConn ~ 3900 4050
NoConn ~ 4500 4500
NoConn ~ 4600 4500
NoConn ~ 3900 4250
$EndSCHEMATC
