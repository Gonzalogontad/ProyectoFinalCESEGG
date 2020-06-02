EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
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
U 1 1 5ED5A0E0
P 9600 4650
F 0 "J?" H 9650 5267 50  0000 C CNN
F 1 "Conn_02x10_Odd_Even" H 9650 5176 50  0000 C CNN
F 2 "" H 9600 4650 50  0001 C CNN
F 3 "~" H 9600 4650 50  0001 C CNN
	1    9600 4650
	1    0    0    -1  
$EndComp
Text Label 8750 4250 0    50   ~ 0
Out_Analog0
Text Label 8750 4450 0    50   ~ 0
Out_Analog1
Text Label 8750 4650 0    50   ~ 0
In_Digital0
Text Label 8750 4750 0    50   ~ 0
In_Digital1
Text Label 8750 4850 0    50   ~ 0
In_Digital2
Text Label 8750 4950 0    50   ~ 0
Out_Digital0
Text Label 8750 5050 0    50   ~ 0
Out_Digital1
Text Label 8750 5150 0    50   ~ 0
Out_Digital2
Text Label 10550 4350 2    50   ~ 0
In_Analog0
$Comp
L power:+12V #PWR?
U 1 1 5ED5A107
P 10300 4700
F 0 "#PWR?" H 10300 4550 50  0001 C CNN
F 1 "+12V" H 10315 4873 50  0000 C CNN
F 2 "" H 10300 4700 50  0001 C CNN
F 3 "" H 10300 4700 50  0001 C CNN
	1    10300 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5ED5A10D
P 10450 4900
F 0 "#PWR?" H 10450 4750 50  0001 C CNN
F 1 "+5V" H 10465 5073 50  0000 C CNN
F 2 "" H 10450 4900 50  0001 C CNN
F 3 "" H 10450 4900 50  0001 C CNN
	1    10450 4900
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5ED5A113
P 10600 5100
F 0 "#PWR?" H 10600 4950 50  0001 C CNN
F 1 "+3.3V" H 10615 5273 50  0000 C CNN
F 2 "" H 10600 5100 50  0001 C CNN
F 3 "" H 10600 5100 50  0001 C CNN
	1    10600 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED5A119
P 10100 5250
F 0 "#PWR?" H 10100 5000 50  0001 C CNN
F 1 "GND" H 10105 5077 50  0000 C CNN
F 2 "" H 10100 5250 50  0001 C CNN
F 3 "" H 10100 5250 50  0001 C CNN
	1    10100 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5ED5A11F
P 8400 4600
F 0 "#PWR?" H 8400 4350 50  0001 C CNN
F 1 "GNDA" H 8405 4427 50  0000 C CNN
F 2 "" H 8400 4600 50  0001 C CNN
F 3 "" H 8400 4600 50  0001 C CNN
	1    8400 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 4350 8400 4350
Wire Wire Line
	8400 4350 8400 4550
Wire Wire Line
	9400 4550 8400 4550
Connection ~ 8400 4550
Wire Wire Line
	8400 4550 8400 4600
$Comp
L power:GNDA #PWR?
U 1 1 5ED5A12A
P 10750 4500
F 0 "#PWR?" H 10750 4250 50  0001 C CNN
F 1 "GNDA" H 10755 4327 50  0000 C CNN
F 2 "" H 10750 4500 50  0001 C CNN
F 3 "" H 10750 4500 50  0001 C CNN
	1    10750 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10750 4500 10750 4450
Wire Wire Line
	10750 4250 9900 4250
Wire Wire Line
	9900 4450 10750 4450
Connection ~ 10750 4450
Wire Wire Line
	10750 4450 10750 4250
Wire Wire Line
	9900 4550 10100 4550
Wire Wire Line
	10100 4550 10100 4650
Wire Wire Line
	9900 4650 10100 4650
Connection ~ 10100 4650
Wire Wire Line
	10100 4650 10100 4850
Wire Wire Line
	9900 4850 10100 4850
Connection ~ 10100 4850
Wire Wire Line
	10100 4850 10100 5050
Wire Wire Line
	9900 5050 10100 5050
Connection ~ 10100 5050
Wire Wire Line
	10100 5050 10100 5250
Wire Wire Line
	9900 5150 10600 5150
Wire Wire Line
	10600 5150 10600 5100
Wire Wire Line
	9900 4950 10450 4950
