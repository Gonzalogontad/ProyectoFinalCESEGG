EESchema Schematic File Version 4
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
L Connector_Generic:Conn_01x03 J?
U 1 1 5ECEE55D
P 2100 1600
F 0 "J?" H 2018 1275 50  0000 C CNN
F 1 "Conn_01x03" H 2018 1366 50  0000 C CNN
F 2 "" H 2100 1600 50  0001 C CNN
F 3 "~" H 2100 1600 50  0001 C CNN
	1    2100 1600
	-1   0    0    1   
$EndComp
$Comp
L Device:Fuse F?
U 1 1 5ECEED3D
P 2750 1500
F 0 "F?" V 2553 1500 50  0000 C CNN
F 1 "Fuse" V 2644 1500 50  0000 C CNN
F 2 "" V 2680 1500 50  0001 C CNN
F 3 "~" H 2750 1500 50  0001 C CNN
	1    2750 1500
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5ECEF6C7
P 3550 1500
F 0 "J?" H 3630 1492 50  0000 L CNN
F 1 "Conn_01x02" H 3630 1401 50  0000 L CNN
F 2 "" H 3550 1500 50  0001 C CNN
F 3 "~" H 3550 1500 50  0001 C CNN
	1    3550 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1500 2600 1500
Wire Wire Line
	3350 1500 3050 1500
Wire Wire Line
	3350 1600 3050 1600
$Comp
L power:GNDPWR #PWR?
U 1 1 5ECF1BF0
P 2400 1800
F 0 "#PWR?" H 2400 1600 50  0001 C CNN
F 1 "GNDPWR" H 2404 1646 50  0000 C CNN
F 2 "" H 2400 1750 50  0001 C CNN
F 3 "" H 2400 1750 50  0001 C CNN
	1    2400 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 1800 2400 1700
Wire Wire Line
	2400 1700 2300 1700
Text Notes 1250 1550 0    50   ~ 0
Entrada 220V
Text GLabel 3100 1800 2    50   Input ~ 0
N_220VAC
Wire Wire Line
	3100 1800 3050 1800
Wire Wire Line
	3050 1800 3050 1600
Connection ~ 3050 1600
Wire Wire Line
	3050 1600 2300 1600
Text GLabel 3100 1150 2    50   Input ~ 0
L_220VAC
Wire Wire Line
	3100 1150 3050 1150
Wire Wire Line
	3050 1150 3050 1500
Connection ~ 3050 1500
Wire Wire Line
	3050 1500 2900 1500
Text Notes 4100 1550 0    50   ~ 0
Salida 220v al transformador
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5ED063FA
P 6450 1950
F 0 "J?" V 6530 1942 50  0000 L CNN
F 1 "Conn_01x02" H 6530 1851 50  0000 L CNN
F 2 "" H 6450 1950 50  0001 C CNN
F 3 "~" H 6450 1950 50  0001 C CNN
	1    6450 1950
	-1   0    0    1   
$EndComp
$Comp
L Diode_Bridge:MB6S D?
U 1 1 5ED08CA7
P 7750 1950
F 0 "D?" H 7950 2200 50  0000 L CNN
F 1 "MB6S" H 7950 2100 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-269AA" H 7900 2075 50  0001 L CNN
F 3 "http://www.vishay.com/docs/88573/dfs.pdf" H 7750 1950 50  0001 C CNN
	1    7750 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 1850 7050 1550
Wire Wire Line
	7050 1550 7750 1550
Wire Wire Line
	7750 1550 7750 1650
Wire Wire Line
	7050 1950 7050 2350
Wire Wire Line
	7050 2350 7750 2350
Wire Wire Line
	7750 2350 7750 2250
$Comp
L power:GND #PWR?
U 1 1 5ED0A18A
P 7300 2050
F 0 "#PWR?" H 7300 1800 50  0001 C CNN
F 1 "GND" H 7305 1877 50  0000 C CNN
F 2 "" H 7300 2050 50  0001 C CNN
F 3 "" H 7300 2050 50  0001 C CNN
	1    7300 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 2050 7300 1950
Wire Wire Line
	7300 1950 7450 1950
