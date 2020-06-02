EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
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
L Device:R R?
U 1 1 5F185209
P 2550 2700
AR Path="/5ED5374F/5F185209" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F185209" Ref="R?"  Part="1" 
F 0 "R?" H 2600 2700 50  0000 L CNN
F 1 "1ohm 1/4w" V 2450 2500 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 2480 2700 50  0001 C CNN
F 3 "~" H 2550 2700 50  0001 C CNN
	1    2550 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F18520F
P 2850 2700
AR Path="/5ED5374F/5F18520F" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F18520F" Ref="R?"  Part="1" 
F 0 "R?" H 2900 2700 50  0000 L CNN
F 1 "1ohm 1/4w" V 2750 2500 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 2780 2700 50  0001 C CNN
F 3 "~" H 2850 2700 50  0001 C CNN
	1    2850 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F185215
P 3150 2700
AR Path="/5ED5374F/5F185215" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F185215" Ref="R?"  Part="1" 
F 0 "R?" H 3200 2700 50  0000 L CNN
F 1 "1ohm 1/4w" V 3050 2500 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 3080 2700 50  0001 C CNN
F 3 "~" H 3150 2700 50  0001 C CNN
	1    3150 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F18521B
P 3450 2700
AR Path="/5ED5374F/5F18521B" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F18521B" Ref="R?"  Part="1" 
F 0 "R?" H 3500 2700 50  0000 L CNN
F 1 "1ohm 1/4w" V 3350 2500 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 3380 2700 50  0001 C CNN
F 3 "~" H 3450 2700 50  0001 C CNN
	1    3450 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F185221
P 3750 2700
AR Path="/5ED5374F/5F185221" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F185221" Ref="R?"  Part="1" 
F 0 "R?" H 3800 2700 50  0000 L CNN
F 1 "1ohm 1/4w" V 3650 2500 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 3680 2700 50  0001 C CNN
F 3 "~" H 3750 2700 50  0001 C CNN
	1    3750 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 2550 3750 2400
Wire Wire Line
	3750 2400 3450 2400
Wire Wire Line
	2550 2400 2550 2550
Wire Wire Line
	2850 2400 2850 2550
Connection ~ 2850 2400
Wire Wire Line
	2850 2400 2550 2400
Wire Wire Line
	3150 2400 3150 2550
Connection ~ 3150 2400
Wire Wire Line
	3150 2400 2850 2400
Wire Wire Line
	3450 2400 3450 2550
Connection ~ 3450 2400
Wire Wire Line
	3450 2400 3150 2400
Wire Wire Line
	2550 2850 2550 3000
Wire Wire Line
	2550 3000 2850 3000
Wire Wire Line
	3750 3000 3750 2850
Wire Wire Line
	3450 2850 3450 3000
Connection ~ 3450 3000
Wire Wire Line
	3450 3000 3750 3000
Wire Wire Line
	3150 2850 3150 3000
Connection ~ 3150 3000
Wire Wire Line
	3150 3000 3450 3000
Wire Wire Line
	2850 2850 2850 3000
Connection ~ 2850 3000
Wire Wire Line
	2850 3000 3150 3000
$Comp
L power:GNDA #PWR?
U 1 1 5F18523F
P 3150 3200
AR Path="/5ED5374F/5F18523F" Ref="#PWR?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F18523F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3150 2950 50  0001 C CNN
F 1 "GNDA" H 3155 3027 50  0000 C CNN
F 2 "" H 3150 3200 50  0001 C CNN
F 3 "" H 3150 3200 50  0001 C CNN
	1    3150 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3200 3150 3000
Wire Wire Line
	2950 1500 3150 1500
Wire Wire Line
	3150 1500 3150 2150
