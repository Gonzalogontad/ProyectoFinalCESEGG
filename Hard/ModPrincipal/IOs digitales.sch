EESchema Schematic File Version 4
LIBS:ModPrincipal-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 8
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 2100 1500 0    50   Input ~ 0
CPU_Out0
Text HLabel 2100 2800 0    50   Input ~ 0
CPU_Out1
Text HLabel 2100 4250 0    50   Input ~ 0
CPU_Out2
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EE76D0E
P 2950 1500
AR Path="/5ED20EE2/5EE76D0E" Ref="Q?"  Part="1" 
AR Path="/5EE6B2B0/5EE76D0E" Ref="Q702"  Part="1" 
F 0 "Q702" H 3156 1546 50  0000 L CNN
F 1 "2N7002" H 3156 1455 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3150 1425 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2950 1500 50  0001 L CNN
	1    2950 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 1300 3050 1250
$Comp
L Device:R R?
U 1 1 5EE76D16
P 2500 1500
AR Path="/5EC7150D/5EE76D16" Ref="R?"  Part="1" 
AR Path="/5ED20EE2/5EE76D16" Ref="R?"  Part="1" 
AR Path="/5EE6B2B0/5EE76D16" Ref="R703"  Part="1" 
F 0 "R703" V 2600 1450 50  0000 L CNN
F 1 "10k" V 2400 1450 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2430 1500 50  0001 C CNN
F 3 "~" H 2500 1500 50  0001 C CNN
	1    2500 1500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2100 1500 2350 1500
$Comp
L Device:R R?
U 1 1 5EE76D1E
P 2700 1850
AR Path="/5EC7150D/5EE76D1E" Ref="R?"  Part="1" 
AR Path="/5ED20EE2/5EE76D1E" Ref="R?"  Part="1" 
AR Path="/5EE6B2B0/5EE76D1E" Ref="R706"  Part="1" 
F 0 "R706" V 2800 1800 50  0000 L CNN
F 1 "330 k" V 2600 1800 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2630 1850 50  0001 C CNN
F 3 "~" H 2700 1850 50  0001 C CNN
	1    2700 1850
	-1   0    0    1   
$EndComp
Wire Wire Line
	2700 1700 2700 1500
$Comp
L power:GND #PWR0703
U 1 1 5EE7ABCF
P 2700 2150
F 0 "#PWR0703" H 2700 1900 50  0001 C CNN
F 1 "GND" H 2705 1977 50  0000 C CNN
F 2 "" H 2700 2150 50  0001 C CNN
F 3 "" H 2700 2150 50  0001 C CNN
	1    2700 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0708
U 1 1 5EE7C10C
P 3050 1900
F 0 "#PWR0708" H 3050 1650 50  0001 C CNN
F 1 "GND" H 3055 1727 50  0000 C CNN
F 2 "" H 3050 1900 50  0001 C CNN
F 3 "" H 3050 1900 50  0001 C CNN
	1    3050 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 1500 2700 1500
Connection ~ 2700 1500
Wire Wire Line
	2700 1500 2750 1500
Wire Wire Line
	3050 1700 3050 1900
Wire Wire Line
	2700 2000 2700 2150
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EE8E735
P 2950 2800
AR Path="/5ED20EE2/5EE8E735" Ref="Q?"  Part="1" 
AR Path="/5EE6B2B0/5EE8E735" Ref="Q703"  Part="1" 
F 0 "Q703" H 3156 2846 50  0000 L CNN
F 1 "2N7002" H 3156 2755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3150 2725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2950 2800 50  0001 L CNN
	1    2950 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2600 3050 2550
$Comp
L Device:R R?
U 1 1 5EE8E73C
P 2500 2800
AR Path="/5EC7150D/5EE8E73C" Ref="R?"  Part="1" 
AR Path="/5ED20EE2/5EE8E73C" Ref="R?"  Part="1" 
AR Path="/5EE6B2B0/5EE8E73C" Ref="R704"  Part="1" 
F 0 "R704" V 2600 2750 50  0000 L CNN
F 1 "10k" V 2400 2750 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2430 2800 50  0001 C CNN
F 3 "~" H 2500 2800 50  0001 C CNN
	1    2500 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2100 2800 2350 2800