$Comp
L Device:CP C?
U 1 1 5ED0B602
P 8350 2150
F 0 "C?" H 8468 2196 50  0000 L CNN
F 1 "470uF" H 8468 2105 50  0000 L CNN
F 2 "" H 8388 2000 50  0001 C CNN
F 3 "~" H 8350 2150 50  0001 C CNN
	1    8350 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 2000 8350 1950
Wire Wire Line
	8350 1950 8050 1950
$Comp
L pspice:CAP C?
U 1 1 5ED0C9C8
P 8850 2250
F 0 "C?" H 9028 2296 50  0000 L CNN
F 1 "CAP" H 9028 2205 50  0000 L CNN
F 2 "" H 8850 2250 50  0001 C CNN
F 3 "~" H 8850 2250 50  0001 C CNN
	1    8850 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 2000 8850 1950
Wire Wire Line
	8850 1950 8350 1950
Connection ~ 8350 1950
$Comp
L power:GND #PWR?
U 1 1 5ED0D780
P 8350 2350
F 0 "#PWR?" H 8350 2100 50  0001 C CNN
F 1 "GND" H 8355 2177 50  0000 C CNN
F 2 "" H 8350 2350 50  0001 C CNN
F 3 "" H 8350 2350 50  0001 C CNN
	1    8350 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED0DBD6
P 8850 2550
F 0 "#PWR?" H 8850 2300 50  0001 C CNN
F 1 "GND" H 8855 2377 50  0000 C CNN
F 2 "" H 8850 2550 50  0001 C CNN
F 3 "" H 8850 2550 50  0001 C CNN
	1    8850 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 2500 8850 2550
Wire Wire Line
	8350 2300 8350 2350
$Comp
L Regulator_Linear:L7812 U?
U 1 1 5ED0EA11
P 9500 1950
F 0 "U?" H 9500 2192 50  0000 C CNN
F 1 "L7812" H 9500 2101 50  0000 C CNN
F 2 "" H 9525 1800 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 9500 1900 50  0001 C CNN
	1    9500 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED10BED
P 9500 2300
F 0 "#PWR?" H 9500 2050 50  0001 C CNN
F 1 "GND" H 9505 2127 50  0000 C CNN
F 2 "" H 9500 2300 50  0001 C CNN
F 3 "" H 9500 2300 50  0001 C CNN
	1    9500 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 2250 9500 2300
Wire Wire Line
	9200 1950 8850 1950
Connection ~ 8850 1950
Wire Wire Line
	10050 2000 10050 1950
$Comp
L power:+12V #PWR?
U 1 1 5ED1441D
P 10050 1800
F 0 "#PWR?" H 10050 1650 50  0001 C CNN
F 1 "+12V" H 10065 1973 50  0000 C CNN
F 2 "" H 10050 1800 50  0001 C CNN
F 3 "" H 10050 1800 50  0001 C CNN
	1    10050 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 1800 10050 1950
Connection ~ 10050 1950
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5ED17143
P 10500 1900
F 0 "#FLG?" H 10500 1975 50  0001 C CNN
F 1 "PWR_FLAG" H 10500 2073 50  0000 C CNN
F 2 "" H 10500 1900 50  0001 C CNN
F 3 "~" H 10500 1900 50  0001 C CNN
	1    10500 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 1950 7050 1950
Wire Wire Line
	6650 1850 7050 1850
$Comp
L Regulator_Linear:AMS1117-5.0 U?
U 1 1 5ED256C3
P 7050 3350
F 0 "U?" H 7050 3592 50  0000 C CNN
F 1 "AMS1117-5.0" H 7050 3501 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 7050 3550 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 7150 3100 50  0001 C CNN
	1    7050 3350
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AMS1117-3.3 U?
U 1 1 5ED261D9
P 9300 3350
F 0 "U?" H 9300 3592 50  0000 C CNN
F 1 "AMS1117-3.3" H 9300 3501 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 9300 3550 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 9400 3100 50  0001 C CNN
	1    9300 3350
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4007 D?
U 1 1 5ED28BF5
P 10500 2150
F 0 "D?" V 10454 2229 50  0000 L CNN
F 1 "1N4007" V 10545 2229 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 10500 1975 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 10500 2150 50  0001 C CNN
	1    10500 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	10500 2000 10500 1950
Wire Wire Line
	10500 1950 10050 1950