$Comp
L Device:R R?
U 1 1 5F185249
P 3650 2150
AR Path="/5ED5374F/5F185249" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F185249" Ref="R?"  Part="1" 
F 0 "R?" V 3443 2150 50  0000 C CNN
F 1 "220 1/4w" V 3534 2150 50  0000 C CNN
F 2 "" V 3580 2150 50  0001 C CNN
F 3 "~" H 3650 2150 50  0001 C CNN
	1    3650 2150
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D?
U 1 1 5F18524F
P 4150 2400
AR Path="/5ED5374F/5F18524F" Ref="D?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F18524F" Ref="D?"  Part="1" 
F 0 "D?" V 4104 2479 50  0000 L CNN
F 1 "D_Zener 12v" V 4195 2479 50  0000 L CNN
F 2 "" H 4150 2400 50  0001 C CNN
F 3 "~" H 4150 2400 50  0001 C CNN
	1    4150 2400
	0    1    1    0   
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5F185255
P 4150 2550
AR Path="/5ED5374F/5F185255" Ref="#PWR?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F185255" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4150 2300 50  0001 C CNN
F 1 "GNDA" H 4155 2377 50  0000 C CNN
F 2 "" H 4150 2550 50  0001 C CNN
F 3 "" H 4150 2550 50  0001 C CNN
	1    4150 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 2150 4150 2150
Wire Wire Line
	4150 2250 4150 2150
Wire Wire Line
	3500 2150 3150 2150
Connection ~ 3150 2150
Wire Wire Line
	3150 2150 3150 2400
Wire Wire Line
	4150 2150 5050 2150
Connection ~ 4150 2150
Text Notes 5100 1650 0    50   ~ 0
Ganancia 20
$Comp
L Amplifier_Operational:LM2904 U?
U 1 1 5F185263
P 5350 2250
AR Path="/5ED5374F/5F185263" Ref="U?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F185263" Ref="U?"  Part="1" 
F 0 "U?" H 5350 2617 50  0000 C CNN
F 1 "LM2904" H 5350 2526 50  0000 C CNN
F 2 "" H 5350 2250 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm358.pdf" H 5350 2250 50  0001 C CNN
	1    5350 2250
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM2904 U?
U 2 1 5F185269
P 7000 2350
AR Path="/5ED5374F/5F185269" Ref="U?"  Part="2" 
AR Path="/5ED5374F/5F0ECABF/5F185269" Ref="U?"  Part="2" 
F 0 "U?" H 7000 2717 50  0000 C CNN
F 1 "LM2904" H 7000 2626 50  0000 C CNN
F 2 "" H 7000 2350 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm358.pdf" H 7000 2350 50  0001 C CNN
	2    7000 2350
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM2904 U?
U 3 1 5F18526F
P 7150 1300
AR Path="/5ED5374F/5F18526F" Ref="U?"  Part="3" 
AR Path="/5ED5374F/5F0ECABF/5F18526F" Ref="U?"  Part="3" 
F 0 "U?" H 7108 1346 50  0000 L CNN
F 1 "LM2904" H 7108 1255 50  0000 L CNN
F 2 "" H 7150 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm358.pdf" H 7150 1300 50  0001 C CNN
	3    7150 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F185275
P 5350 2700
AR Path="/5ED5374F/5F185275" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F185275" Ref="R?"  Part="1" 
F 0 "R?" V 5143 2700 50  0000 C CNN
F 1 "22k" V 5234 2700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5280 2700 50  0001 C CNN
F 3 "~" H 5350 2700 50  0001 C CNN
	1    5350 2700
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F18527B
P 5350 2850
AR Path="/5ED5374F/5F18527B" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F18527B" Ref="R?"  Part="1" 
F 0 "R?" V 5557 2850 50  0000 C CNN
F 1 "150k" V 5466 2850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5280 2850 50  0001 C CNN
F 3 "~" H 5350 2850 50  0001 C CNN
	1    5350 2850
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F185281
P 4750 3150
AR Path="/5ED5374F/5F185281" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F185281" Ref="R?"  Part="1" 
F 0 "R?" H 4820 3196 50  0000 L CNN
F 1 "RA" H 4820 3105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4680 3150 50  0001 C CNN
F 3 "~" H 4750 3150 50  0001 C CNN
	1    4750 3150
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5F185287
P 4900 3150
AR Path="/5ED5374F/5F185287" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F185287" Ref="R?"  Part="1" 
F 0 "R?" H 4830 3104 50  0000 R CNN
F 1 "1k" H 4830 3195 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4830 3150 50  0001 C CNN
F 3 "~" H 4900 3150 50  0001 C CNN
	1    4900 3150
	-1   0    0    1   