$Comp
L Device:R R?
U 1 1 5EE8E743
P 2700 3150
AR Path="/5EC7150D/5EE8E743" Ref="R?"  Part="1" 
AR Path="/5ED20EE2/5EE8E743" Ref="R?"  Part="1" 
AR Path="/5EE6B2B0/5EE8E743" Ref="R707"  Part="1" 
F 0 "R707" V 2800 3100 50  0000 L CNN
F 1 "330 k" V 2600 3100 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2630 3150 50  0001 C CNN
F 3 "~" H 2700 3150 50  0001 C CNN
	1    2700 3150
	-1   0    0    1   
$EndComp
Wire Wire Line
	2700 3000 2700 2800
$Comp
L power:GND #PWR0704
U 1 1 5EE8E74A
P 2700 3450
F 0 "#PWR0704" H 2700 3200 50  0001 C CNN
F 1 "GND" H 2705 3277 50  0000 C CNN
F 2 "" H 2700 3450 50  0001 C CNN
F 3 "" H 2700 3450 50  0001 C CNN
	1    2700 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0709
U 1 1 5EE8E750
P 3050 3200
F 0 "#PWR0709" H 3050 2950 50  0001 C CNN
F 1 "GND" H 3055 3027 50  0000 C CNN
F 2 "" H 3050 3200 50  0001 C CNN
F 3 "" H 3050 3200 50  0001 C CNN
	1    3050 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 2800 2700 2800
Connection ~ 2700 2800
Wire Wire Line
	2700 2800 2750 2800
Wire Wire Line
	3050 3000 3050 3200
Wire Wire Line
	2700 3300 2700 3450
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EE98A51
P 2950 4250
AR Path="/5ED20EE2/5EE98A51" Ref="Q?"  Part="1" 
AR Path="/5EE6B2B0/5EE98A51" Ref="Q704"  Part="1" 
F 0 "Q704" H 3156 4296 50  0000 L CNN
F 1 "2N7002" H 3156 4205 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3150 4175 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2950 4250 50  0001 L CNN
	1    2950 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 4050 3050 4000
$Comp
L Device:R R?
U 1 1 5EE98A58
P 2500 4250
AR Path="/5EC7150D/5EE98A58" Ref="R?"  Part="1" 
AR Path="/5ED20EE2/5EE98A58" Ref="R?"  Part="1" 
AR Path="/5EE6B2B0/5EE98A58" Ref="R705"  Part="1" 
F 0 "R705" V 2600 4200 50  0000 L CNN
F 1 "10k" V 2400 4200 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2430 4250 50  0001 C CNN
F 3 "~" H 2500 4250 50  0001 C CNN
	1    2500 4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2100 4250 2350 4250
$Comp
L Device:R R?
U 1 1 5EE98A5F
P 2700 4600
AR Path="/5EC7150D/5EE98A5F" Ref="R?"  Part="1" 
AR Path="/5ED20EE2/5EE98A5F" Ref="R?"  Part="1" 
AR Path="/5EE6B2B0/5EE98A5F" Ref="R708"  Part="1" 
F 0 "R708" V 2800 4550 50  0000 L CNN
F 1 "330 k" V 2600 4550 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2630 4600 50  0001 C CNN
F 3 "~" H 2700 4600 50  0001 C CNN
	1    2700 4600
	-1   0    0    1   
$EndComp
Wire Wire Line
	2700 4450 2700 4250
$Comp
L power:GND #PWR0705
U 1 1 5EE98A66
P 2700 4900
F 0 "#PWR0705" H 2700 4650 50  0001 C CNN
F 1 "GND" H 2705 4727 50  0000 C CNN
F 2 "" H 2700 4900 50  0001 C CNN
F 3 "" H 2700 4900 50  0001 C CNN
	1    2700 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0710
U 1 1 5EE98A6C
P 3050 4650
F 0 "#PWR0710" H 3050 4400 50  0001 C CNN
F 1 "GND" H 3055 4477 50  0000 C CNN
F 2 "" H 3050 4650 50  0001 C CNN
F 3 "" H 3050 4650 50  0001 C CNN
	1    3050 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 4250 2700 4250
Connection ~ 2700 4250
Wire Wire Line
	2700 4250 2750 4250
Wire Wire Line
	3050 4450 3050 4650
Wire Wire Line
	2700 4750 2700 4900
Text HLabel 3500 1250 2    50   Output ~ 0
Salida0
Text HLabel 3500 2550 2    50   Output ~ 0
Salida1
Text HLabel 3500 4000 2    50   Output ~ 0
Salida2
Wire Wire Line
	3500 4000 3050 4000
