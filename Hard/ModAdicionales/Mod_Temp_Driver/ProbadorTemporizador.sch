EESchema Schematic File Version 4
LIBS:Mod_Temp_Driver-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
Title "Proyecto Final - Modulos Adicionales"
Date "2020-06-02"
Rev "1.0"
Comp "CESE-FIUBA"
Comment1 "Modulo Prueba de temporizadores"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x10_Odd_Even J501
U 1 1 5ED5CC20
P 2150 2400
F 0 "J501" H 2200 3017 50  0000 C CNN
F 1 "Conn_02x10_Odd_Even" H 2200 2926 50  0000 C CNN
F 2 "" H 2150 2400 50  0001 C CNN
F 3 "~" H 2150 2400 50  0001 C CNN
	1    2150 2400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J502
U 1 1 5ED5CC26
P 2150 5550
F 0 "J502" H 2200 5967 50  0000 C CNN
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
Text Label 1300 2400 0    50   ~ 0
In_Digital0
Text Label 1300 2500 0    50   ~ 0
In_Digital1
Text Label 1300 2600 0    50   ~ 0
In_Digital2
Text Label 1300 2700 0    50   ~ 0
Out_Digital0
Wire Wire Line
	2450 2300 2650 2300
Wire Wire Line
	2650 2300 2650 2400
Wire Wire Line
	2450 2400 2650 2400
Connection ~ 2650 2400
Wire Wire Line
	2650 2400 2650 2600
Wire Wire Line
	2450 2600 2650 2600
Connection ~ 2650 2600
Wire Wire Line
	2650 2600 2650 2800
Wire Wire Line
	2450 2800 2650 2800
Connection ~ 2650 2800
Wire Wire Line
	2650 2800 2650 3000
Wire Wire Line
	2450 2900 3150 2900
Wire Wire Line
	3150 2900 3150 2850
Wire Wire Line
	2450 2500 2850 2500
Wire Wire Line
	2850 2500 2850 2450
Wire Wire Line
	1300 2400 1950 2400
Wire Wire Line
	1950 2500 1300 2500
Wire Wire Line
	1300 2600 1950 2600
Wire Wire Line
	1950 2700 1300 2700
NoConn ~ 1950 5450
NoConn ~ 2450 5450
NoConn ~ 2450 5650
NoConn ~ 1950 5650
Text Label 7950 4150 0    50   ~ 0
In_N_220
Text Label 7950 4250 0    50   ~ 0
In_L_220
Wire Wire Line
	8650 4250 7950 4250
$Comp
L Relay:G5LE-1 K?
U 1 1 5F401545
P 6850 2150
AR Path="/5ED5374F/5F20E931/5F401545" Ref="K?"  Part="1" 
AR Path="/5ED538D0/5F401545" Ref="K501"  Part="1" 
F 0 "K501" H 7280 2196 50  0000 L CNN
F 1 "G5LE-1" H 7280 2105 50  0000 L CNN
F 2 "Relay_THT:Relay_SPDT_Omron-G5LE-1" H 7300 2100 50  0001 L CNN
F 3 "http://www.omron.com/ecb/products/pdf/en-g5le.pdf" H 6850 2150 50  0001 C CNN
	1    6850 2150
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D?
U 1 1 5F40154B
P 6050 2150
AR Path="/5ED5374F/5F20E931/5F40154B" Ref="D?"  Part="1" 
AR Path="/5ED538D0/5F40154B" Ref="D501"  Part="1" 
F 0 "D501" V 6004 2229 50  0000 L CNN
F 1 "1N4148" V 6095 2229 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 6050 1975 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 6050 2150 50  0001 C CNN
	1    6050 2150
	0    1    1    0   
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5F401551
P 6650 1350
AR Path="/5ED5374F/5F20E931/5F401551" Ref="#PWR?"  Part="1" 
AR Path="/5ED538D0/5F401551" Ref="#PWR0511"  Part="1" 
F 0 "#PWR0511" H 6650 1200 50  0001 C CNN
F 1 "+12V" H 6665 1523 50  0000 C CNN
F 2 "" H 6650 1350 50  0001 C CNN
F 3 "" H 6650 1350 50  0001 C CNN
	1    6650 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 1350 6650 1600