$EndComp
Wire Wire Line
	4750 3000 4750 2900
Wire Wire Line
	4900 3000 4900 2900
Wire Wire Line
	4900 2900 4750 2900
Wire Wire Line
	4900 2350 5050 2350
Connection ~ 4900 2900
Wire Wire Line
	5200 2850 5100 2850
Wire Wire Line
	5100 2850 5100 2700
Wire Wire Line
	5100 2700 5200 2700
Wire Wire Line
	5100 2700 4900 2700
Wire Wire Line
	4900 2350 4900 2700
Connection ~ 5100 2700
Connection ~ 4900 2700
Wire Wire Line
	4900 2700 4900 2900
Wire Wire Line
	5750 2700 5750 2250
Wire Wire Line
	5750 2250 5650 2250
Wire Wire Line
	5500 2700 5600 2700
Wire Wire Line
	5500 2850 5600 2850
Wire Wire Line
	5600 2850 5600 2700
Connection ~ 5600 2700
Wire Wire Line
	5600 2700 5750 2700
$Comp
L power:GNDA #PWR?
U 1 1 5F1852A1
P 4750 3400
AR Path="/5ED5374F/5F1852A1" Ref="#PWR?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F1852A1" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4750 3150 50  0001 C CNN
F 1 "GNDA" H 4755 3227 50  0000 C CNN
F 2 "" H 4750 3400 50  0001 C CNN
F 3 "" H 4750 3400 50  0001 C CNN
	1    4750 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5F1852A7
P 4900 3400
AR Path="/5ED5374F/5F1852A7" Ref="#PWR?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F1852A7" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4900 3150 50  0001 C CNN
F 1 "GNDA" H 4905 3227 50  0000 C CNN
F 2 "" H 4900 3400 50  0001 C CNN
F 3 "" H 4900 3400 50  0001 C CNN
	1    4900 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 3300 4900 3400
Wire Wire Line
	4750 3300 4750 3400
$Comp
L Device:R R?
U 1 1 5F1852AF
P 6000 2250
AR Path="/5ED5374F/5F1852AF" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F1852AF" Ref="R?"  Part="1" 
F 0 "R?" V 5793 2250 50  0000 C CNN
F 1 "10k" V 5884 2250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5930 2250 50  0001 C CNN
F 3 "~" H 6000 2250 50  0001 C CNN
	1    6000 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	6150 2250 6250 2250
Wire Wire Line
	5850 2250 5750 2250
Connection ~ 5750 2250
$Comp
L Device:C C?
U 1 1 5F1852B8
P 6250 2550
AR Path="/5ED5374F/5F1852B8" Ref="C?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F1852B8" Ref="C?"  Part="1" 
F 0 "C?" H 6365 2596 50  0000 L CNN
F 1 "1nF" H 6365 2505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6288 2400 50  0001 C CNN
F 3 "~" H 6250 2550 50  0001 C CNN
	1    6250 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 2250 6250 2400
$Comp
L power:GNDA #PWR?
U 1 1 5F1852BF
P 6250 2800
AR Path="/5ED5374F/5F1852BF" Ref="#PWR?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F1852BF" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6250 2550 50  0001 C CNN
F 1 "GNDA" H 6255 2627 50  0000 C CNN
F 2 "" H 6250 2800 50  0001 C CNN
F 3 "" H 6250 2800 50  0001 C CNN
	1    6250 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 2700 6250 2800
