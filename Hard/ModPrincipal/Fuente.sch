EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 8
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
L Connector_Generic:Conn_01x03 J501
U 1 1 5ECEE55D
P 2100 1600
F 0 "J501" H 2018 1275 50  0000 C CNN
F 1 "Conn_01x03" H 2018 1366 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-3_P5.08mm" H 2100 1600 50  0001 C CNN
F 3 "~" H 2100 1600 50  0001 C CNN
	1    2100 1600
	-1   0    0    1   
$EndComp
$Comp
L power:GNDPWR #PWR0501
U 1 1 5ECF1BF0
P 3000 1800
F 0 "#PWR0501" H 3000 1600 50  0001 C CNN
F 1 "GNDPWR" H 3004 1646 50  0000 C CNN
F 2 "" H 3000 1750 50  0001 C CNN
F 3 "" H 3000 1750 50  0001 C CNN
	1    3000 1800
	1    0    0    -1  
$EndComp
Text Notes 1250 1550 0    50   ~ 0
Entrada 220V
Text GLabel 2650 1600 2    50   Input ~ 0
N_220VAC
Text GLabel 2650 1500 2    50   Input ~ 0
L_220VAC
$Comp
L Connector_Generic:Conn_01x02 J503
U 1 1 5ED063FA
P 6450 1850
F 0 "J503" V 6530 1842 50  0000 L CNN
F 1 "Conn_01x02" H 6530 1751 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 6450 1850 50  0001 C CNN
F 3 "~" H 6450 1850 50  0001 C CNN
	1    6450 1850
	-1   0    0    -1  
$EndComp
$Comp
L Diode_Bridge:MB6S D501
U 1 1 5ED08CA7
P 7750 1950
F 0 "D501" H 7950 2200 50  0000 L CNN
F 1 "MB6S" H 7950 2100 50  0000 L CNN
F 2 "Package_SO:SO-4_4.4x4.3mm_P2.54mm" H 7900 2075 50  0001 L CNN
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
L power:GND #PWR0505
U 1 1 5ED0A18A
P 7300 2050
F 0 "#PWR0505" H 7300 1800 50  0001 C CNN
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
L Device:CP C503
U 1 1 5ED0B602
P 8350 2150
F 0 "C503" H 8468 2196 50  0000 L CNN
F 1 "470uF" H 8468 2105 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 8388 2000 50  0001 C CNN
F 3 "~" H 8350 2150 50  0001 C CNN
	1    8350 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 2000 8350 1950
Wire Wire Line
	8350 1950 8050 1950
$Comp
L pspice:CAP C505
U 1 1 5ED0C9C8
P 8850 2250
F 0 "C505" H 9028 2296 50  0000 L CNN
F 1 "100nF" H 9028 2205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8850 2250 50  0001 C CNN
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
L power:GND #PWR0508
U 1 1 5ED0D780
P 8350 2350
F 0 "#PWR0508" H 8350 2100 50  0001 C CNN
F 1 "GND" H 8355 2177 50  0000 C CNN
F 2 "" H 8350 2350 50  0001 C CNN
F 3 "" H 8350 2350 50  0001 C CNN
	1    8350 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0511
U 1 1 5ED0DBD6
P 8850 2550
F 0 "#PWR0511" H 8850 2300 50  0001 C CNN
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
L Regulator_Linear:L7812 U503
U 1 1 5ED0EA11
P 9500 1950
F 0 "U503" H 9500 2192 50  0000 C CNN
F 1 "L7812" H 9500 2101 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 9525 1800 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 9500 1900 50  0001 C CNN
	1    9500 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0513
U 1 1 5ED10BED
P 9500 2300
F 0 "#PWR0513" H 9500 2050 50  0001 C CNN
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
L power:+12V #PWR0516
U 1 1 5ED1441D
P 10050 1800
F 0 "#PWR0516" H 10050 1650 50  0001 C CNN
F 1 "+12V" H 10065 1973 50  0000 C CNN
F 2 "" H 10050 1800 50  0001 C CNN
F 3 "" H 10050 1800 50  0001 C CNN
	1    10050 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 1800 10050 1950
Connection ~ 10050 1950
Wire Wire Line
	6650 1950 6800 1950
