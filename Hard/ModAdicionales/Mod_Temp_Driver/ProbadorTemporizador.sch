EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
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
P 2150 3500
F 0 "J?" H 2200 4117 50  0000 C CNN
F 1 "Conn_02x10_Odd_Even" H 2200 4026 50  0000 C CNN
F 2 "" H 2150 3500 50  0001 C CNN
F 3 "~" H 2150 3500 50  0001 C CNN
	1    2150 3500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J?
U 1 1 5ED5CC26
P 2150 5550
F 0 "J?" H 2200 5967 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 2200 5876 50  0000 C CNN
F 2 "" H 2150 5550 50  0001 C CNN
F 3 "~" H 2150 5550 50  0001 C CNN
	1    2150 5550
	1    0    0    -1  
$EndComp
Text Label 1250 5550 0    50   ~ 0
In_N_220
Text Label 1250 5350 0    50   ~ 0
In_L_220
Wire Wire Line
	1700 5850 1700 5750
Wire Wire Line
	1700 5750 1950 5750
Wire Wire Line
	1950 5750 2450 5750
Connection ~ 1950 5750
Wire Wire Line
	2450 5550 1950 5550
Wire Wire Line
	1950 5550 1250 5550
Connection ~ 1950 5550
Wire Wire Line
	2450 5350 1950 5350
Wire Wire Line
	1950 5350 1250 5350
Connection ~ 1950 5350
Text Label 1300 3500 0    50   ~ 0
In_Digital0
Text Label 1300 3600 0    50   ~ 0
In_Digital1
Text Label 1300 3700 0    50   ~ 0
In_Digital2
Text Label 1300 3800 0    50   ~ 0
Out_Digital0
Text Label 1300 3900 0    50   ~ 0
Out_Digital1
Text Label 1300 4000 0    50   ~ 0
Out_Digital2
Wire Wire Line
	2450 3400 2650 3400
Wire Wire Line
	2650 3400 2650 3500
Wire Wire Line
	2450 3500 2650 3500
Connection ~ 2650 3500
Wire Wire Line
	2650 3500 2650 3700
Wire Wire Line
	2450 3700 2650 3700
Connection ~ 2650 3700
Wire Wire Line
	2650 3700 2650 3900
Wire Wire Line
	2450 3900 2650 3900
Connection ~ 2650 3900
Wire Wire Line
	2650 3900 2650 4100
Wire Wire Line
	2450 4000 3150 4000
Wire Wire Line
	3150 4000 3150 3950
Wire Wire Line
	2450 3800 3000 3800
Wire Wire Line
	3000 3800 3000 3750
Wire Wire Line
	2450 3600 2850 3600
Wire Wire Line
	2850 3600 2850 3550
Wire Wire Line
	1300 3500 1950 3500
Wire Wire Line
	1950 3600 1300 3600
Wire Wire Line
	1300 3700 1950 3700
Wire Wire Line
	1950 3800 1300 3800
Wire Wire Line
	1300 3900 1950 3900
Wire Wire Line
	1950 4000 1300 4000
NoConn ~ 1950 5450
NoConn ~ 2450 5450
NoConn ~ 2450 5650
NoConn ~ 1950 5650
Text Label 7950 3250 0    50   ~ 0
In_N_220
Text Label 7950 3350 0    50   ~ 0
In_L_220
Wire Wire Line
	8650 3350 7950 3350
$Comp
L Relay:G5LE-1 K?
U 1 1 5F401545
P 6900 1950
AR Path="/5ED5374F/5F20E931/5F401545" Ref="K?"  Part="1" 
AR Path="/5ED538D0/5F401545" Ref="K?"  Part="1" 
F 0 "K?" H 7330 1996 50  0000 L CNN
F 1 "G5LE-1" H 7330 1905 50  0000 L CNN
F 2 "Relay_THT:Relay_SPDT_Omron-G5LE-1" H 7350 1900 50  0001 L CNN
F 3 "http://www.omron.com/ecb/products/pdf/en-g5le.pdf" H 6900 1950 50  0001 C CNN
	1    6900 1950
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D?
U 1 1 5F40154B
P 6100 1950
AR Path="/5ED5374F/5F20E931/5F40154B" Ref="D?"  Part="1" 
AR Path="/5ED538D0/5F40154B" Ref="D?"  Part="1" 
F 0 "D?" V 6054 2029 50  0000 L CNN
F 1 "1N4148" V 6145 2029 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 6100 1775 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 6100 1950 50  0001 C CNN
	1    6100 1950
	0    1    1    0   
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5F401551
P 6700 1150
AR Path="/5ED5374F/5F20E931/5F401551" Ref="#PWR?"  Part="1" 
AR Path="/5ED538D0/5F401551" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6700 1000 50  0001 C CNN
F 1 "+12V" H 6715 1323 50  0000 C CNN
F 2 "" H 6700 1150 50  0001 C CNN
F 3 "" H 6700 1150 50  0001 C CNN
	1    6700 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 1150 6700 1400