Wire Wire Line
	6250 2250 6700 2250
Connection ~ 6250 2250
Wire Wire Line
	6700 2450 6600 2450
Wire Wire Line
	6600 2450 6600 2700
Wire Wire Line
	6600 2700 7400 2700
Wire Wire Line
	7400 2700 7400 2350
Wire Wire Line
	7400 2350 7300 2350
$Comp
L Device:C C?
U 1 1 5F1852CD
P 7600 1250
AR Path="/5ED5374F/5F1852CD" Ref="C?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F1852CD" Ref="C?"  Part="1" 
F 0 "C?" H 7715 1296 50  0000 L CNN
F 1 "1nF" H 7715 1205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7638 1100 50  0001 C CNN
F 3 "~" H 7600 1250 50  0001 C CNN
	1    7600 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5F1852D3
P 7300 1700
AR Path="/5ED5374F/5F1852D3" Ref="#PWR?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F1852D3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7300 1450 50  0001 C CNN
F 1 "GNDA" H 7305 1527 50  0000 C CNN
F 2 "" H 7300 1700 50  0001 C CNN
F 3 "" H 7300 1700 50  0001 C CNN
	1    7300 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5F1852D9
P 7300 900
AR Path="/5ED5374F/5F1852D9" Ref="#PWR?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F1852D9" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7300 750 50  0001 C CNN
F 1 "+12V" H 7315 1073 50  0000 C CNN
F 2 "" H 7300 900 50  0001 C CNN
F 3 "" H 7300 900 50  0001 C CNN
	1    7300 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 900  7300 950 
Wire Wire Line
	7300 950  7600 950 
Wire Wire Line
	7600 950  7600 1100
Wire Wire Line
	7050 1000 7050 950 
Wire Wire Line
	7050 950  7300 950 
Connection ~ 7300 950 
Wire Wire Line
	7050 1600 7050 1700
Wire Wire Line
	7050 1700 7300 1700
Wire Wire Line
	7300 1700 7600 1700
Wire Wire Line
	7600 1400 7600 1700
Connection ~ 7300 1700
Wire Wire Line
	7400 2350 7850 2350
Connection ~ 7400 2350
$Comp
L Amplifier_Operational:LM2904 U?
U 1 1 5F19BC33
P 3400 5850
AR Path="/5ED5374F/5F19BC33" Ref="U?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F19BC33" Ref="U?"  Part="1" 
F 0 "U?" H 3400 6217 50  0000 C CNN
F 1 "LM2904" H 3400 6126 50  0000 C CNN
F 2 "" H 3400 5850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm358.pdf" H 3400 5850 50  0001 C CNN
	1    3400 5850
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM2904 U?
U 2 1 5F19BC39
P 5100 5950
AR Path="/5ED5374F/5F19BC39" Ref="U?"  Part="2" 
AR Path="/5ED5374F/5F0ECABF/5F19BC39" Ref="U?"  Part="2" 
F 0 "U?" H 5100 6317 50  0000 C CNN
F 1 "LM2904" H 5100 6226 50  0000 C CNN
F 2 "" H 5100 5950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm358.pdf" H 5100 5950 50  0001 C CNN
	2    5100 5950
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM2904 U?
U 3 1 5F19BC3F
P 8150 5000
AR Path="/5ED5374F/5F19BC3F" Ref="U?"  Part="3" 
AR Path="/5ED5374F/5F0ECABF/5F19BC3F" Ref="U?"  Part="3" 
F 0 "U?" H 8108 5046 50  0000 L CNN
F 1 "LM2904" H 8108 4955 50  0000 L CNN
F 2 "" H 8150 5000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm358.pdf" H 8150 5000 50  0001 C CNN
	3    8150 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F19BC45