Wire Wire Line
	3500 2550 3050 2550
Wire Wire Line
	3050 1250 3500 1250
Text HLabel 9850 1550 2    50   Output ~ 0
CPU_In0
$Comp
L Device:R R?
U 1 1 5EF0FB5E
P 7900 1550
AR Path="/5EC7150D/5EF0FB5E" Ref="R?"  Part="1" 
AR Path="/5EE6B2B0/5EF0FB5E" Ref="R711"  Part="1" 
F 0 "R711" V 7693 1550 50  0000 C CNN
F 1 "10k" V 7784 1550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7830 1550 50  0001 C CNN
F 3 "~" H 7900 1550 50  0001 C CNN
	1    7900 1550
	0    1    1    0   
$EndComp
$Comp
L pspice:C C?
U 1 1 5EF0FB6A
P 8750 1900
AR Path="/5EC7150D/5EF0FB6A" Ref="C?"  Part="1" 
AR Path="/5EE6B2B0/5EF0FB6A" Ref="C703"  Part="1" 
F 0 "C703" H 8450 2000 50  0000 L CNN
F 1 "1nF" H 8450 1900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8750 1900 50  0001 C CNN
F 3 "~" H 8750 1900 50  0001 C CNN
	1    8750 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 2150 8750 2250
Wire Wire Line
	8750 1650 8750 1550
Wire Wire Line
	7450 1550 7750 1550
Wire Wire Line
	8750 1550 9050 1550
Connection ~ 9050 1550
Wire Wire Line
	9050 1550 9050 1650
Wire Wire Line
	9050 1950 9050 2050
$Comp
L Diode:1N4148W D708
U 1 1 5EF29FDB
P 9050 1800
F 0 "D708" V 9004 1880 50  0000 L CNN
F 1 "1N4148W" V 9095 1880 50  0000 L CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" H 9050 1625 50  0001 C CNN
F 3 "https://www.vishay.com/docs/85748/1n4148w.pdf" H 9050 1800 50  0001 C CNN
	1    9050 1800
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4148W D707
U 1 1 5EF2B295
P 9050 1300
F 0 "D707" V 9004 1380 50  0000 L CNN
F 1 "1N4148W" V 9095 1380 50  0000 L CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" H 9050 1125 50  0001 C CNN
F 3 "https://www.vishay.com/docs/85748/1n4148w.pdf" H 9050 1300 50  0001 C CNN
	1    9050 1300
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0721
U 1 1 5EF2B788
P 9050 1050
F 0 "#PWR0721" H 9050 900 50  0001 C CNN
F 1 "+3.3V" H 9065 1223 50  0000 C CNN
F 2 "" H 9050 1050 50  0001 C CNN
F 3 "" H 9050 1050 50  0001 C CNN
	1    9050 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 1050 9050 1150
Wire Wire Line
	9050 1450 9050 1550
Connection ~ 8750 1550
$Comp
L power:GND #PWR0722
U 1 1 5EF355D4
P 9050 2050
F 0 "#PWR0722" H 9050 1800 50  0001 C CNN
F 1 "GND" H 9055 1877 50  0000 C CNN
F 2 "" H 9050 2050 50  0001 C CNN
F 3 "" H 9050 2050 50  0001 C CNN
	1    9050 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0720
U 1 1 5EF35BD3
P 8750 2250
F 0 "#PWR0720" H 8750 2000 50  0001 C CNN
F 1 "GND" H 8755 2077 50  0000 C CNN
F 2 "" H 8750 2250 50  0001 C CNN
F 3 "" H 8750 2250 50  0001 C CNN
	1    8750 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 1550 8300 1550
Text HLabel 7450 1550 0    50   Input ~ 0
Entrada0
Text HLabel 9500 3700 2    50   Output ~ 0
CPU_In1
Text HLabel 7100 3700 0    50   Input ~ 0
Entrada1
Text Notes 6600 1600 0    50   ~ 0
0 a 30V
Text Notes 6250 3700 0    50   ~ 0
0 a 30V
Text HLabel 1300 6650 0    50   Input ~ 0
CPU_ModPower
$Comp
L Transistor_FET:2N7002 Q?
U 1 1 5EFA125B
P 2150 6650
AR Path="/5ED20EE2/5EFA125B" Ref="Q?"  Part="1" 
AR Path="/5EE6B2B0/5EFA125B" Ref="Q701"  Part="1" 
F 0 "Q701" H 2356 6696 50  0000 L CNN
F 1 "2N7002" H 2356 6605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2350 6575 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 2150 6650 50  0001 L CNN
	1    2150 6650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EFA1262