Wire Wire Line
	6100 1800 6100 1400
Wire Wire Line
	6100 1400 6700 1400
Connection ~ 6700 1400
Wire Wire Line
	6700 1400 6700 1650
Wire Wire Line
	6700 2250 6700 2600
Wire Wire Line
	6700 2600 6100 2600
Wire Wire Line
	6100 2600 6100 2100
Wire Wire Line
	5800 2600 6100 2600
Connection ~ 6100 2600
Text Label 7550 1050 2    50   ~ 0
In_N_220
Text Label 8650 3150 2    50   ~ 0
Disparo
Text Label 5800 2600 2    50   ~ 0
In_Digital0
$Comp
L Connector:Conn_01x06_Male J?
U 1 1 5F47216D
P 8850 3350
F 0 "J?" H 8958 3731 50  0000 C CNN
F 1 "Conn_01x06_Male" H 8958 3640 50  0000 C CNN
F 2 "" H 8850 3350 50  0001 C CNN
F 3 "~" H 8850 3350 50  0001 C CNN
	1    8850 3350
	-1   0    0    -1  
$EndComp
$Comp
L Isolator:PC817 U?
U 1 1 5F47CAD1
P 4900 3550
F 0 "U?" H 4900 3233 50  0000 C CNN
F 1 "PC817" H 4900 3324 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm" H 4700 3350 50  0001 L CIN
F 3 "http://www.soselectronic.cz/a_info/resource/d/pc817.pdf" H 4900 3550 50  0001 L CNN
	1    4900 3550
	-1   0    0    -1  
$EndComp
$Comp
L Diode:1N4007 D?
U 1 1 5F4808C8
P 5550 3550
F 0 "D?" V 5596 3471 50  0000 R CNN
F 1 "1N4007" V 5505 3471 50  0000 R CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 5550 3375 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 5550 3550 50  0001 C CNN
	1    5550 3550
	0    -1   1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F49E33D
P 6650 3900
AR Path="/5ED5374F/5F49E33D" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F49E33D" Ref="R?"  Part="1" 
AR Path="/5ED538D0/5F49E33D" Ref="R?"  Part="1" 
F 0 "R?" H 6700 3900 50  0000 L CNN
F 1 "22K 1/4w (carbón)" H 5750 3900 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 6580 3900 50  0001 C CNN
F 3 "~" H 6650 3900 50  0001 C CNN
	1    6650 3900
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F49E343
P 6250 3900
AR Path="/5ED5374F/5F49E343" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F49E343" Ref="R?"  Part="1" 
AR Path="/5ED538D0/5F49E343" Ref="R?"  Part="1" 
F 0 "R?" H 6300 3900 50  0000 L CNN
F 1 "22K 1/4w (carbón)" H 5350 3900 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 6180 3900 50  0001 C CNN
F 3 "~" H 6250 3900 50  0001 C CNN
	1    6250 3900
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F49E349
P 5850 3900
AR Path="/5ED5374F/5F49E349" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F49E349" Ref="R?"  Part="1" 
AR Path="/5ED538D0/5F49E349" Ref="R?"  Part="1" 
F 0 "R?" H 5900 3900 50  0000 L CNN
F 1 "22K 1/4w (carbón)" H 4950 3900 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5780 3900 50  0001 C CNN
F 3 "~" H 5850 3900 50  0001 C CNN
	1    5850 3900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6000 3900 6100 3900
Wire Wire Line
	6400 3900 6500 3900
Wire Wire Line
	6800 3900 7550 3900
Wire Wire Line
	7550 3900 7550 3450
Wire Wire Line
	8650 3450 8450 3450
Wire Wire Line
	5200 3650 5200 3900
Wire Wire Line
	5200 3450 5200 3250
Wire Wire Line
	5200 3250 5550 3250
Wire Wire Line
	5550 3400 5550 3250
Connection ~ 5550 3250
Wire Wire Line
	5550 3250 8650 3250
Wire Wire Line
	5200 3900 5550 3900
Wire Wire Line
	5550 3700 5550 3900
Connection ~ 5550 3900
Wire Wire Line
	5550 3900 5700 3900
