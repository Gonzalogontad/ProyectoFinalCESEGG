EESchema Schematic File Version 4
LIBS:ModPrincipal-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 8
Title "Probado - Modulo Principal"
Date "2020-05-31"
Rev "1.0"
Comp "CESE - FIUBA"
Comment1 "Gonzalo Gontad"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Amplifier_Operational:LM324 U201
U 1 1 5EC720AC
P 5150 2050
F 0 "U201" H 5150 2417 50  0000 C CNN
F 1 "LM324" H 5150 2326 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5100 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 5200 2250 50  0001 C CNN
	1    5150 2050
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM324 U201
U 2 1 5EC745ED
P 5150 3500
F 0 "U201" H 5150 3867 50  0000 C CNN
F 1 "LM324" H 5150 3776 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5100 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 5200 3700 50  0001 C CNN
	2    5150 3500
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM324 U201
U 3 1 5EC75219
P 6850 3600
F 0 "U201" H 6850 3967 50  0000 C CNN
F 1 "LM324" H 6850 3876 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6800 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 6900 3800 50  0001 C CNN
	3    6850 3600
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM324 U201
U 4 1 5EC763BC
P 6850 2150
F 0 "U201" H 6850 2517 50  0000 C CNN
F 1 "LM324" H 6850 2426 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6800 2250 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 6900 2350 50  0001 C CNN
	4    6850 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R201
U 1 1 5EC815E1
P 3650 1950
F 0 "R201" V 3443 1950 50  0000 C CNN
F 1 "5k6" V 3534 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3580 1950 50  0001 C CNN
F 3 "~" H 3650 1950 50  0001 C CNN
	1    3650 1950
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D201
U 1 1 5EC82013
P 4300 2200
F 0 "D201" V 4254 2279 50  0000 L CNN
F 1 "1N5242" V 4345 2279 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4300 2200 50  0001 C CNN
F 3 "~" H 4300 2200 50  0001 C CNN
	1    4300 2200
	0    1    1    0   
$EndComp
$Comp
L pspice:C C203
U 1 1 5EC83E7A
P 4000 2300
F 0 "C203" H 3700 2400 50  0000 L CNN
F 1 "1nF" H 3700 2300 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4000 2300 50  0001 C CNN
F 3 "~" H 4000 2300 50  0001 C CNN
	1    4000 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0205
U 1 1 5EC89BB6
P 4000 2650
F 0 "#PWR0205" H 4000 2400 50  0001 C CNN
F 1 "GNDA" H 4005 2477 50  0000 C CNN
F 2 "" H 4000 2650 50  0001 C CNN
F 3 "" H 4000 2650 50  0001 C CNN
	1    4000 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0207
U 1 1 5EC8A1A3
P 4300 2450
F 0 "#PWR0207" H 4300 2200 50  0001 C CNN
F 1 "GNDA" H 4305 2277 50  0000 C CNN
F 2 "" H 4300 2450 50  0001 C CNN
F 3 "" H 4300 2450 50  0001 C CNN
	1    4300 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2550 4000 2650
Wire Wire Line
	4300 2350 4300 2450
Wire Wire Line
	3800 1950 4000 1950
Wire Wire Line
	4300 1950 4300 2050
Wire Wire Line
	4000 2050 4000 1950
Connection ~ 4000 1950
Wire Wire Line
	4000 1950 4300 1950
Text HLabel 3200 1950 0    50   Input ~ 0
Analog0
Text HLabel 3150 3400 0    50   Input ~ 0
Analog1
$Comp
L Device:R R202
U 1 1 5EC95F9A
P 3650 3400
F 0 "R202" V 3443 3400 50  0000 C CNN
F 1 "5k6" V 3534 3400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3580 3400 50  0001 C CNN
F 3 "~" H 3650 3400 50  0001 C CNN
	1    3650 3400
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D202
U 1 1 5EC95FA0
P 4300 3650
F 0 "D202" V 4254 3729 50  0000 L CNN
F 1 "1N5242" V 4345 3729 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4300 3650 50  0001 C CNN
F 3 "~" H 4300 3650 50  0001 C CNN
	1    4300 3650
	0    1    1    0   