P 1700 6650
AR Path="/5EC7150D/5EFA1262" Ref="R?"  Part="1" 
AR Path="/5ED20EE2/5EFA1262" Ref="R?"  Part="1" 
AR Path="/5EE6B2B0/5EFA1262" Ref="R701"  Part="1" 
F 0 "R701" V 1800 6600 50  0000 L CNN
F 1 "10k" V 1600 6600 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1630 6650 50  0001 C CNN
F 3 "~" H 1700 6650 50  0001 C CNN
	1    1700 6650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1300 6650 1550 6650
$Comp
L Device:R R?
U 1 1 5EFA1269
P 1900 7000
AR Path="/5EC7150D/5EFA1269" Ref="R?"  Part="1" 
AR Path="/5ED20EE2/5EFA1269" Ref="R?"  Part="1" 
AR Path="/5EE6B2B0/5EFA1269" Ref="R702"  Part="1" 
F 0 "R702" V 2000 6950 50  0000 L CNN
F 1 "330 k" V 1800 6950 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1830 7000 50  0001 C CNN
F 3 "~" H 1900 7000 50  0001 C CNN
	1    1900 7000
	-1   0    0    1   
$EndComp
Wire Wire Line
	1900 6850 1900 6650
$Comp
L power:GND #PWR0701
U 1 1 5EFA1270
P 1900 7300
F 0 "#PWR0701" H 1900 7050 50  0001 C CNN
F 1 "GND" H 1905 7127 50  0000 C CNN
F 2 "" H 1900 7300 50  0001 C CNN
F 3 "" H 1900 7300 50  0001 C CNN
	1    1900 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0702
U 1 1 5EFA1276
P 2250 7050
F 0 "#PWR0702" H 2250 6800 50  0001 C CNN
F 1 "GND" H 2255 6877 50  0000 C CNN
F 2 "" H 2250 7050 50  0001 C CNN
F 3 "" H 2250 7050 50  0001 C CNN
	1    2250 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 6650 1900 6650
Connection ~ 1900 6650
Wire Wire Line
	1900 6650 1950 6650
Wire Wire Line
	2250 6850 2250 7050
Wire Wire Line
	1900 7150 1900 7300
$Comp
L Relay:RT42xxxx K701
U 1 1 5EFA37ED
P 3250 6000
F 0 "K701" H 3880 6046 50  0000 L CNN
F 1 "RT42xxxx" H 3880 5955 50  0000 L CNN
F 2 "Relay_THT:Relay_DPDT_Schrack-RT2-FormC_RM5mm" H 3250 6000 50  0001 C CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Data+Sheet%7FRT2%7F1014%7Fpdf%7FEnglish%7FENG_DS_RT2_1014.pdf%7F6-1393243-3" H 3250 6000 50  0001 C CNN
	1    3250 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 6300 2850 6350
$Comp
L power:+12V #PWR0706
U 1 1 5EFBB61E
P 2850 5550
F 0 "#PWR0706" H 2850 5400 50  0001 C CNN
F 1 "+12V" H 2865 5723 50  0000 C CNN
F 2 "" H 2850 5550 50  0001 C CNN
F 3 "" H 2850 5550 50  0001 C CNN
	1    2850 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 5550 2850 5650
$Comp
L Diode:1N4007 D701
U 1 1 5EFBF1BF
P 2250 6000
F 0 "D701" V 2204 6079 50  0000 L CNN
F 1 "1N4007" V 2295 6079 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 2250 5825 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 2250 6000 50  0001 C CNN
	1    2250 6000
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 5850 2250 5650
Wire Wire Line
	2250 5650 2850 5650
Connection ~ 2850 5650
Wire Wire Line
	2850 5650 2850 5700
Wire Wire Line
	2250 6150 2250 6350
Wire Wire Line
	2250 6350 2850 6350
Wire Wire Line
	2250 6350 2250 6450
Connection ~ 2250 6350
$Comp
L Diode:1N4007 D702
U 1 1 5EFCDFEB
P 2850 6800
F 0 "D702" V 2850 6600 50  0000 L CNN
F 1 "1N4007" V 2950 6450 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 2850 6625 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 2850 6800 50  0001 C CNN
	1    2850 6800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0707
