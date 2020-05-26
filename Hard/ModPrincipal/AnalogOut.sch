EESchema Schematic File Version 4
LIBS:ModPrincipal-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
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
L Amplifier_Operational:LM324 U?
U 1 1 5ECE36B1
P 5450 2200
AR Path="/5EC7150D/5ECE36B1" Ref="U?"  Part="1" 
AR Path="/5ECD8445/5ECE36B1" Ref="U?"  Part="1" 
F 0 "U?" H 5450 2567 50  0000 C CNN
F 1 "LM324" H 5450 2476 50  0000 C CNN
F 2 "" H 5400 2300 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 5500 2400 50  0001 C CNN
	1    5450 2200
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM324 U?
U 2 1 5ECE36B7
P 5450 3850
AR Path="/5EC7150D/5ECE36B7" Ref="U?"  Part="2" 
AR Path="/5ECD8445/5ECE36B7" Ref="U?"  Part="2" 
F 0 "U?" H 5450 4217 50  0000 C CNN
F 1 "LM324" H 5450 4126 50  0000 C CNN
F 2 "" H 5400 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 5500 4050 50  0001 C CNN
	2    5450 3850
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM324 U?
U 3 1 5ECE36BD
P 7650 3950
AR Path="/5EC7150D/5ECE36BD" Ref="U?"  Part="3" 
AR Path="/5ECD8445/5ECE36BD" Ref="U?"  Part="3" 
F 0 "U?" H 7650 4317 50  0000 C CNN
F 1 "LM324" H 7650 4226 50  0000 C CNN
F 2 "" H 7600 4050 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 7700 4150 50  0001 C CNN
	3    7650 3950
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM324 U?
U 4 1 5ECE36C3
P 7250 2300
AR Path="/5EC7150D/5ECE36C3" Ref="U?"  Part="4" 
AR Path="/5ECD8445/5ECE36C3" Ref="U?"  Part="4" 
F 0 "U?" H 7250 2667 50  0000 C CNN
F 1 "LM324" H 7250 2576 50  0000 C CNN
F 2 "" H 7200 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 7300 2500 50  0001 C CNN
	4    7250 2300
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM324 U?
U 5 1 5ECE36C9
P 3100 4650
AR Path="/5EC7150D/5ECE36C9" Ref="U?"  Part="5" 
AR Path="/5ECD8445/5ECE36C9" Ref="U?"  Part="5" 
F 0 "U?" H 3058 4696 50  0000 L CNN
F 1 "LM324" H 3058 4605 50  0000 L CNN
F 2 "" H 3050 4750 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 3150 4850 50  0001 C CNN
	5    3100 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5ECE36E1
P 5100 3050
AR Path="/5EC7150D/5ECE36E1" Ref="#PWR?"  Part="1" 
AR Path="/5ECD8445/5ECE36E1" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5100 2800 50  0001 C CNN
F 1 "GNDA" H 5105 2877 50  0000 C CNN
F 2 "" H 5100 3050 50  0001 C CNN
F 3 "" H 5100 3050 50  0001 C CNN
	1    5100 3050
	1    0    0    -1  
$EndComp
Text HLabel 3500 2100 0    50   Input ~ 0
DAC
Text Notes 5000 1700 0    50   ~ 0
Amplificador ganancia = 3\n\n
Text Notes 3250 2350 0    50   ~ 0
0-3.3V\n
Wire Wire Line
	5150 2300 5100 2300
Wire Wire Line
	7350 4050 7300 4050
Wire Wire Line
	7300 4050 7300 4200
Wire Wire Line
	7300 4200 8000 4200
Wire Wire Line
	8000 4200 8000 3950
Wire Wire Line
	8000 3950 7950 3950
Wire Wire Line
	5150 3950 5100 3950
Wire Wire Line
	5100 3950 5100 4100
Wire Wire Line
	5100 4100 5800 4100
Wire Wire Line
	5800 4100 5800 3850
Wire Wire Line
	5800 3850 5750 3850
Wire Wire Line
	6950 2400 6900 2400
Wire Wire Line
	6900 2550 7600 2550
Wire Wire Line
	7600 2300 7550 2300
$Comp
L Device:R R?
U 1 1 5ECE3735
P 6100 2200
AR Path="/5EC7150D/5ECE3735" Ref="R?"  Part="1" 
AR Path="/5ECD8445/5ECE3735" Ref="R?"  Part="1" 
F 0 "R?" V 5893 2200 50  0000 C CNN
F 1 "22k" V 5984 2200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6030 2200 50  0001 C CNN
F 3 "~" H 6100 2200 50  0001 C CNN
	1    6100 2200
	0    1    1    0   