Wire Wire Line
	6050 2000 6050 1600
Wire Wire Line
	6050 1600 6650 1600
Connection ~ 6650 1600
Wire Wire Line
	6650 1600 6650 1850
Wire Wire Line
	6650 2450 6650 2800
Wire Wire Line
	6650 2800 6050 2800
Wire Wire Line
	6050 2800 6050 2300
Wire Wire Line
	5750 2800 6050 2800
Connection ~ 6050 2800
Text Label 7500 1250 2    50   ~ 0
In_N_220
Text Label 8650 4050 2    50   ~ 0
Disparo
Text Label 4950 3100 2    50   ~ 0
In_Digital0
$Comp
L Connector:Conn_01x06_Male J503
U 1 1 5F47216D
P 8850 4250
F 0 "J503" H 8958 4631 50  0000 C CNN
F 1 "Conn_01x06_Male" H 8958 4540 50  0000 C CNN
F 2 "" H 8850 4250 50  0001 C CNN
F 3 "~" H 8850 4250 50  0001 C CNN
	1    8850 4250
	-1   0    0    -1  
$EndComp
$Comp
L Isolator:PC817 U501
U 1 1 5F47CAD1
P 5800 4750
F 0 "U501" H 5800 4433 50  0000 C CNN
F 1 "PC817" H 5800 4524 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm" H 5600 4550 50  0001 L CIN
F 3 "http://www.soselectronic.cz/a_info/resource/d/pc817.pdf" H 5800 4750 50  0001 L CNN
	1    5800 4750
	-1   0    0    -1  
$EndComp
$Comp
L Diode:1N4007 D502
U 1 1 5F4808C8
P 6450 4750
F 0 "D502" V 6496 4671 50  0000 R CNN
F 1 "1N4007" V 6405 4671 50  0000 R CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 6450 4575 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 6450 4750 50  0001 C CNN
	1    6450 4750
	0    -1   1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F49E33D
P 7550 5100
AR Path="/5ED5374F/5F49E33D" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F49E33D" Ref="R?"  Part="1" 
AR Path="/5ED538D0/5F49E33D" Ref="R506"  Part="1" 
F 0 "R506" H 7600 5100 50  0000 L CNN
F 1 "22K 1/4w (carbón)" H 6650 5100 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 7480 5100 50  0001 C CNN
F 3 "~" H 7550 5100 50  0001 C CNN
	1    7550 5100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F49E343
P 7150 5100
AR Path="/5ED5374F/5F49E343" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F49E343" Ref="R?"  Part="1" 
AR Path="/5ED538D0/5F49E343" Ref="R505"  Part="1" 
F 0 "R505" H 7200 5100 50  0000 L CNN
F 1 "22K 1/4w (carbón)" H 6250 5100 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 7080 5100 50  0001 C CNN
F 3 "~" H 7150 5100 50  0001 C CNN
	1    7150 5100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F49E349
P 6750 5100
AR Path="/5ED5374F/5F49E349" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F49E349" Ref="R?"  Part="1" 
AR Path="/5ED538D0/5F49E349" Ref="R504"  Part="1" 
F 0 "R504" H 6800 5100 50  0000 L CNN
F 1 "22K 1/4w (carbón)" H 5850 5100 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 6680 5100 50  0001 C CNN
F 3 "~" H 6750 5100 50  0001 C CNN
	1    6750 5100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6900 5100 7000 5100
Wire Wire Line
	7300 5100 7400 5100
Wire Wire Line
	7700 5100 7950 5100
Wire Wire Line
	8650 4350 8450 4350
Wire Wire Line
	6100 4850 6100 5100
Wire Wire Line
	6100 4650 6100 4450
Wire Wire Line
	6100 4450 6450 4450
Wire Wire Line
	6450 4600 6450 4450
Wire Wire Line
	6100 5100 6450 5100
Wire Wire Line
	6450 4900 6450 5100