U 1 1 5EFD039F
P 2850 7000
F 0 "#PWR0707" H 2850 6750 50  0001 C CNN
F 1 "GND" H 2855 6827 50  0000 C CNN
F 2 "" H 2850 7000 50  0001 C CNN
F 3 "" H 2850 7000 50  0001 C CNN
	1    2850 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 6350 2850 6650
Connection ~ 2850 6350
Wire Wire Line
	2850 6950 2850 7000
Wire Wire Line
	4450 5100 3350 5100
Wire Wire Line
	3350 5100 3350 5700
Wire Wire Line
	3750 5700 3750 5500
Wire Wire Line
	3750 5500 4450 5500
Text HLabel 4450 6900 2    50   Output ~ 0
L_220V_Out
Text HLabel 4450 6500 2    50   Output ~ 0
N_220V_Out
Wire Wire Line
	4450 6500 3650 6500
Wire Wire Line
	3650 6500 3650 6300
Wire Wire Line
	3250 6300 3250 6900
Wire Wire Line
	3250 6900 4450 6900
Text GLabel 4450 5100 2    50   Input ~ 0
L_220VAC
Text GLabel 4450 5500 2    50   Input ~ 0
N_220VAC
$Comp
L Device:R R?
U 1 1 5ED0395F
P 8300 1900
AR Path="/5EC7150D/5ED0395F" Ref="R?"  Part="1" 
AR Path="/5EE6B2B0/5ED0395F" Ref="R714"  Part="1" 
F 0 "R714" V 8093 1900 50  0000 C CNN
F 1 "1M" V 8184 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8230 1900 50  0001 C CNN
F 3 "~" H 8300 1900 50  0001 C CNN
	1    8300 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 1750 8300 1550
Connection ~ 8300 1550
Wire Wire Line
	8300 1550 8750 1550
$Comp
L Device:R R?
U 1 1 5ED0711C
P 9350 1550
AR Path="/5EC7150D/5ED0711C" Ref="R?"  Part="1" 
AR Path="/5EE6B2B0/5ED0711C" Ref="R717"  Part="1" 
F 0 "R717" V 9450 1550 50  0000 C CNN
F 1 "470" V 9234 1550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9280 1550 50  0001 C CNN
F 3 "~" H 9350 1550 50  0001 C CNN
	1    9350 1550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9200 1550 9050 1550
Wire Wire Line
	9500 1550 9850 1550
$Comp
L power:GND #PWR0713
U 1 1 5ED12C38
P 8300 2150
F 0 "#PWR0713" H 8300 1900 50  0001 C CNN
F 1 "GND" H 8305 1977 50  0000 C CNN
F 2 "" H 8300 2150 50  0001 C CNN
F 3 "" H 8300 2150 50  0001 C CNN
	1    8300 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 2050 8300 2150
$Comp
L Device:R R?
U 1 1 5ED25A04
P 7550 3700
AR Path="/5EC7150D/5ED25A04" Ref="R?"  Part="1" 
AR Path="/5EE6B2B0/5ED25A04" Ref="R709"  Part="1" 
F 0 "R709" V 7343 3700 50  0000 C CNN
F 1 "10k" V 7434 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7480 3700 50  0001 C CNN
F 3 "~" H 7550 3700 50  0001 C CNN
	1    7550 3700
	0    1    1    0   
$EndComp
$Comp
L pspice:C C?
U 1 1 5ED25A0A
P 8400 4050
AR Path="/5EC7150D/5ED25A0A" Ref="C?"  Part="1" 
AR Path="/5EE6B2B0/5ED25A0A" Ref="C701"  Part="1" 
F 0 "C701" H 8100 4150 50  0000 L CNN
F 1 "1nF" H 8100 4050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8400 4050 50  0001 C CNN
F 3 "~" H 8400 4050 50  0001 C CNN
	1    8400 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 4300 8400 4400
Wire Wire Line
	8400 3800 8400 3700
Wire Wire Line
	7100 3700 7400 3700
Wire Wire Line
	8400 3700 8700 3700
Connection ~ 8700 3700
Wire Wire Line
	8700 3700 8700 3800
Wire Wire Line
	8700 4100 8700 4200
