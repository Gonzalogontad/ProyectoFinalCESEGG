EESchema Schematic File Version 4
LIBS:Mod_Temp_Driver-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
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
L Connector_Generic:Conn_02x10_Odd_Even J?
U 1 1 5ED5CC20
P 3450 4500
F 0 "J?" H 3500 5117 50  0000 C CNN
F 1 "Conn_02x10_Odd_Even" H 3500 5026 50  0000 C CNN
F 2 "" H 3450 4500 50  0001 C CNN
F 3 "~" H 3450 4500 50  0001 C CNN
	1    3450 4500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J?
U 1 1 5ED5CC26
P 3350 2250
F 0 "J?" H 3400 2667 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 3400 2576 50  0000 C CNN
F 2 "" H 3350 2250 50  0001 C CNN
F 3 "~" H 3350 2250 50  0001 C CNN
	1    3350 2250
	1    0    0    -1  
$EndComp
Text Label 2450 2250 0    50   ~ 0
In_N_220
Text Label 2450 2050 0    50   ~ 0
In_L_220
$Comp
L power:GNDPWR #PWR?
U 1 1 5ED5CC2E
P 2900 2550
F 0 "#PWR?" H 2900 2350 50  0001 C CNN
F 1 "GNDPWR" H 2904 2396 50  0000 C CNN
F 2 "" H 2900 2500 50  0001 C CNN
F 3 "" H 2900 2500 50  0001 C CNN
	1    2900 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 2550 2900 2450
Wire Wire Line
	2900 2450 3150 2450
Wire Wire Line
	3150 2450 3650 2450
Connection ~ 3150 2450
Wire Wire Line
	3650 2250 3150 2250
Wire Wire Line
	3150 2250 2450 2250
Connection ~ 3150 2250
Wire Wire Line
	3650 2050 3150 2050
Wire Wire Line
	3150 2050 2450 2050
Connection ~ 3150 2050
Text Label 2600 4100 0    50   ~ 0
Out_Analog0
Text Label 2600 4300 0    50   ~ 0
Out_Analog1
Text Label 2600 4500 0    50   ~ 0
In_Digital0
Text Label 2600 4600 0    50   ~ 0
In_Digital1
Text Label 2600 4700 0    50   ~ 0
In_Digital2
Text Label 2600 4800 0    50   ~ 0
Out_Digital0
Text Label 2600 4900 0    50   ~ 0
Out_Digital1
Text Label 2600 5000 0    50   ~ 0
Out_Digital2
Text Label 4400 4200 2    50   ~ 0
In_Analog0
$Comp
L power:+12V #PWR?
U 1 1 5ED5CC47
P 4150 4550
F 0 "#PWR?" H 4150 4400 50  0001 C CNN
F 1 "+12V" H 4165 4723 50  0000 C CNN
F 2 "" H 4150 4550 50  0001 C CNN
F 3 "" H 4150 4550 50  0001 C CNN
	1    4150 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5ED5CC4D
P 4300 4750
F 0 "#PWR?" H 4300 4600 50  0001 C CNN
F 1 "+5V" H 4315 4923 50  0000 C CNN
F 2 "" H 4300 4750 50  0001 C CNN
F 3 "" H 4300 4750 50  0001 C CNN
	1    4300 4750
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5ED5CC53
P 4450 4950
F 0 "#PWR?" H 4450 4800 50  0001 C CNN
F 1 "+3.3V" H 4465 5123 50  0000 C CNN
F 2 "" H 4450 4950 50  0001 C CNN
F 3 "" H 4450 4950 50  0001 C CNN
	1    4450 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED5CC59
P 3950 5100
F 0 "#PWR?" H 3950 4850 50  0001 C CNN
F 1 "GND" H 3955 4927 50  0000 C CNN
F 2 "" H 3950 5100 50  0001 C CNN
F 3 "" H 3950 5100 50  0001 C CNN
	1    3950 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5ED5CC5F
P 2250 4450
F 0 "#PWR?" H 2250 4200 50  0001 C CNN
F 1 "GNDA" H 2255 4277 50  0000 C CNN
F 2 "" H 2250 4450 50  0001 C CNN
F 3 "" H 2250 4450 50  0001 C CNN
	1    2250 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 4200 2250 4200
Wire Wire Line
	2250 4200 2250 4400
Wire Wire Line
	3250 4400 2250 4400
Connection ~ 2250 4400
Wire Wire Line
	2250 4400 2250 4450
$Comp
L power:GNDA #PWR?
U 1 1 5ED5CC6A
P 4600 4350
F 0 "#PWR?" H 4600 4100 50  0001 C CNN
F 1 "GNDA" H 4605 4177 50  0000 C CNN
F 2 "" H 4600 4350 50  0001 C CNN
F 3 "" H 4600 4350 50  0001 C CNN
	1    4600 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 4350 4600 4300
Wire Wire Line
	4600 4100 3750 4100
Wire Wire Line
	3750 4300 4600 4300
Connection ~ 4600 4300
Wire Wire Line
	4600 4300 4600 4100
Wire Wire Line
	3750 4400 3950 4400
Wire Wire Line
	3950 4400 3950 4500
Wire Wire Line
	3750 4500 3950 4500
Connection ~ 3950 4500
Wire Wire Line
	3950 4500 3950 4700
Wire Wire Line
	3750 4700 3950 4700
Connection ~ 3950 4700
Wire Wire Line
	3950 4700 3950 4900
Wire Wire Line
	3750 4900 3950 4900
Connection ~ 3950 4900
Wire Wire Line
	3950 4900 3950 5100
Wire Wire Line
	3750 5000 4450 5000
Wire Wire Line
	4450 5000 4450 4950
Wire Wire Line
	3750 4800 4300 4800
Wire Wire Line
	4300 4800 4300 4750
Wire Wire Line
	3750 4600 4150 4600
Wire Wire Line
	4150 4600 4150 4550
Wire Wire Line
	3750 4200 4400 4200
Wire Wire Line
	3250 4100 2600 4100
Wire Wire Line
	3250 4300 2600 4300
Wire Wire Line
	2600 4500 3250 4500
Wire Wire Line
	3250 4600 2600 4600
Wire Wire Line
	2600 4700 3250 4700
Wire Wire Line
	3250 4800 2600 4800
Wire Wire Line
	2600 4900 3250 4900
Wire Wire Line
	3250 5000 2600 5000
NoConn ~ 3150 2150
NoConn ~ 3650 2150
NoConn ~ 3650 2350
NoConn ~ 3150 2350
$Comp
L Relay:G5LE-1 K?
U 1 1 5ED5E5F0
P 6250 2800
F 0 "K?" H 6680 2846 50  0000 L CNN
F 1 "G5LE-1" H 6680 2755 50  0000 L CNN
F 2 "Relay_THT:Relay_SPDT_Omron-G5LE-1" H 6700 2750 50  0001 L CNN
F 3 "http://www.omron.com/ecb/products/pdf/en-g5le.pdf" H 6250 2800 50  0001 C CNN
	1    6250 2800
	1    0    0    -1  
$EndComp
$EndSCHEMATC