$EndComp
$Comp
L pspice:C C?
U 1 1 5ECE3765
P 6500 2500
AR Path="/5EC7150D/5ECE3765" Ref="C?"  Part="1" 
AR Path="/5ECD8445/5ECE3765" Ref="C?"  Part="1" 
F 0 "C?" H 6300 2350 50  0000 L CNN
F 1 "1nF" H 6600 2350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6500 2500 50  0001 C CNN
F 3 "~" H 6500 2500 50  0001 C CNN
	1    6500 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5ECE376B
P 6500 2850
AR Path="/5EC7150D/5ECE376B" Ref="#PWR?"  Part="1" 
AR Path="/5ECD8445/5ECE376B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6500 2600 50  0001 C CNN
F 1 "GNDA" H 6505 2677 50  0000 C CNN
F 2 "" H 6500 2850 50  0001 C CNN
F 3 "" H 6500 2850 50  0001 C CNN
	1    6500 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 2750 6500 2850
Wire Wire Line
	6900 2400 6900 2550
Wire Wire Line
	6950 2200 6500 2200
Wire Wire Line
	6500 2250 6500 2200
Text HLabel 8050 2300 2    50   Output ~ 0
AnalogOut
Wire Wire Line
	7600 2550 7600 2300
$Comp
L power:GNDA #PWR?
U 1 1 5ECE3791
P 3000 5050
AR Path="/5EC7150D/5ECE3791" Ref="#PWR?"  Part="1" 
AR Path="/5ECD8445/5ECE3791" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3000 4800 50  0001 C CNN
F 1 "GNDA" H 3005 4877 50  0000 C CNN
F 2 "" H 3000 5050 50  0001 C CNN
F 3 "" H 3000 5050 50  0001 C CNN
	1    3000 5050
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5ECE3797
P 3000 4200
AR Path="/5EC7150D/5ECE3797" Ref="#PWR?"  Part="1" 
AR Path="/5ECD8445/5ECE3797" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3000 4050 50  0001 C CNN
F 1 "+12V" H 3015 4373 50  0000 C CNN
F 2 "" H 3000 4200 50  0001 C CNN
F 3 "" H 3000 4200 50  0001 C CNN
	1    3000 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 4200 3000 4350
Wire Wire Line
	3000 4950 3000 5050
$Comp
L power:GNDA #PWR?
U 1 1 5ECE379F
P 1900 5000
AR Path="/5EC7150D/5ECE379F" Ref="#PWR?"  Part="1" 
AR Path="/5ECD8445/5ECE379F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1900 4750 50  0001 C CNN
F 1 "GNDA" H 1905 4827 50  0000 C CNN
F 2 "" H 1900 5000 50  0001 C CNN
F 3 "" H 1900 5000 50  0001 C CNN
	1    1900 5000
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5ECE37A5
P 1900 4150
AR Path="/5EC7150D/5ECE37A5" Ref="#PWR?"  Part="1" 
AR Path="/5ECD8445/5ECE37A5" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1900 4000 50  0001 C CNN
F 1 "+12V" H 1915 4323 50  0000 C CNN
F 2 "" H 1900 4150 50  0001 C CNN
F 3 "" H 1900 4150 50  0001 C CNN
	1    1900 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 4150 1900 4300
Wire Wire Line
	1900 4900 1900 5000
$Comp
L pspice:C C?
U 1 1 5ECE37AD
P 1900 4600
AR Path="/5EC7150D/5ECE37AD" Ref="C?"  Part="1" 
AR Path="/5ECD8445/5ECE37AD" Ref="C?"  Part="1" 
F 0 "C?" H 1700 4450 50  0000 L CNN
F 1 "100nF" H 2000 4450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1900 4600 50  0001 C CNN
F 3 "~" H 1900 4600 50  0001 C CNN
	1    1900 4600
	1    0    0    -1  
$EndComp
$Comp
L pspice:C C?
U 1 1 5ECE37B3
P 1450 4600
AR Path="/5EC7150D/5ECE37B3" Ref="C?"  Part="1" 
AR Path="/5ECD8445/5ECE37B3" Ref="C?"  Part="1" 
F 0 "C?" H 1250 4450 50  0000 L CNN
F 1 "1nF" H 1550 4450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1450 4600 50  0001 C CNN
F 3 "~" H 1450 4600 50  0001 C CNN
	1    1450 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 4350 1450 4300