$Comp
L Diode:1N4148W D704
U 1 1 5ED25A17
P 8700 3950
F 0 "D704" V 8654 4030 50  0000 L CNN
F 1 "1N4148W" V 8745 4030 50  0000 L CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" H 8700 3775 50  0001 C CNN
F 3 "https://www.vishay.com/docs/85748/1n4148w.pdf" H 8700 3950 50  0001 C CNN
	1    8700 3950
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4148W D703
U 1 1 5ED25A1D
P 8700 3450
F 0 "D703" V 8654 3530 50  0000 L CNN
F 1 "1N4148W" V 8745 3530 50  0000 L CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" H 8700 3275 50  0001 C CNN
F 3 "https://www.vishay.com/docs/85748/1n4148w.pdf" H 8700 3450 50  0001 C CNN
	1    8700 3450
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0716
U 1 1 5ED25A23
P 8700 3200
F 0 "#PWR0716" H 8700 3050 50  0001 C CNN
F 1 "+3.3V" H 8715 3373 50  0000 C CNN
F 2 "" H 8700 3200 50  0001 C CNN
F 3 "" H 8700 3200 50  0001 C CNN
	1    8700 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 3200 8700 3300
Wire Wire Line
	8700 3600 8700 3700
Connection ~ 8400 3700
$Comp
L power:GND #PWR0717
U 1 1 5ED25A2C
P 8700 4200
F 0 "#PWR0717" H 8700 3950 50  0001 C CNN
F 1 "GND" H 8705 4027 50  0000 C CNN
F 2 "" H 8700 4200 50  0001 C CNN
F 3 "" H 8700 4200 50  0001 C CNN
	1    8700 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0714
U 1 1 5ED25A32
P 8400 4400
F 0 "#PWR0714" H 8400 4150 50  0001 C CNN
F 1 "GND" H 8405 4227 50  0000 C CNN
F 2 "" H 8400 4400 50  0001 C CNN
F 3 "" H 8400 4400 50  0001 C CNN
	1    8400 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 3700 7950 3700
$Comp
L Device:R R?
U 1 1 5ED25A39
P 7950 4050
AR Path="/5EC7150D/5ED25A39" Ref="R?"  Part="1" 
AR Path="/5EE6B2B0/5ED25A39" Ref="R712"  Part="1" 
F 0 "R712" V 7743 4050 50  0000 C CNN
F 1 "1M" V 7834 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7880 4050 50  0001 C CNN
F 3 "~" H 7950 4050 50  0001 C CNN
	1    7950 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 3900 7950 3700
Connection ~ 7950 3700
Wire Wire Line
	7950 3700 8400 3700
$Comp
L Device:R R?
U 1 1 5ED25A42
P 9000 3700
AR Path="/5EC7150D/5ED25A42" Ref="R?"  Part="1" 
AR Path="/5EE6B2B0/5ED25A42" Ref="R715"  Part="1" 
F 0 "R715" V 9100 3700 50  0000 C CNN
F 1 "470" V 8884 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8930 3700 50  0001 C CNN
F 3 "~" H 9000 3700 50  0001 C CNN
	1    9000 3700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8850 3700 8700 3700
Wire Wire Line
	9150 3700 9500 3700
$Comp
L power:GND #PWR0711
U 1 1 5ED25A4A
P 7950 4300
F 0 "#PWR0711" H 7950 4050 50  0001 C CNN
F 1 "GND" H 7955 4127 50  0000 C CNN
F 2 "" H 7950 4300 50  0001 C CNN
F 3 "" H 7950 4300 50  0001 C CNN
	1    7950 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 4200 7950 4300
Text HLabel 9500 5400 2    50   Output ~ 0
CPU_In2
Text HLabel 7100 5400 0    50   Input ~ 0
Entrada2
Text Notes 6250 5400 0    50   ~ 0
0 a 30V
$Comp
L Device:R R?
U 1 1 5ED2EF99
P 7550 5400
AR Path="/5EC7150D/5ED2EF99" Ref="R?"  Part="1" 
AR Path="/5EE6B2B0/5ED2EF99" Ref="R710"  Part="1" 
F 0 "R710" V 7343 5400 50  0000 C CNN
F 1 "10k" V 7434 5400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7480 5400 50  0001 C CNN
F 3 "~" H 7550 5400 50  0001 C CNN
	1    7550 5400
	0    1    1    0   