P 8600 4900
AR Path="/5ED5374F/5F19BC45" Ref="C?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F19BC45" Ref="C?"  Part="1" 
F 0 "C?" H 8715 4946 50  0000 L CNN
F 1 "1nF" H 8715 4855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8638 4750 50  0001 C CNN
F 3 "~" H 8600 4900 50  0001 C CNN
	1    8600 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5F19BC4B
P 8300 5350
AR Path="/5ED5374F/5F19BC4B" Ref="#PWR?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F19BC4B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8300 5100 50  0001 C CNN
F 1 "GNDA" H 8305 5177 50  0000 C CNN
F 2 "" H 8300 5350 50  0001 C CNN
F 3 "" H 8300 5350 50  0001 C CNN
	1    8300 5350
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5F19BC51
P 8300 4550
AR Path="/5ED5374F/5F19BC51" Ref="#PWR?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F19BC51" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8300 4400 50  0001 C CNN
F 1 "+12V" H 8315 4723 50  0000 C CNN
F 2 "" H 8300 4550 50  0001 C CNN
F 3 "" H 8300 4550 50  0001 C CNN
	1    8300 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 4550 8300 4600
Wire Wire Line
	8300 4600 8600 4600
Wire Wire Line
	8600 4600 8600 4750
Wire Wire Line
	8050 4600 8300 4600
Connection ~ 8300 4600
Wire Wire Line
	8050 5350 8300 5350
Wire Wire Line
	8300 5350 8600 5350
Wire Wire Line
	8600 5050 8600 5350
Connection ~ 8300 5350
Wire Wire Line
	8050 4600 8050 4700
Wire Wire Line
	8050 5300 8050 5350
$Comp
L Device:R R?
U 1 1 5F19BC62
P 2600 5450
AR Path="/5ED5374F/5F19BC62" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F19BC62" Ref="R?"  Part="1" 
F 0 "R?" H 2650 5450 50  0000 L CNN
F 1 " 330K 1/4w (carbón)" H 1700 5450 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 2530 5450 50  0001 C CNN
F 3 "~" H 2600 5450 50  0001 C CNN
	1    2600 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F19BC68
P 2600 5050
AR Path="/5ED5374F/5F19BC68" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F19BC68" Ref="R?"  Part="1" 
F 0 "R?" H 2650 5050 50  0000 L CNN
F 1 " 330K 1/4w (carbón)" H 1700 5050 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 2530 5050 50  0001 C CNN
F 3 "~" H 2600 5050 50  0001 C CNN
	1    2600 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F19BC6E
P 2600 4650
AR Path="/5ED5374F/5F19BC6E" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F19BC6E" Ref="R?"  Part="1" 
F 0 "R?" H 2650 4650 50  0000 L CNN
F 1 " 330K 1/4w (carbón)" H 1700 4650 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 2530 4650 50  0001 C CNN
F 3 "~" H 2600 4650 50  0001 C CNN
	1    2600 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 4800 2600 4900
Wire Wire Line
	2600 5200 2600 5300
Wire Wire Line
	2600 5600 2600 5750
Wire Wire Line
	2600 5750 3100 5750
Wire Wire Line
	3100 5950 3000 5950
Wire Wire Line
	3000 5950 3000 6200
Wire Wire Line
	3000 6200 3850 6200
Wire Wire Line
	3850 6200 3850 5850
Wire Wire Line
	3850 5850 3700 5850
$Comp
L Device:R R?
U 1 1 5F19BC7D
P 2600 6100
AR Path="/5ED5374F/5F19BC7D" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F19BC7D" Ref="R?"  Part="1" 
F 0 "R?" H 2650 6100 50  0000 L CNN
F 1 "22K 1/4w (carbón)" V 2800 5450 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 2530 6100 50  0001 C CNN
F 3 "~" H 2600 6100 50  0001 C CNN
	1    2600 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F19BC83