$EndComp
$Comp
L pspice:C C204
U 1 1 5EC95FA6
P 4000 3750
F 0 "C204" H 3700 3850 50  0000 L CNN
F 1 "1nF" H 3700 3750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4000 3750 50  0001 C CNN
F 3 "~" H 4000 3750 50  0001 C CNN
	1    4000 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0206
U 1 1 5EC95FAC
P 4000 4100
F 0 "#PWR0206" H 4000 3850 50  0001 C CNN
F 1 "GNDA" H 4005 3927 50  0000 C CNN
F 2 "" H 4000 4100 50  0001 C CNN
F 3 "" H 4000 4100 50  0001 C CNN
	1    4000 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0208
U 1 1 5EC95FB2
P 4300 3900
F 0 "#PWR0208" H 4300 3650 50  0001 C CNN
F 1 "GNDA" H 4305 3727 50  0000 C CNN
F 2 "" H 4300 3900 50  0001 C CNN
F 3 "" H 4300 3900 50  0001 C CNN
	1    4300 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 3800 4300 3900
Wire Wire Line
	3800 3400 4000 3400
Wire Wire Line
	4300 3400 4300 3500
Wire Wire Line
	4000 3500 4000 3400
Connection ~ 4000 3400
Wire Wire Line
	4000 3400 4300 3400
Wire Wire Line
	3200 1950 3500 1950
Wire Wire Line
	3150 3400 3500 3400
Text Notes 2700 3550 0    50   ~ 0
0-10V (max 38v)\n
Text Notes 2700 2100 0    50   ~ 0
0-10V (max 38v)\n
Wire Wire Line
	4850 2150 4800 2150
Wire Wire Line
	4800 2150 4800 2300
Wire Wire Line
	4800 2300 5500 2300
Wire Wire Line
	5500 2300 5500 2050
Wire Wire Line
	5500 2050 5450 2050
Wire Wire Line
	6550 3700 6500 3700
Wire Wire Line
	6500 3700 6500 3850
Wire Wire Line
	6500 3850 7200 3850
Wire Wire Line
	7200 3850 7200 3600
Wire Wire Line
	7200 3600 7150 3600
Wire Wire Line
	4850 3600 4800 3600
Wire Wire Line
	4800 3600 4800 3750
Wire Wire Line
	4800 3750 5500 3750
Wire Wire Line
	5500 3750 5500 3500
Wire Wire Line
	5500 3500 5450 3500
Wire Wire Line
	6550 2250 6500 2250
Wire Wire Line
	6500 2400 7200 2400
Wire Wire Line
	7200 2150 7150 2150
Wire Wire Line
	4850 1950 4300 1950
Connection ~ 4300 1950
Wire Wire Line
	4300 3400 4850 3400
Connection ~ 4300 3400
$Comp
L Device:R R203
U 1 1 5ECC0906
P 5800 2050
F 0 "R203" V 5593 2050 50  0000 C CNN
F 1 "22k" V 5684 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5730 2050 50  0001 C CNN
F 3 "~" H 5800 2050 50  0001 C CNN
	1    5800 2050
	0    1    1    0   
$EndComp
$Comp
L Device:R R205
U 1 1 5ECC102A
P 6100 2250
F 0 "R205" H 6170 2296 50  0000 L CNN
F 1 "10k" H 6170 2205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6030 2250 50  0001 C CNN
F 3 "~" H 6100 2250 50  0001 C CNN
	1    6100 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2050 5650 2050
Connection ~ 5500 2050
Wire Wire Line
	5950 2050 6100 2050
Wire Wire Line
	6100 2050 6100 2100
$Comp
L power:GNDA #PWR0209
U 1 1 5ECC2D62
P 6100 2500
F 0 "#PWR0209" H 6100 2250 50  0001 C CNN
F 1 "GNDA" H 6105 2327 50  0000 C CNN
F 2 "" H 6100 2500 50  0001 C CNN
F 3 "" H 6100 2500 50  0001 C CNN
	1    6100 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 2400 6100 2500
$Comp
L Device:R R204
U 1 1 5ECCC4AE
P 5800 3500
F 0 "R204" V 5593 3500 50  0000 C CNN
F 1 "22k" V 5684 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5730 3500 50  0001 C CNN
F 3 "~" H 5800 3500 50  0001 C CNN
	1    5800 3500
	0    1    1    0   