Wire Wire Line
	10450 4950 10450 4900
Wire Wire Line
	9900 4750 10300 4750
Wire Wire Line
	10300 4750 10300 4700
Wire Wire Line
	9900 4350 10550 4350
Wire Wire Line
	8750 4650 9400 4650
Wire Wire Line
	9400 4750 8750 4750
Wire Wire Line
	8750 4850 9400 4850
Wire Wire Line
	9400 4950 8750 4950
Wire Wire Line
	8750 5050 9400 5050
Wire Wire Line
	9400 5150 8750 5150
Text Label 2600 1850 0    50   ~ 0
(+)Driver_In
$Comp
L Connector:Conn_01x11_Female J?
U 1 1 5EDA75F8
P 950 2050
F 0 "J?" H 842 1325 50  0000 C CNN
F 1 "Conn_01x11_Female" H 842 1416 50  0000 C CNN
F 2 "" H 950 2050 50  0001 C CNN
F 3 "~" H 950 2050 50  0001 C CNN
	1    950  2050
	-1   0    0    1   
$EndComp
Text Label 1850 1650 2    50   ~ 0
In_N_220
Text Label 1850 1750 2    50   ~ 0
In_L_220
Wire Wire Line
	1150 1650 1850 1650
Wire Wire Line
	1150 1750 1850 1750
Wire Wire Line
	1600 1450 1600 1550
$Comp
L power:GNDPWR #PWR?
U 1 1 5EDAAA7D
P 1600 1450
F 0 "#PWR?" H 1600 1250 50  0001 C CNN
F 1 "GNDPWR" H 1604 1296 50  0000 C CNN
F 2 "" H 1600 1400 50  0001 C CNN
F 3 "" H 1600 1400 50  0001 C CNN
	1    1600 1450
	-1   0    0    1   
$EndComp
Wire Wire Line
	1150 1550 1600 1550
Text Label 1150 1950 0    50   ~ 0
(-)Driver_In
Wire Wire Line
	2200 1950 2200 2100
$Comp
L power:GNDA #PWR?
U 1 1 5EDB7AE8
P 2200 2100
F 0 "#PWR?" H 2200 1850 50  0001 C CNN
F 1 "GNDA" H 2205 1927 50  0000 C CNN
F 2 "" H 2200 2100 50  0001 C CNN
F 3 "" H 2200 2100 50  0001 C CNN
	1    2200 2100
	1    0    0    -1  
$EndComp
Text Label 1600 2050 2    50   ~ 0
(+)Load
Text Label 1600 2150 2    50   ~ 0
(-)Load
Text Label 1700 2250 2    50   ~ 0
(+)R_Dimmer
Wire Wire Line
	1150 2250 1700 2250
Wire Wire Line
	1150 2350 1700 2350
Text Label 1700 2350 2    50   ~ 0
(-)R_Dimmer
Text Label 1700 2450 2    50   ~ 0
(+)V_Dimmer
Wire Wire Line
	1150 2450 1700 2450
Text Label 1700 2550 2    50   ~ 0
(-)V_Dimmer
$Comp
L Diode:1N4007 D?
U 1 1 5EFCD671
P 2350 1850
F 0 "D?" H 2350 1634 50  0000 C CNN
F 1 "1N4007" H 2350 1725 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 2350 1675 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 2350 1850 50  0001 C CNN
	1    2350 1850
	-1   0    0    1   
$EndComp
Wire Wire Line
	1150 1850 2200 1850
$Sheet
S 3800 1450 2950 1400
U 5F0ECABF
F0 "MedicionesAnalogicas" 118
F1 "MedicionesAnalogicas.sch" 118
F2 "V-Corriente" O R 6750 1750 50 
F3 "V-Tension" O R 6750 2050 50 
F4 "I-Driver" I L 3800 2550 50 
F5 "V-Driver" I L 3800 1850 50 
$EndSheet
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J?
U 1 1 5F1BC542
P 9350 2100
AR Path="/5ED5374F/5F1BC542" Ref="J?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F1BC542" Ref="J?"  Part="1" 
F 0 "J?" H 9400 2517 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 9400 2426 50  0000 C CNN
F 2 "" H 9350 2100 50  0001 C CNN
F 3 "~" H 9350 2100 50  0001 C CNN
	1    9350 2100
	1    0    0    -1  