P 2250 6100
AR Path="/5ED5374F/5F19BC83" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F19BC83" Ref="R?"  Part="1" 
F 0 "R?" H 2300 6100 50  0000 L CNN
F 1 "220K 1/4w (carbón)" V 2050 5450 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 2180 6100 50  0001 C CNN
F 3 "~" H 2250 6100 50  0001 C CNN
	1    2250 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5F19BC89
P 2250 6350
AR Path="/5ED5374F/5F19BC89" Ref="#PWR?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F19BC89" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2250 6100 50  0001 C CNN
F 1 "GNDA" H 2255 6177 50  0000 C CNN
F 2 "" H 2250 6350 50  0001 C CNN
F 3 "" H 2250 6350 50  0001 C CNN
	1    2250 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5F19BC8F
P 2600 6350
AR Path="/5ED5374F/5F19BC8F" Ref="#PWR?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F19BC8F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2600 6100 50  0001 C CNN
F 1 "GNDA" H 2605 6177 50  0000 C CNN
F 2 "" H 2600 6350 50  0001 C CNN
F 3 "" H 2600 6350 50  0001 C CNN
	1    2600 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 5750 2600 5950
Connection ~ 2600 5750
Wire Wire Line
	2250 5950 2250 5750
Wire Wire Line
	2250 5750 2600 5750
Wire Wire Line
	2600 6250 2600 6350
Wire Wire Line
	2250 6250 2250 6350
Wire Wire Line
	2600 4300 2600 4500
$Comp
L Device:R R?
U 1 1 5F19BC9D
P 4100 5850
AR Path="/5ED5374F/5F19BC9D" Ref="R?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F19BC9D" Ref="R?"  Part="1" 
F 0 "R?" V 3893 5850 50  0000 C CNN
F 1 "10k" V 3984 5850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4030 5850 50  0001 C CNN
F 3 "~" H 4100 5850 50  0001 C CNN
	1    4100 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	4250 5850 4350 5850
Wire Wire Line
	3950 5850 3850 5850
$Comp
L Device:C C?
U 1 1 5F19BCA5
P 4350 6150
AR Path="/5ED5374F/5F19BCA5" Ref="C?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F19BCA5" Ref="C?"  Part="1" 
F 0 "C?" H 4465 6196 50  0000 L CNN
F 1 "1nF" H 4465 6105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4388 6000 50  0001 C CNN
F 3 "~" H 4350 6150 50  0001 C CNN
	1    4350 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 5850 4350 6000
$Comp
L power:GNDA #PWR?
U 1 1 5F19BCAC
P 4350 6400
AR Path="/5ED5374F/5F19BCAC" Ref="#PWR?"  Part="1" 
AR Path="/5ED5374F/5F0ECABF/5F19BCAC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4350 6150 50  0001 C CNN
F 1 "GNDA" H 4355 6227 50  0000 C CNN
F 2 "" H 4350 6400 50  0001 C CNN
F 3 "" H 4350 6400 50  0001 C CNN
	1    4350 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 6300 4350 6400
Wire Wire Line
	4350 5850 4800 5850
Connection ~ 4350 5850
Wire Wire Line
	4800 6050 4700 6050
Wire Wire Line
	4700 6050 4700 6350
Wire Wire Line
	4700 6350 5600 6350
Wire Wire Line
	5600 6350 5600 5950
Wire Wire Line
	5600 5950 5400 5950
Wire Wire Line
	6050 5950 5600 5950
Connection ~ 5600 5950
Connection ~ 3850 5850
Text HLabel 7850 2350 2    50   Output ~ 0
V-Corriente
Text HLabel 6050 5950 2    50   Output ~ 0
V-Tension
Text HLabel 2950 1500 0    50   Input ~ 0
I-Driver
Text HLabel 2450 4300 0    50   Input ~ 0
V-Driver
Wire Wire Line
	2600 4300 2450 4300
$EndSCHEMATC