$EndComp
$Comp
L Device:R R206
U 1 1 5ECCC4B4
P 6100 3700
F 0 "R206" H 6170 3746 50  0000 L CNN
F 1 "10k" H 6170 3655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6030 3700 50  0001 C CNN
F 3 "~" H 6100 3700 50  0001 C CNN
	1    6100 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 3500 6100 3500
Wire Wire Line
	6100 3500 6100 3550
$Comp
L power:GNDA #PWR0210
U 1 1 5ECCC4BD
P 6100 3950
F 0 "#PWR0210" H 6100 3700 50  0001 C CNN
F 1 "GNDA" H 6105 3777 50  0000 C CNN
F 2 "" H 6100 3950 50  0001 C CNN
F 3 "" H 6100 3950 50  0001 C CNN
	1    6100 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3850 6100 3950
Wire Wire Line
	5650 3500 5500 3500
Connection ~ 5500 3500
Text Notes 5700 1700 0    50   ~ 0
Divisor por 3.2
Text Notes 3400 1600 0    50   ~ 0
Limitador de tension de entrada\n
$Comp
L pspice:C C205
U 1 1 5ECFBDEC
P 7900 2450
F 0 "C205" H 7700 2300 50  0000 L CNN
F 1 "1nF" H 8000 2300 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7900 2450 50  0001 C CNN
F 3 "~" H 7900 2450 50  0001 C CNN
	1    7900 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 2700 7900 2800
Wire Wire Line
	6500 2250 6500 2400
Wire Wire Line
	7900 2200 7900 2150
$Comp
L pspice:C C206
U 1 1 5ED294AB
P 7900 3900
F 0 "C206" H 7700 3750 50  0000 L CNN
F 1 "1nF" H 8000 3750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7900 3900 50  0001 C CNN
F 3 "~" H 7900 3900 50  0001 C CNN
	1    7900 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 4150 7900 4250
Wire Wire Line
	7900 3650 7900 3600
Text HLabel 8100 2150 2    50   Output ~ 0
ADC0
Text HLabel 8100 3600 2    50   Output ~ 0
ADC1
Wire Wire Line
	7200 2400 7200 2150
Wire Wire Line
	8100 2150 7900 2150
Wire Wire Line
	8100 3600 7900 3600
$Comp
L power:GNDA #PWR0204
U 1 1 5ED5191C
P 3150 6000
F 0 "#PWR0204" H 3150 5750 50  0001 C CNN
F 1 "GNDA" H 3155 5827 50  0000 C CNN
F 2 "" H 3150 6000 50  0001 C CNN
F 3 "" H 3150 6000 50  0001 C CNN
	1    3150 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0203
U 1 1 5ED53B17
P 3150 5150
F 0 "#PWR0203" H 3150 5000 50  0001 C CNN
F 1 "+12V" H 3165 5323 50  0000 C CNN
F 2 "" H 3150 5150 50  0001 C CNN
F 3 "" H 3150 5150 50  0001 C CNN
	1    3150 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 5150 3150 5300
$Comp
L power:GNDA #PWR0202
U 1 1 5ED582BA
P 2050 5950
F 0 "#PWR0202" H 2050 5700 50  0001 C CNN
F 1 "GNDA" H 2055 5777 50  0000 C CNN
F 2 "" H 2050 5950 50  0001 C CNN
F 3 "" H 2050 5950 50  0001 C CNN
	1    2050 5950
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0201
U 1 1 5ED582C0
P 2050 5100
F 0 "#PWR0201" H 2050 4950 50  0001 C CNN
F 1 "+12V" H 2065 5273 50  0000 C CNN
F 2 "" H 2050 5100 50  0001 C CNN
F 3 "" H 2050 5100 50  0001 C CNN
	1    2050 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 5100 2050 5250
Wire Wire Line
	2050 5850 2050 5950
$Comp
L pspice:C C202
U 1 1 5ED62371
P 2050 5550
F 0 "C202" H 1850 5400 50  0000 L CNN
F 1 "100nF" H 2150 5400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2050 5550 50  0001 C CNN
F 3 "~" H 2050 5550 50  0001 C CNN
	1    2050 5550
	1    0    0    -1  
