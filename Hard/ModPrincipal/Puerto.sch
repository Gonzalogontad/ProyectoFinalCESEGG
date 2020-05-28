EESchema Schematic File Version 4
LIBS:ModPrincipal-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 8
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
L Connector_Generic:Conn_02x05_Odd_Even J602
U 1 1 5EE5AF19
P 3850 1800
F 0 "J602" H 3900 2217 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 3900 2126 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x05_P2.54mm_Horizontal" H 3850 1800 50  0001 C CNN
F 3 "~" H 3850 1800 50  0001 C CNN
	1    3850 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 1600 3650 1600
Wire Wire Line
	3650 1800 4150 1800
Wire Wire Line
	4150 2000 3650 2000
Text HLabel 3350 3300 0    50   Input ~ 0
Out_Digital1
Text HLabel 3350 3400 0    50   Input ~ 0
Out_Digital2
Text HLabel 3350 3200 0    50   Input ~ 0
Out_Digital0
Text HLabel 3350 3600 0    50   Output ~ 0
In_Digital1
Text HLabel 3350 3700 0    50   Output ~ 0
In_Digital2
Text HLabel 3350 3500 0    50   Output ~ 0
In_Digital0
Text HLabel 4450 2900 2    50   Input ~ 0
Out_Analog0
Text HLabel 3350 2800 0    50   Output ~ 0
In_Analog0
Text HLabel 3350 3000 0    50   Output ~ 0
In_Analog1
$Comp
L power:GND #PWR0603
U 1 1 5EE71424
P 4200 3850
F 0 "#PWR0603" H 4200 3600 50  0001 C CNN
F 1 "GND" H 4205 3677 50  0000 C CNN
F 2 "" H 4200 3850 50  0001 C CNN
F 3 "" H 4200 3850 50  0001 C CNN
	1    4200 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0601
U 1 1 5EE71C71
P 2500 3150
F 0 "#PWR0601" H 2500 2900 50  0001 C CNN
F 1 "GNDA" H 2505 2977 50  0000 C CNN
F 2 "" H 2500 3150 50  0001 C CNN
F 3 "" H 2500 3150 50  0001 C CNN
	1    2500 3150
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0604
U 1 1 5EE72298
P 4450 3250
F 0 "#PWR0604" H 4450 3100 50  0001 C CNN
F 1 "+12V" H 4465 3423 50  0000 C CNN
F 2 "" H 4450 3250 50  0001 C CNN
F 3 "" H 4450 3250 50  0001 C CNN
	1    4450 3250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0605
U 1 1 5EE727FD
P 4550 3450
F 0 "#PWR0605" H 4550 3300 50  0001 C CNN
F 1 "+5V" H 4565 3623 50  0000 C CNN
F 2 "" H 4550 3450 50  0001 C CNN
F 3 "" H 4550 3450 50  0001 C CNN
	1    4550 3450
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0606
U 1 1 5EE72A4A
P 4700 3600
F 0 "#PWR0606" H 4700 3450 50  0001 C CNN
F 1 "+3.3V" H 4715 3773 50  0000 C CNN
F 2 "" H 4700 3600 50  0001 C CNN
F 3 "" H 4700 3600 50  0001 C CNN
	1    4700 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 2800 3550 2800
Wire Wire Line
	3350 3000 3550 3000
Wire Wire Line
	3350 3200 3550 3200
Wire Wire Line
	3350 3300 3550 3300
$Comp
L Connector_Generic:Conn_02x10_Odd_Even J601
U 1 1 5EE8E115
P 3750 3200
F 0 "J601" H 3800 3817 50  0000 C CNN
F 1 "Conn_02x10_Odd_Even" H 3800 3726 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x10_P2.54mm_Horizontal" H 3750 3200 50  0001 C CNN
F 3 "~" H 3750 3200 50  0001 C CNN
	1    3750 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 3700 3550 3700
Wire Wire Line
	3350 3600 3550 3600
Wire Wire Line
	3350 3500 3550 3500
Wire Wire Line
	3550 3400 3350 3400
Wire Wire Line
	4050 3700 4700 3700
Wire Wire Line
	4700 3700 4700 3600
Wire Wire Line
	4050 3500 4550 3500
Wire Wire Line
	4550 3500 4550 3450
Wire Wire Line
	4050 3300 4450 3300
Wire Wire Line
	4450 3300 4450 3250
Wire Wire Line
	4050 3100 4200 3100
Wire Wire Line
	4200 3100 4200 3200
Wire Wire Line
	4200 3600 4050 3600
Wire Wire Line
	4050 3400 4200 3400
Connection ~ 4200 3400
Wire Wire Line
	4200 3400 4200 3600
Wire Wire Line
	4050 3200 4200 3200
Connection ~ 4200 3200
Wire Wire Line
	4200 3200 4200 3400
Wire Wire Line
	4200 3850 4200 3600
Connection ~ 4200 3600
Wire Wire Line
	4450 2900 4050 2900
Wire Wire Line
	4050 2800 4200 2800
Wire Wire Line
	4200 2800 4200 3000
Wire Wire Line
	4050 3000 4200 3000
Wire Wire Line
	3550 3100 2500 3100
Wire Wire Line
	2500 3100 2500 3150
Wire Wire Line
	3550 2900 2500 2900
Wire Wire Line
	2500 2900 2500 3100
Connection ~ 2500 3100
$Comp
L power:GNDA #PWR0607
U 1 1 5EEABF2C
P 4950 3050
F 0 "#PWR0607" H 4950 2800 50  0001 C CNN
F 1 "GNDA" H 4955 2877 50  0000 C CNN
F 2 "" H 4950 3050 50  0001 C CNN
F 3 "" H 4950 3050 50  0001 C CNN
	1    4950 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 3000 4950 3050
Wire Wire Line
	4950 3000 4200 3000
Connection ~ 4200 3000
$Comp
L power:GNDPWR #PWR0602
U 1 1 5EEC9156
P 3350 2100
F 0 "#PWR0602" H 3350 1900 50  0001 C CNN
F 1 "GNDPWR" H 3354 1946 50  0000 C CNN
F 2 "" H 3350 2050 50  0001 C CNN
F 3 "" H 3350 2050 50  0001 C CNN
	1    3350 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 1600 3650 1600
Connection ~ 3650 1600
Wire Wire Line
	3350 1800 3650 1800
Connection ~ 3650 1800
Wire Wire Line
	3350 2100 3350 2000
Wire Wire Line
	3350 2000 3650 2000
Connection ~ 3650 2000
Text HLabel 3350 1600 0    50   Input ~ 0
Out_L_220
Text HLabel 3350 1800 0    50   Input ~ 0
Out_N_220
$EndSCHEMATC