Connection ~ 6450 5100
Wire Wire Line
	6450 5100 6600 5100
$Comp
L power:+12VA #PWR0508
U 1 1 5F4E19F8
P 5400 4450
F 0 "#PWR0508" H 5400 4300 50  0001 C CNN
F 1 "+12VA" H 5415 4623 50  0000 C CNN
F 2 "" H 5400 4450 50  0001 C CNN
F 3 "" H 5400 4450 50  0001 C CNN
	1    5400 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 4450 5400 4650
Wire Wire Line
	5400 4650 5500 4650
Wire Wire Line
	5500 4850 5400 4850
Text Label 4900 4850 0    50   ~ 0
Out_Digital0
Text Label 7950 4550 0    50   ~ 0
In_N_220
Wire Wire Line
	8650 4450 8450 4450
Wire Wire Line
	8450 4450 8450 4350
Text Label 8550 4350 0    50   ~ 0
L'
Text Label 8450 4450 0    50   ~ 0
Carga
Text Label 8450 4550 0    50   ~ 0
Neutro
Text Label 8450 4250 0    50   ~ 0
Fase
Text Label 8450 4150 0    50   ~ 0
Neutro
Wire Notes Line
	8900 4400 9000 4400
Wire Notes Line
	9000 4400 9000 4600
Wire Notes Line
	9000 4600 8900 4600
Text Notes 9050 4550 0    50   ~ 0
Carga (opcional)\n
Wire Notes Line
	9150 4100 9250 4100
Wire Notes Line
	9250 4100 9250 4400
Wire Notes Line
	9250 4400 9150 4400
Wire Notes Line
	9300 4000 9400 4000
Wire Notes Line
	9400 4000 9400 4400
Wire Notes Line
	9400 4400 9300 4400
Text Notes 9150 3800 0    50   ~ 0
Temporizador de 3 cables con pulsador para disparo
Text Notes 9400 3900 0    50   ~ 0
Temporizador de 4 cables 
Wire Notes Line
	9200 4050 9200 3800
Wire Notes Line
	9200 3800 10750 3800
Wire Notes Line
	9350 3950 9350 3900
Wire Notes Line
	9350 3900 10400 3900
$Comp
L power:Earth #PWR0501
U 1 1 5F53E04D
P 1700 5850
F 0 "#PWR0501" H 1700 5600 50  0001 C CNN
F 1 "Earth" H 1700 5700 50  0001 C CNN
F 2 "" H 1700 5850 50  0001 C CNN
F 3 "~" H 1700 5850 50  0001 C CNN
	1    1700 5850
	1    0    0    -1  
$EndComp
NoConn ~ 1950 2100
NoConn ~ 1950 2300
NoConn ~ 1950 2000
NoConn ~ 1950 2200
NoConn ~ 2450 2200
NoConn ~ 2450 2100
NoConn ~ 2450 2000
$Comp
L power:+12VA #PWR0503
U 1 1 5F55DE3F
P 2850 2450
F 0 "#PWR0503" H 2850 2300 50  0001 C CNN
F 1 "+12VA" H 2865 2623 50  0000 C CNN
F 2 "" H 2850 2450 50  0001 C CNN
F 3 "" H 2850 2450 50  0001 C CNN
	1    2850 2450
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3VA #PWR0505
U 1 1 5F55E430
P 3150 2850
F 0 "#PWR0505" H 3150 2700 50  0001 C CNN
F 1 "+3.3VA" H 3165 3023 50  0000 C CNN
F 2 "" H 3150 2850 50  0001 C CNN
F 3 "" H 3150 2850 50  0001 C CNN
	1    3150 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDS #PWR0502
U 1 1 5F570FE2
P 2650 3000
F 0 "#PWR0502" H 2650 2750 50  0001 C CNN
F 1 "GNDS" H 2655 2827 50  0000 C CNN
F 2 "" H 2650 3000 50  0001 C CNN
F 3 "" H 2650 3000 50  0001 C CNN
	1    2650 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 1250 7500 1250