$EndComp
$Comp
L pspice:C C201
U 1 1 5ED63839
P 1600 5550
F 0 "C201" H 1400 5400 50  0000 L CNN
F 1 "1nF" H 1700 5400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1600 5550 50  0001 C CNN
F 3 "~" H 1600 5550 50  0001 C CNN
	1    1600 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 5300 1600 5250
Wire Wire Line
	1600 5250 2050 5250
Wire Wire Line
	2050 5250 2050 5300
Connection ~ 2050 5250
Wire Wire Line
	2050 5850 1600 5850
Wire Wire Line
	1600 5850 1600 5800
Wire Wire Line
	2050 5800 2050 5850
Connection ~ 2050 5850
$Comp
L Device:R R207
U 1 1 5ED0C39C
P 7500 2150
F 0 "R207" V 7293 2150 50  0000 C CNN
F 1 "10k" V 7384 2150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7430 2150 50  0001 C CNN
F 3 "~" H 7500 2150 50  0001 C CNN
	1    7500 2150
	0    1    1    0   
$EndComp
$Comp
L Device:R R208
U 1 1 5ED0D996
P 7500 3600
F 0 "R208" V 7293 3600 50  0000 C CNN
F 1 "10k" V 7384 3600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7430 3600 50  0001 C CNN
F 3 "~" H 7500 3600 50  0001 C CNN
	1    7500 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	7650 3600 7900 3600
Connection ~ 7900 3600
Wire Wire Line
	7350 3600 7200 3600
Connection ~ 7200 3600
Wire Wire Line
	7900 2150 7650 2150
Connection ~ 7900 2150
Wire Wire Line
	7200 2150 7350 2150
Connection ~ 7200 2150
Wire Wire Line
	6550 2050 6100 2050
Connection ~ 6100 2050
Wire Wire Line
	6100 3500 6550 3500
Connection ~ 6100 3500
$Comp
L Connector:TestPoint TP?
U 1 1 5ED569D6
P 7900 2100
AR Path="/5ECD8445/5ED569D6" Ref="TP?"  Part="1" 
AR Path="/5EC7150D/5ED569D6" Ref="TP201"  Part="1" 
F 0 "TP201" H 7958 2218 50  0000 L CNN
F 1 "TestPoint" H 7958 2127 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 8100 2100 50  0001 C CNN
F 3 "~" H 8100 2100 50  0001 C CNN
	1    7900 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 2100 7900 2150
$Comp
L Connector:TestPoint TP?
U 1 1 5ED58D2E
P 7900 3550
AR Path="/5ECD8445/5ED58D2E" Ref="TP?"  Part="1" 
AR Path="/5EC7150D/5ED58D2E" Ref="TP202"  Part="1" 
F 0 "TP202" H 7958 3668 50  0000 L CNN
F 1 "TestPoint" H 7958 3577 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 8100 3550 50  0001 C CNN
F 3 "~" H 8100 3550 50  0001 C CNN
	1    7900 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3550 7900 3600
$Comp
L Amplifier_Operational:LM324 U201
U 5 1 5EC776DF
P 3250 5600
F 0 "U201" H 3208 5646 50  0000 L CNN
F 1 "LM324" H 3208 5555 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3200 5700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 3300 5800 50  0001 C CNN
	5    3250 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 5900 3150 6000
Wire Wire Line
	4000 4000 4000 4100
$Comp
L power:GND #PWR0111
U 1 1 5EE1B5B1
P 7900 4250
F 0 "#PWR0111" H 7900 4000 50  0001 C CNN
F 1 "GND" H 7905 4077 50  0000 C CNN
F 2 "" H 7900 4250 50  0001 C CNN
F 3 "" H 7900 4250 50  0001 C CNN
	1    7900 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5EE1DAA9
P 7900 2800
F 0 "#PWR0112" H 7900 2550 50  0001 C CNN
F 1 "GND" H 7905 2627 50  0000 C CNN
F 2 "" H 7900 2800 50  0001 C CNN
F 3 "" H 7900 2800 50  0001 C CNN
	1    7900 2800
	1    0    0    -1  
$EndComp
$EndSCHEMATC