$Comp
L power:GND #PWR?
U 1 1 5ED2ABE3
P 10500 2350
F 0 "#PWR?" H 10500 2100 50  0001 C CNN
F 1 "GND" H 10505 2177 50  0000 C CNN
F 2 "" H 10500 2350 50  0001 C CNN
F 3 "" H 10500 2350 50  0001 C CNN
	1    10500 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 2300 10500 2350
$Comp
L power:+3.3V #PWR?
U 1 1 5ED2F462
P 9950 3200
F 0 "#PWR?" H 9950 3050 50  0001 C CNN
F 1 "+3.3V" H 9965 3373 50  0000 C CNN
F 2 "" H 9950 3200 50  0001 C CNN
F 3 "" H 9950 3200 50  0001 C CNN
	1    9950 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5ED3013B
P 7550 3200
F 0 "#PWR?" H 7550 3050 50  0001 C CNN
F 1 "+5V" H 7565 3373 50  0000 C CNN
F 2 "" H 7550 3200 50  0001 C CNN
F 3 "" H 7550 3200 50  0001 C CNN
	1    7550 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5ED32FBF
P 8700 3250
F 0 "#PWR?" H 8700 3100 50  0001 C CNN
F 1 "+5V" H 8715 3423 50  0000 C CNN
F 2 "" H 8700 3250 50  0001 C CNN
F 3 "" H 8700 3250 50  0001 C CNN
	1    8700 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 3250 8700 3350
Wire Wire Line
	8700 3350 9000 3350
Wire Wire Line
	9950 3350 9950 3200
Wire Wire Line
	7350 3350 7550 3350
Wire Wire Line
	7550 3350 7550 3200
$Comp
L power:+12V #PWR?
U 1 1 5ED359EE
P 6550 3200
F 0 "#PWR?" H 6550 3050 50  0001 C CNN
F 1 "+12V" H 6565 3373 50  0000 C CNN
F 2 "" H 6550 3200 50  0001 C CNN
F 3 "" H 6550 3200 50  0001 C CNN
	1    6550 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3200 6550 3350
Wire Wire Line
	6550 3350 6750 3350
$Comp
L Device:CP C?
U 1 1 5ED3722B
P 7550 3600
F 0 "C?" H 7668 3646 50  0000 L CNN
F 1 "10uF" H 7668 3555 50  0000 L CNN
F 2 "" H 7588 3450 50  0001 C CNN
F 3 "~" H 7550 3600 50  0001 C CNN
	1    7550 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED3F66D
P 7550 3850
F 0 "#PWR?" H 7550 3600 50  0001 C CNN
F 1 "GND" H 7555 3677 50  0000 C CNN
F 2 "" H 7550 3850 50  0001 C CNN
F 3 "" H 7550 3850 50  0001 C CNN
	1    7550 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED40018
P 7050 3750
F 0 "#PWR?" H 7050 3500 50  0001 C CNN
F 1 "GND" H 7055 3577 50  0000 C CNN
F 2 "" H 7050 3750 50  0001 C CNN
F 3 "" H 7050 3750 50  0001 C CNN
	1    7050 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED40BE0
P 9300 3750
F 0 "#PWR?" H 9300 3500 50  0001 C CNN
F 1 "GND" H 9305 3577 50  0000 C CNN
F 2 "" H 9300 3750 50  0001 C CNN
F 3 "" H 9300 3750 50  0001 C CNN
	1    9300 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 3750 7550 3850
$Comp
L Device:CP C?
U 1 1 5ED472EB
P 9950 3600
F 0 "C?" H 10068 3646 50  0000 L CNN
F 1 "10uF" H 10068 3555 50  0000 L CNN
F 2 "" H 9988 3450 50  0001 C CNN
F 3 "~" H 9950 3600 50  0001 C CNN
	1    9950 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED472F1
P 9950 3850
F 0 "#PWR?" H 9950 3600 50  0001 C CNN
F 1 "GND" H 9955 3677 50  0000 C CNN
F 2 "" H 9950 3850 50  0001 C CNN
F 3 "" H 9950 3850 50  0001 C CNN
	1    9950 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 3750 9950 3850