Wire Wire Line
	6650 1850 6800 1850
$Comp
L Regulator_Linear:AMS1117-5.0 U501
U 1 1 5ED256C3
P 7050 3350
F 0 "U501" H 7050 3592 50  0000 C CNN
F 1 "AMS1117-5.0" H 7050 3501 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 7050 3550 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 7150 3100 50  0001 C CNN
	1    7050 3350
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AMS1117-3.3 U502
U 1 1 5ED261D9
P 9300 3350
F 0 "U502" H 9300 3592 50  0000 C CNN
F 1 "AMS1117-3.3" H 9300 3501 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 9300 3550 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 9400 3100 50  0001 C CNN
	1    9300 3350
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0514
U 1 1 5ED2F462
P 9950 3200
F 0 "#PWR0514" H 9950 3050 50  0001 C CNN
F 1 "+3.3V" H 9965 3373 50  0000 C CNN
F 2 "" H 9950 3200 50  0001 C CNN
F 3 "" H 9950 3200 50  0001 C CNN
	1    9950 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0506
U 1 1 5ED3013B
P 7550 3200
F 0 "#PWR0506" H 7550 3050 50  0001 C CNN
F 1 "+5V" H 7565 3373 50  0000 C CNN
F 2 "" H 7550 3200 50  0001 C CNN
F 3 "" H 7550 3200 50  0001 C CNN
	1    7550 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0509
U 1 1 5ED32FBF
P 8700 3250
F 0 "#PWR0509" H 8700 3100 50  0001 C CNN
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
L power:+12V #PWR0502
U 1 1 5ED359EE
P 6550 3200
F 0 "#PWR0502" H 6550 3050 50  0001 C CNN
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
L Device:CP C502
U 1 1 5ED3722B
P 7550 3600
F 0 "C502" H 7668 3646 50  0000 L CNN
F 1 "10uF" H 7668 3555 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 7588 3450 50  0001 C CNN
F 3 "~" H 7550 3600 50  0001 C CNN
	1    7550 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0507
U 1 1 5ED3F66D
P 7550 3850
F 0 "#PWR0507" H 7550 3600 50  0001 C CNN
F 1 "GND" H 7555 3677 50  0000 C CNN
F 2 "" H 7550 3850 50  0001 C CNN
F 3 "" H 7550 3850 50  0001 C CNN
	1    7550 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0504
U 1 1 5ED40018
P 7050 3750
F 0 "#PWR0504" H 7050 3500 50  0001 C CNN
F 1 "GND" H 7055 3577 50  0000 C CNN
F 2 "" H 7050 3750 50  0001 C CNN
F 3 "" H 7050 3750 50  0001 C CNN
	1    7050 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0512
U 1 1 5ED40BE0
P 9300 3750
F 0 "#PWR0512" H 9300 3500 50  0001 C CNN
F 1 "GND" H 9305 3577 50  0000 C CNN
F 2 "" H 9300 3750 50  0001 C CNN
F 3 "" H 9300 3750 50  0001 C CNN
	1    9300 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 3750 7550 3850
$Comp
L Device:CP C506
U 1 1 5ED472EB
P 9950 3600
F 0 "C506" H 10068 3646 50  0000 L CNN
F 1 "10uF" H 10068 3555 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 9988 3450 50  0001 C CNN
F 3 "~" H 9950 3600 50  0001 C CNN
	1    9950 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0515
U 1 1 5ED472F1
P 9950 3850
F 0 "#PWR0515" H 9950 3600 50  0001 C CNN
F 1 "GND" H 9955 3677 50  0000 C CNN
F 2 "" H 9950 3850 50  0001 C CNN
F 3 "" H 9950 3850 50  0001 C CNN
	1    9950 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 3750 9950 3850
$Comp
L Device:CP C501
U 1 1 5ED48342
P 6550 3600
F 0 "C501" H 6668 3646 50  0000 L CNN
F 1 "10uF" H 6668 3555 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6588 3450 50  0001 C CNN
F 3 "~" H 6550 3600 50  0001 C CNN
	1    6550 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0503
U 1 1 5ED48348
P 6550 3850
F 0 "#PWR0503" H 6550 3600 50  0001 C CNN
F 1 "GND" H 6555 3677 50  0000 C CNN
F 2 "" H 6550 3850 50  0001 C CNN
F 3 "" H 6550 3850 50  0001 C CNN
	1    6550 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3750 6550 3850