Wire Wire Line
	7150 1250 7150 1850
$Comp
L Transistor_BJT:BC547 Q501
U 1 1 5ED683EC
P 5650 3100
F 0 "Q501" H 5841 3146 50  0000 L CNN
F 1 "BC547" H 5841 3055 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 5850 3025 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 5650 3100 50  0001 L CNN
	1    5650 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDS #PWR0510
U 1 1 5ED68B37
P 5750 3400
F 0 "#PWR0510" H 5750 3150 50  0001 C CNN
F 1 "GNDS" H 5755 3227 50  0000 C CNN
F 2 "" H 5750 3400 50  0001 C CNN
F 3 "" H 5750 3400 50  0001 C CNN
	1    5750 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 3300 5750 3400
$Comp
L Device:R R501
U 1 1 5ED6AF45
P 5250 2800
F 0 "R501" H 5320 2846 50  0000 L CNN
F 1 "10k" H 5320 2755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5180 2800 50  0001 C CNN
F 3 "~" H 5250 2800 50  0001 C CNN
	1    5250 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R502
U 1 1 5ED6B3B0
P 5250 3400
F 0 "R502" H 5320 3446 50  0000 L CNN
F 1 "1M" H 5320 3355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5180 3400 50  0001 C CNN
F 3 "~" H 5250 3400 50  0001 C CNN
	1    5250 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 2950 5250 3100
Wire Wire Line
	5450 3100 5250 3100
Connection ~ 5250 3100
Wire Wire Line
	5250 3100 5250 3250
$Comp
L power:GNDS #PWR0507
U 1 1 5ED6E869
P 5250 3600
F 0 "#PWR0507" H 5250 3350 50  0001 C CNN
F 1 "GNDS" H 5255 3427 50  0000 C CNN
F 2 "" H 5250 3600 50  0001 C CNN
F 3 "" H 5250 3600 50  0001 C CNN
	1    5250 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 3550 5250 3600
$Comp
L power:+12V #PWR?
U 1 1 5ED70CB6
P 5250 2350
AR Path="/5ED5374F/5F20E931/5ED70CB6" Ref="#PWR?"  Part="1" 
AR Path="/5ED538D0/5ED70CB6" Ref="#PWR0506"  Part="1" 
F 0 "#PWR0506" H 5250 2200 50  0001 C CNN
F 1 "+12V" H 5265 2523 50  0000 C CNN
F 2 "" H 5250 2350 50  0001 C CNN
F 3 "" H 5250 2350 50  0001 C CNN
	1    5250 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 2350 5250 2650
Wire Wire Line
	4950 3100 5250 3100
Wire Wire Line
	5750 2900 5750 2800
Wire Wire Line
	7050 4050 8650 4050
Wire Wire Line
	7050 2450 7050 4050
Text Notes 4100 3350 0    59   ~ 0
Disparo temporizador\nde 4 cables
Text Notes 3950 4650 0    59   ~ 0
Pulsos de 50Hz cuando \nhay tensión sobre la carga
Wire Wire Line
	8650 4150 7950 4150
Wire Wire Line
	6450 4450 8450 4450
Connection ~ 6450 4450
Connection ~ 8450 4450
Wire Wire Line
	8650 4550 7950 4550
Wire Wire Line
	7950 4550 7950 5100
$Comp
L Device:R R503
U 1 1 5EE47DBA
P 5400 5100
F 0 "R503" H 5470 5146 50  0000 L CNN
F 1 "10K" H 5470 5055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5330 5100 50  0001 C CNN
F 3 "~" H 5400 5100 50  0001 C CNN
	1    5400 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDS #PWR0509
U 1 1 5EE47DC0
P 5400 5300
F 0 "#PWR0509" H 5400 5050 50  0001 C CNN
F 1 "GNDS" H 5405 5127 50  0000 C CNN
F 2 "" H 5400 5300 50  0001 C CNN
F 3 "" H 5400 5300 50  0001 C CNN
	1    5400 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 5250 5400 5300
Wire Wire Line
	5400 4950 5400 4850