$Comp
L Device:CP C?
U 1 1 5ED48342
P 6550 3600
F 0 "C?" H 6668 3646 50  0000 L CNN
F 1 "10uF" H 6668 3555 50  0000 L CNN
F 2 "" H 6588 3450 50  0001 C CNN
F 3 "~" H 6550 3600 50  0001 C CNN
	1    6550 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED48348
P 6550 3850
F 0 "#PWR?" H 6550 3600 50  0001 C CNN
F 1 "GND" H 6555 3677 50  0000 C CNN
F 2 "" H 6550 3850 50  0001 C CNN
F 3 "" H 6550 3850 50  0001 C CNN
	1    6550 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3750 6550 3850
$Comp
L Device:CP C?
U 1 1 5ED49149
P 8700 3600
F 0 "C?" H 8818 3646 50  0000 L CNN
F 1 "10uF" H 8818 3555 50  0000 L CNN
F 2 "" H 8738 3450 50  0001 C CNN
F 3 "~" H 8700 3600 50  0001 C CNN
	1    8700 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED4914F
P 8700 3850
F 0 "#PWR?" H 8700 3600 50  0001 C CNN
F 1 "GND" H 8705 3677 50  0000 C CNN
F 2 "" H 8700 3850 50  0001 C CNN
F 3 "" H 8700 3850 50  0001 C CNN
	1    8700 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 3750 8700 3850
Wire Wire Line
	8700 3450 8700 3350
Connection ~ 8700 3350
Wire Wire Line
	9950 3450 9950 3350
Connection ~ 9950 3350
$Comp
L Device:CP C?
U 1 1 5ED5314E
P 10050 2150
F 0 "C?" H 10168 2196 50  0000 L CNN
F 1 "10uF" H 10168 2105 50  0000 L CNN
F 2 "" H 10088 2000 50  0001 C CNN
F 3 "~" H 10050 2150 50  0001 C CNN
	1    10050 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5ED53154
P 10050 2400
F 0 "#PWR?" H 10050 2150 50  0001 C CNN
F 1 "GND" H 10055 2227 50  0000 C CNN
F 2 "" H 10050 2400 50  0001 C CNN
F 3 "" H 10050 2400 50  0001 C CNN
	1    10050 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 2300 10050 2400
Wire Wire Line
	6550 3450 6550 3350
Connection ~ 6550 3350
Wire Wire Line
	7550 3450 7550 3350
Connection ~ 7550 3350
Wire Wire Line
	7050 3750 7050 3650
Wire Wire Line
	9300 3750 9300 3650
Wire Wire Line
	9600 3350 9950 3350
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5ED5C59D
P 6800 1800
F 0 "#FLG?" H 6800 1875 50  0001 C CNN
F 1 "PWR_FLAG" H 6800 1973 50  0000 C CNN
F 2 "" H 6800 1800 50  0001 C CNN
F 3 "~" H 6800 1800 50  0001 C CNN
	1    6800 1800
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5ED5D756
P 6800 2000
F 0 "#FLG?" H 6800 2075 50  0001 C CNN
F 1 "PWR_FLAG" H 6800 2173 50  0000 C CNN
F 2 "" H 6800 2000 50  0001 C CNN
F 3 "~" H 6800 2000 50  0001 C CNN
	1    6800 2000
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5ED5E7EB
P 7800 3300
F 0 "#FLG?" H 7800 3375 50  0001 C CNN
F 1 "PWR_FLAG" H 7800 3473 50  0000 C CNN
F 2 "" H 7800 3300 50  0001 C CNN
F 3 "~" H 7800 3300 50  0001 C CNN
	1    7800 3300
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5ED6715A
P 10250 3300
F 0 "#FLG?" H 10250 3375 50  0001 C CNN
F 1 "PWR_FLAG" H 10250 3473 50  0000 C CNN
F 2 "" H 10250 3300 50  0001 C CNN
F 3 "~" H 10250 3300 50  0001 C CNN
	1    10250 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 3300 10250 3350
Wire Wire Line
	10250 3350 9950 3350
Wire Wire Line
	7800 3300 7800 3350
Wire Wire Line
	7800 3350 7550 3350
Wire Wire Line
	10500 1900 10500 1950
Connection ~ 10500 1950
Wire Wire Line
	9800 1950 10050 1950
$EndSCHEMATC