$Comp
L Device:CP C504
U 1 1 5ED49149
P 8700 3600
F 0 "C504" H 8818 3646 50  0000 L CNN
F 1 "10uF" H 8818 3555 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 8738 3450 50  0001 C CNN
F 3 "~" H 8700 3600 50  0001 C CNN
	1    8700 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0510
U 1 1 5ED4914F
P 8700 3850
F 0 "#PWR0510" H 8700 3600 50  0001 C CNN
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
L Device:CP C507
U 1 1 5ED5314E
P 10050 2150
F 0 "C507" H 10168 2196 50  0000 L CNN
F 1 "10uF" H 10168 2105 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 10088 2000 50  0001 C CNN
F 3 "~" H 10050 2150 50  0001 C CNN
	1    10050 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0517
U 1 1 5ED53154
P 10050 2400
F 0 "#PWR0517" H 10050 2150 50  0001 C CNN
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
L power:PWR_FLAG #FLG0501
U 1 1 5ED5C59D
P 6800 1800
F 0 "#FLG0501" H 6800 1875 50  0001 C CNN
F 1 "PWR_FLAG" H 6800 1973 50  0000 C CNN
F 2 "" H 6800 1800 50  0001 C CNN
F 3 "~" H 6800 1800 50  0001 C CNN
	1    6800 1800
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0502
U 1 1 5ED5D756
P 6800 2000
F 0 "#FLG0502" H 6800 2075 50  0001 C CNN
F 1 "PWR_FLAG" H 6800 2173 50  0000 C CNN
F 2 "" H 6800 2000 50  0001 C CNN
F 3 "~" H 6800 2000 50  0001 C CNN
	1    6800 2000
	-1   0    0    1   
$EndComp
Wire Wire Line
	9800 1950 10050 1950
$Comp
L Connector:TestPoint TP?
U 1 1 5ED5CD82
P 8050 3300
AR Path="/5ECD8445/5ED5CD82" Ref="TP?"  Part="1" 
AR Path="/5ECEE31C/5ED5CD82" Ref="TP501"  Part="1" 
F 0 "TP501" H 8108 3418 50  0000 L CNN
F 1 "TestPoint" H 8108 3327 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 8250 3300 50  0001 C CNN
F 3 "~" H 8250 3300 50  0001 C CNN
	1    8050 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 3300 8050 3350
$Comp
L Connector:TestPoint TP?
U 1 1 5ED5F6CB
P 10550 3300
AR Path="/5ECD8445/5ED5F6CB" Ref="TP?"  Part="1" 
AR Path="/5ECEE31C/5ED5F6CB" Ref="TP502"  Part="1" 
F 0 "TP502" H 10608 3418 50  0000 L CNN
F 1 "TestPoint" H 10608 3327 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 10750 3300 50  0001 C CNN
F 3 "~" H 10750 3300 50  0001 C CNN
	1    10550 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 3300 10550 3350
$Comp
L Connector:TestPoint TP?
U 1 1 5ED62802
P 10750 1900
AR Path="/5ECD8445/5ED62802" Ref="TP?"  Part="1" 
AR Path="/5ECEE31C/5ED62802" Ref="TP503"  Part="1" 
F 0 "TP503" H 10808 2018 50  0000 L CNN
F 1 "TestPoint" H 10808 1927 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 10950 1900 50  0001 C CNN
F 3 "~" H 10950 1900 50  0001 C CNN
	1    10750 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10750 1900 10750 1950
Wire Wire Line
	2650 1500 2300 1500
Wire Wire Line
	2300 1600 2650 1600
$Comp
L power:GND #PWR0519
U 1 1 5ED9A8D6
P 2650 4100
F 0 "#PWR0519" H 2650 3850 50  0001 C CNN
F 1 "GND" H 2655 3927 50  0000 C CNN
F 2 "" H 2650 4100 50  0001 C CNN
F 3 "" H 2650 4100 50  0001 C CNN
	1    2650 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0520