Connection ~ 5400 4850
Wire Wire Line
	5400 4850 4900 4850
NoConn ~ 6950 1850
Wire Wire Line
	2150 1100 2150 1050
Wire Wire Line
	1350 1100 1350 1050
$Comp
L power:+12VA #PWR0106
U 1 1 5EEA8227
P 1350 1050
F 0 "#PWR0106" H 1350 900 50  0001 C CNN
F 1 "+12VA" H 1365 1223 50  0000 C CNN
F 2 "" H 1350 1050 50  0001 C CNN
F 3 "" H 1350 1050 50  0001 C CNN
	1    1350 1050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDS #PWR0108
U 1 1 5EEA9C6E
P 2550 1100
F 0 "#PWR0108" H 2550 850 50  0001 C CNN
F 1 "GNDS" H 2555 927 50  0000 C CNN
F 2 "" H 2550 1100 50  0001 C CNN
F 3 "" H 2550 1100 50  0001 C CNN
	1    2550 1100
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0104
U 1 1 5EEACB74
P 1350 1100
F 0 "#FLG0104" H 1350 1175 50  0001 C CNN
F 1 "PWR_FLAG" H 1350 1273 50  0000 C CNN
F 2 "" H 1350 1100 50  0001 C CNN
F 3 "~" H 1350 1100 50  0001 C CNN
	1    1350 1100
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG0109
U 1 1 5EEAEB22
P 2150 1100
F 0 "#FLG0109" H 2150 1175 50  0001 C CNN
F 1 "PWR_FLAG" H 2150 1273 50  0000 C CNN
F 2 "" H 2150 1100 50  0001 C CNN
F 3 "~" H 2150 1100 50  0001 C CNN
	1    2150 1100
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG0110
U 1 1 5EEB0356
P 2950 1100
F 0 "#FLG0110" H 2950 1175 50  0001 C CNN
F 1 "PWR_FLAG" H 2950 1273 50  0000 C CNN
F 2 "" H 2950 1100 50  0001 C CNN
F 3 "~" H 2950 1100 50  0001 C CNN
	1    2950 1100
	-1   0    0    1   
$EndComp
Wire Wire Line
	2950 1100 2950 1000
Wire Wire Line
	2950 1000 2550 1000
Wire Wire Line
	2550 1000 2550 1100
$Comp
L power:+3.3VA #PWR0109
U 1 1 5EEA8233
P 2150 1050
F 0 "#PWR0109" H 2150 900 50  0001 C CNN
F 1 "+3.3VA" H 2165 1223 50  0000 C CNN
F 2 "" H 2150 1050 50  0001 C CNN
F 3 "" H 2150 1050 50  0001 C CNN
	1    2150 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 2900 1300 2900
Wire Wire Line
	1300 2800 1950 2800
Text Label 1300 2900 0    50   ~ 0
Out_Digital2
Text Label 1300 2800 0    50   ~ 0
Out_Digital1
NoConn ~ 1950 2900
NoConn ~ 1950 2800
NoConn ~ 1950 2600
NoConn ~ 1950 2500
NoConn ~ 2450 2700
$Comp
L power:Earth #PWR0110
U 1 1 5EECB59A
P 3250 1100
F 0 "#PWR0110" H 3250 850 50  0001 C CNN
F 1 "Earth" H 3250 950 50  0001 C CNN
F 2 "" H 3250 1100 50  0001 C CNN
F 3 "~" H 3250 1100 50  0001 C CNN
	1    3250 1100
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0111
U 1 1 5EECCF11
P 3650 1100
F 0 "#FLG0111" H 3650 1175 50  0001 C CNN
F 1 "PWR_FLAG" H 3650 1273 50  0000 C CNN
F 2 "" H 3650 1100 50  0001 C CNN
F 3 "~" H 3650 1100 50  0001 C CNN
	1    3650 1100
	-1   0    0    1   
$EndComp
Wire Wire Line
	3650 1100 3650 1000
Wire Wire Line
	3650 1000 3250 1000
Wire Wire Line
	3250 1000 3250 1100
$EndSCHEMATC