$Comp
L power:+12VA #PWR?
U 1 1 5F4E19F8
P 4500 3250
F 0 "#PWR?" H 4500 3100 50  0001 C CNN
F 1 "+12VA" H 4515 3423 50  0000 C CNN
F 2 "" H 4500 3250 50  0001 C CNN
F 3 "" H 4500 3250 50  0001 C CNN
	1    4500 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3250 4500 3450
Wire Wire Line
	4500 3450 4600 3450
Wire Wire Line
	4600 3650 4000 3650
Text Label 4000 3650 0    50   ~ 0
Out_Digital0
Text Label 7950 3650 0    50   ~ 0
In_N_220
Wire Wire Line
	7950 3650 8650 3650
Wire Wire Line
	8650 3550 8450 3550
Wire Wire Line
	8450 3550 8450 3450
Connection ~ 8450 3450
Wire Wire Line
	8450 3450 7550 3450
Text Label 8550 3450 0    50   ~ 0
L'
Text Label 8450 3550 0    50   ~ 0
Carga
Text Label 8450 3650 0    50   ~ 0
Neutro
Text Label 8450 3350 0    50   ~ 0
Fase
Text Label 8450 3250 0    50   ~ 0
Neutro
Wire Notes Line
	8900 3500 9000 3500
Wire Notes Line
	9000 3500 9000 3700
Wire Notes Line
	9000 3700 8900 3700
Text Notes 9050 3650 0    50   ~ 0
Carga (opcional)\n
Wire Notes Line
	9150 3200 9250 3200
Wire Notes Line
	9250 3200 9250 3500
Wire Notes Line
	9250 3500 9150 3500
Wire Notes Line
	9300 3100 9400 3100
Wire Notes Line
	9400 3100 9400 3500
Wire Notes Line
	9400 3500 9300 3500
Text Notes 9200 2900 0    50   ~ 0
Temporizador de 3 cables con pulsador
Text Notes 9400 3000 0    50   ~ 0
Temporizador de 4 cables 
Wire Notes Line
	9200 3150 9200 2900
Wire Notes Line
	9200 2900 10750 2900
Wire Notes Line
	9350 3050 9350 3000
Wire Notes Line
	9350 3000 10400 3000
$Comp
L power:Earth #PWR?
U 1 1 5F53E04D
P 1700 5850
F 0 "#PWR?" H 1700 5600 50  0001 C CNN
F 1 "Earth" H 1700 5700 50  0001 C CNN
F 2 "" H 1700 5850 50  0001 C CNN
F 3 "~" H 1700 5850 50  0001 C CNN
	1    1700 5850
	1    0    0    -1  
$EndComp
NoConn ~ 1950 3200
NoConn ~ 1950 3400
NoConn ~ 1950 3100
NoConn ~ 1950 3300
NoConn ~ 2450 3300
NoConn ~ 2450 3200
NoConn ~ 2450 3100
$Comp
L power:+12VA #PWR?
U 1 1 5F55DE3F
P 2850 3550
F 0 "#PWR?" H 2850 3400 50  0001 C CNN
F 1 "+12VA" H 2865 3723 50  0000 C CNN
F 2 "" H 2850 3550 50  0001 C CNN
F 3 "" H 2850 3550 50  0001 C CNN
	1    2850 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+5VA #PWR?
U 1 1 5F55E136
P 3000 3750
F 0 "#PWR?" H 3000 3600 50  0001 C CNN
F 1 "+5VA" H 3015 3923 50  0000 C CNN
F 2 "" H 3000 3750 50  0001 C CNN
F 3 "" H 3000 3750 50  0001 C CNN
	1    3000 3750
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3VA #PWR?
U 1 1 5F55E430
P 3150 3950
F 0 "#PWR?" H 3150 3800 50  0001 C CNN
F 1 "+3.3VA" H 3165 4123 50  0000 C CNN
F 2 "" H 3150 3950 50  0001 C CNN
F 3 "" H 3150 3950 50  0001 C CNN
	1    3150 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GNDS #PWR?
U 1 1 5F570FE2
P 2650 4100
F 0 "#PWR?" H 2650 3850 50  0001 C CNN
F 1 "GNDS" H 2655 3927 50  0000 C CNN
F 2 "" H 2650 4100 50  0001 C CNN
F 3 "" H 2650 4100 50  0001 C CNN
	1    2650 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 1050 7550 1050
Wire Wire Line
	7200 1050 7200 1650
Wire Wire Line
	7100 3150 8650 3150
Wire Wire Line
	7100 2250 7100 3150
$EndSCHEMATC