$EndComp
Text Label 8450 2100 0    50   ~ 0
In_N_220
Text Label 8450 1900 0    50   ~ 0
In_L_220
$Comp
L power:GNDPWR #PWR?
U 1 1 5F1BC54A
P 8900 2400
AR Path="/5ED5374F/5F1BC54A" Ref="#PWR?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F1BC54A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8900 2200 50  0001 C CNN
F 1 "GNDPWR" H 8904 2246 50  0000 C CNN
F 2 "" H 8900 2350 50  0001 C CNN
F 3 "" H 8900 2350 50  0001 C CNN
	1    8900 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 2400 8900 2300
Wire Wire Line
	8900 2300 9150 2300
Wire Wire Line
	9150 2300 9650 2300
Connection ~ 9150 2300
Wire Wire Line
	9650 2100 9150 2100
Wire Wire Line
	9150 2100 8450 2100
Connection ~ 9150 2100
Wire Wire Line
	9650 1900 9150 1900
Wire Wire Line
	9150 1900 8450 1900
Connection ~ 9150 1900
NoConn ~ 9150 2000
NoConn ~ 9650 2000
NoConn ~ 9650 2200
NoConn ~ 9150 2200
$Sheet
S 3950 3450 2600 1600
U 5F20E931
F0 "CargayDimmer" 50
F1 "CargayDimmer.sch" 50
F2 "(+)Carga" B L 3950 4000 50 
F3 "(+)Driver" I L 3950 3700 50 
F4 "Carga_ON" I R 6550 4650 50 
F5 "DimRelay0" I R 6550 4750 50 
F6 "DimRelay1" I R 6550 4850 50 
F7 "DimV" O L 3950 4750 50 
F8 "DimmVoltage" I R 6550 3850 50 
F9 "(+)DimmerRes" B L 3950 4450 50 
F10 "(-)DimmerRes" B L 3950 4600 50 
$EndSheet
Wire Wire Line
	2500 1850 3300 1850
Wire Wire Line
	6750 1750 7750 1750
Wire Wire Line
	7750 1750 7750 4250
Wire Wire Line
	7750 4250 9400 4250
Wire Wire Line
	7350 4450 7350 2050
Wire Wire Line
	7350 2050 6750 2050
Wire Wire Line
	7350 4450 9400 4450
Wire Wire Line
	6550 3850 10550 3850
Wire Wire Line
	10550 3850 10550 4350
Text Label 7200 4650 2    50   ~ 0
In_Digital0
Text Label 7200 4750 2    50   ~ 0
In_Digital1
Text Label 7200 4850 2    50   ~ 0
In_Digital2
Wire Wire Line
	7200 4650 6550 4650
Wire Wire Line
	6550 4750 7200 4750
Wire Wire Line
	7200 4850 6550 4850
Wire Wire Line
	3950 3700 3300 3700
Wire Wire Line
	3300 3700 3300 1850
Connection ~ 3300 1850
Wire Wire Line
	3300 1850 3800 1850
Wire Wire Line
	1800 2050 1150 2050
Wire Wire Line
	1800 4000 3950 4000
Text Label 3400 4450 0    50   ~ 0
(+)R_Dimmer
Wire Wire Line
	3950 4450 3400 4450
Wire Wire Line
	3950 4600 3400 4600
Text Label 3400 4600 0    50   ~ 0
(-)R_Dimmer
Text Label 3400 4750 0    50   ~ 0
(+)V_Dimmer
Wire Wire Line
	3950 4750 3400 4750
Wire Wire Line
	1150 1950 2200 1950
Wire Wire Line
	1800 2050 1800 4000
Wire Wire Line
	1950 2150 1950 2550
Wire Wire Line
	1950 2550 3800 2550
Wire Wire Line
	1150 2150 1950 2150
Wire Wire Line
	1150 2550 1700 2550
Wire Wire Line
	1700 2550 1700 2700
$Comp
L power:GNDA #PWR?
U 1 1 5F3DBE4C
P 1700 2700
F 0 "#PWR?" H 1700 2450 50  0001 C CNN
F 1 "GNDA" H 1705 2527 50  0000 C CNN
F 2 "" H 1700 2700 50  0001 C CNN
F 3 "" H 1700 2700 50  0001 C CNN
	1    1700 2700
	1    0    0    -1  
$EndComp
$EndSCHEMATC