U 1 1 5ED9BC84
P 3300 4100
F 0 "#PWR0520" H 3300 3850 50  0001 C CNN
F 1 "GNDA" H 3305 3927 50  0000 C CNN
F 2 "" H 3300 4100 50  0001 C CNN
F 3 "" H 3300 4100 50  0001 C CNN
	1    3300 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EDA0CDB
P 3000 3950
AR Path="/5EC7150D/5EDA0CDB" Ref="R?"  Part="1" 
AR Path="/5ECEE31C/5EDA0CDB" Ref="R503"  Part="1" 
F 0 "R503" V 2793 3950 50  0000 C CNN
F 1 "1" V 2884 3950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2930 3950 50  0001 C CNN
F 3 "~" H 3000 3950 50  0001 C CNN
	1    3000 3950
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EDA1B94
P 3000 3650
AR Path="/5EC7150D/5EDA1B94" Ref="R?"  Part="1" 
AR Path="/5ECEE31C/5EDA1B94" Ref="R502"  Part="1" 
F 0 "R502" V 2793 3650 50  0000 C CNN
F 1 "1" V 2884 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2930 3650 50  0001 C CNN
F 3 "~" H 3000 3650 50  0001 C CNN
	1    3000 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EDA2B29
P 3000 3350
AR Path="/5EC7150D/5EDA2B29" Ref="R?"  Part="1" 
AR Path="/5ECEE31C/5EDA2B29" Ref="R501"  Part="1" 
F 0 "R501" V 2793 3350 50  0000 C CNN
F 1 "1" V 2884 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2930 3350 50  0001 C CNN
F 3 "~" H 3000 3350 50  0001 C CNN
	1    3000 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	3150 3350 3300 3350
Wire Wire Line
	3300 3350 3300 3650
Wire Wire Line
	3150 3650 3300 3650
Connection ~ 3300 3650
Wire Wire Line
	3300 3650 3300 3950
Wire Wire Line
	3150 3950 3300 3950
Connection ~ 3300 3950
Wire Wire Line
	3300 3950 3300 4100
Wire Wire Line
	2850 3350 2650 3350
Wire Wire Line
	2650 3350 2650 3650
Wire Wire Line
	2850 3650 2650 3650
Connection ~ 2650 3650
Wire Wire Line
	2650 3650 2650 3950
Wire Wire Line
	2850 3950 2650 3950
Connection ~ 2650 3950
Wire Wire Line
	2650 3950 2650 4100
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5EDE0C13
P 3300 3000
F 0 "#FLG0102" H 3300 3075 50  0001 C CNN
F 1 "PWR_FLAG" H 3300 3173 50  0000 C CNN
F 2 "" H 3300 3000 50  0001 C CNN
F 3 "~" H 3300 3000 50  0001 C CNN
	1    3300 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 3000 3300 3350
Connection ~ 3300 3350
Wire Wire Line
	9950 3350 10550 3350
Wire Wire Line
	7550 3350 8050 3350
Wire Wire Line
	6800 1800 6800 1850
Connection ~ 6800 1850
Wire Wire Line
	6800 1850 7050 1850
Wire Wire Line
	6800 2000 6800 1950
Connection ~ 6800 1950
Wire Wire Line
	6800 1950 7050 1950
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5EE6B5F7
P 8850 1900
F 0 "#FLG0101" H 8850 1975 50  0001 C CNN
F 1 "PWR_FLAG" H 8850 2073 50  0000 C CNN
F 2 "" H 8850 1900 50  0001 C CNN
F 3 "~" H 8850 1900 50  0001 C CNN
	1    8850 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 1900 8850 1950
Wire Wire Line
	2300 1700 2450 1700
Wire Wire Line
	3000 1700 3000 1800
$Comp
L power:PWR_FLAG #FLG0106
U 1 1 5EE866A9
P 2450 1800
F 0 "#FLG0106" H 2450 1875 50  0001 C CNN
F 1 "PWR_FLAG" H 2450 1973 50  0000 C CNN
F 2 "" H 2450 1800 50  0001 C CNN
F 3 "~" H 2450 1800 50  0001 C CNN
	1    2450 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	2450 1800 2450 1700
Connection ~ 2450 1700
Wire Wire Line
	2450 1700 3000 1700
Wire Wire Line
	10050 1950 10750 1950
$EndSCHEMATC