Wire Wire Line
	1450 4300 1900 4300
Wire Wire Line
	1900 4300 1900 4350
Connection ~ 1900 4300
Wire Wire Line
	1900 4900 1450 4900
Wire Wire Line
	1450 4900 1450 4850
Wire Wire Line
	1900 4850 1900 4900
Connection ~ 1900 4900
$Comp
L Device:R R?
U 1 1 5ECE9958
P 5100 2800
AR Path="/5EC7150D/5ECE9958" Ref="R?"  Part="1" 
AR Path="/5ECD8445/5ECE9958" Ref="R?"  Part="1" 
F 0 "R?" V 4893 2800 50  0000 C CNN
F 1 "22k" V 4984 2800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5030 2800 50  0001 C CNN
F 3 "~" H 5100 2800 50  0001 C CNN
	1    5100 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5ECEACFC
P 5400 2550
AR Path="/5EC7150D/5ECEACFC" Ref="R?"  Part="1" 
AR Path="/5ECD8445/5ECEACFC" Ref="R?"  Part="1" 
F 0 "R?" V 5193 2550 50  0000 C CNN
F 1 "22k" V 5284 2550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5330 2550 50  0001 C CNN
F 3 "~" H 5400 2550 50  0001 C CNN
	1    5400 2550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5750 2200 5800 2200
Wire Wire Line
	5550 2550 5800 2550
Wire Wire Line
	5800 2550 5800 2200
Connection ~ 5800 2200
Wire Wire Line
	5800 2200 5950 2200
Wire Wire Line
	5250 2550 5100 2550
Wire Wire Line
	5100 2550 5100 2300
Wire Wire Line
	5100 2650 5100 2550
Connection ~ 5100 2550
Wire Wire Line
	5150 2100 3500 2100
Wire Wire Line
	5100 2950 5100 3050
$Comp
L Device:R R?
U 1 1 5ECFCB60
P 4750 2800
AR Path="/5EC7150D/5ECFCB60" Ref="R?"  Part="1" 
AR Path="/5ECD8445/5ECFCB60" Ref="R?"  Part="1" 
F 0 "R?" V 4543 2800 50  0000 C CNN
F 1 "22k" V 4634 2800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4680 2800 50  0001 C CNN
F 3 "~" H 4750 2800 50  0001 C CNN
	1    4750 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 2650 4750 2550
Wire Wire Line
	4750 2950 4750 3050
Wire Wire Line
	5100 2550 4750 2550
$Comp
L power:GNDA #PWR?
U 1 1 5ECFF468
P 4750 3050
AR Path="/5EC7150D/5ECFF468" Ref="#PWR?"  Part="1" 
AR Path="/5ECD8445/5ECFF468" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4750 2800 50  0001 C CNN
F 1 "GNDA" H 4755 2877 50  0000 C CNN
F 2 "" H 4750 3050 50  0001 C CNN
F 3 "" H 4750 3050 50  0001 C CNN
	1    4750 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 2200 6500 2200
Connection ~ 6500 2200
Wire Wire Line
	7600 2300 8050 2300
Connection ~ 7600 2300
Wire Wire Line
	7100 3850 7100 3950
Wire Wire Line
	4900 3750 4900 3850
$Comp
L power:GNDA #PWR?
U 1 1 5ECE370E
P 7100 3950
AR Path="/5EC7150D/5ECE370E" Ref="#PWR?"  Part="1" 
AR Path="/5ECD8445/5ECE370E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7100 3700 50  0001 C CNN
F 1 "GNDA" H 7105 3777 50  0000 C CNN
F 2 "" H 7100 3950 50  0001 C CNN
F 3 "" H 7100 3950 50  0001 C CNN
	1    7100 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5ECE3708
P 4900 3850
AR Path="/5EC7150D/5ECE3708" Ref="#PWR?"  Part="1" 
AR Path="/5ECD8445/5ECE3708" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4900 3600 50  0001 C CNN
F 1 "GNDA" H 4905 3677 50  0000 C CNN
F 2 "" H 4900 3850 50  0001 C CNN
F 3 "" H 4900 3850 50  0001 C CNN
	1    4900 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 3850 7100 3850
Wire Wire Line
	5150 3750 4900 3750
Text Notes 8050 2500 0    50   ~ 0
0-10V\n
$EndSCHEMATC