$EndComp
$Comp
L pspice:C C?
U 1 1 5ED2EF9F
P 8400 5750
AR Path="/5EC7150D/5ED2EF9F" Ref="C?"  Part="1" 
AR Path="/5EE6B2B0/5ED2EF9F" Ref="C702"  Part="1" 
F 0 "C702" H 8100 5850 50  0000 L CNN
F 1 "1nF" H 8100 5750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8400 5750 50  0001 C CNN
F 3 "~" H 8400 5750 50  0001 C CNN
	1    8400 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 6000 8400 6100
Wire Wire Line
	8400 5500 8400 5400
Wire Wire Line
	7100 5400 7400 5400
Wire Wire Line
	8400 5400 8700 5400
Connection ~ 8700 5400
Wire Wire Line
	8700 5400 8700 5500
Wire Wire Line
	8700 5800 8700 5900
$Comp
L Diode:1N4148W D706
U 1 1 5ED2EFAC
P 8700 5650
F 0 "D706" V 8654 5730 50  0000 L CNN
F 1 "1N4148W" V 8745 5730 50  0000 L CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" H 8700 5475 50  0001 C CNN
F 3 "https://www.vishay.com/docs/85748/1n4148w.pdf" H 8700 5650 50  0001 C CNN
	1    8700 5650
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4148W D705
U 1 1 5ED2EFB2
P 8700 5150
F 0 "D705" V 8654 5230 50  0000 L CNN
F 1 "1N4148W" V 8745 5230 50  0000 L CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" H 8700 4975 50  0001 C CNN
F 3 "https://www.vishay.com/docs/85748/1n4148w.pdf" H 8700 5150 50  0001 C CNN
	1    8700 5150
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0718
U 1 1 5ED2EFB8
P 8700 4900
F 0 "#PWR0718" H 8700 4750 50  0001 C CNN
F 1 "+3.3V" H 8715 5073 50  0000 C CNN
F 2 "" H 8700 4900 50  0001 C CNN
F 3 "" H 8700 4900 50  0001 C CNN
	1    8700 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 4900 8700 5000
Wire Wire Line
	8700 5300 8700 5400
Connection ~ 8400 5400
$Comp
L power:GND #PWR0719
U 1 1 5ED2EFC1
P 8700 5900
F 0 "#PWR0719" H 8700 5650 50  0001 C CNN
F 1 "GND" H 8705 5727 50  0000 C CNN
F 2 "" H 8700 5900 50  0001 C CNN
F 3 "" H 8700 5900 50  0001 C CNN
	1    8700 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0715
U 1 1 5ED2EFC7
P 8400 6100
F 0 "#PWR0715" H 8400 5850 50  0001 C CNN
F 1 "GND" H 8405 5927 50  0000 C CNN
F 2 "" H 8400 6100 50  0001 C CNN
F 3 "" H 8400 6100 50  0001 C CNN
	1    8400 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 5400 7950 5400
$Comp
L Device:R R?
U 1 1 5ED2EFCE
P 7950 5750
AR Path="/5EC7150D/5ED2EFCE" Ref="R?"  Part="1" 
AR Path="/5EE6B2B0/5ED2EFCE" Ref="R713"  Part="1" 
F 0 "R713" V 7743 5750 50  0000 C CNN
F 1 "1M" V 7834 5750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7880 5750 50  0001 C CNN
F 3 "~" H 7950 5750 50  0001 C CNN
	1    7950 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 5600 7950 5400
Connection ~ 7950 5400
Wire Wire Line
	7950 5400 8400 5400
$Comp
L Device:R R?
U 1 1 5ED2EFD7
P 9000 5400
AR Path="/5EC7150D/5ED2EFD7" Ref="R?"  Part="1" 
AR Path="/5EE6B2B0/5ED2EFD7" Ref="R716"  Part="1" 
F 0 "R716" V 9100 5400 50  0000 C CNN
F 1 "470" V 8884 5400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8930 5400 50  0001 C CNN
F 3 "~" H 9000 5400 50  0001 C CNN
	1    9000 5400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8850 5400 8700 5400
Wire Wire Line
	9150 5400 9500 5400
$Comp
L power:GND #PWR0712
U 1 1 5ED2EFDF
P 7950 6000
F 0 "#PWR0712" H 7950 5750 50  0001 C CNN
F 1 "GND" H 7955 5827 50  0000 C CNN
F 2 "" H 7950 6000 50  0001 C CNN
F 3 "" H 7950 6000 50  0001 C CNN
	1    7950 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 5900 7950 6000
$EndSCHEMATC
