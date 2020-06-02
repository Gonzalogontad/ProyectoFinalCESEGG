EESchema Schematic File Version 4
LIBS:ModPrincipal-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 8
Title "Probado - Modulo Principal"
Date "2020-05-31"
Rev "1.0"
Comp "CESE - FIUBA"
Comment1 "Gonzalo Gontad"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 6400 900  2150 1050
U 5EC7150D
F0 "AnalogInputs" 118
F1 "AnalogInputs.sch" 118
F2 "Analog0" I R 8550 1150 50 
F3 "Analog1" I R 8550 1550 50 
F4 "ADC0" O L 6400 1150 50 
F5 "ADC1" O L 6400 1500 50 
$EndSheet
$Sheet
S 6400 2400 2150 950 
U 5ECD8445
F0 "AnalogOut" 118
F1 "AnalogOut.sch" 118
F2 "AnalogOut" O R 8550 2900 50 
F3 "SDA" B L 6400 2900 50 
F4 "SCL" I L 6400 2700 50 
$EndSheet
$Sheet
S 1000 2150 1450 1350
U 5ED20EE2
F0 "UARTAislada" 118
F1 "UARTAislada.sch" 118
F2 "UARTSlave_TX" I R 2450 2350 50 
F3 "UARTSlave_RX" O R 2450 2700 50 
$EndSheet
$Sheet
S 3300 6550 2150 600 
U 5ECEE31C
F0 "Fuente" 118
F1 "Fuente.sch" 118
$EndSheet
Wire Wire Line
	3350 2350 2450 2350
Wire Wire Line
	2450 2700 3350 2700
$Sheet
S 9450 850  1150 5200
U 5EE56CB1
F0 "Puerto" 118
F1 "Puerto.sch" 118
F2 "Out_Digital1" I L 9450 4200 50 
F3 "Out_Digital2" I L 9450 4350 50 
F4 "Out_Digital0" I L 9450 4050 50 
F5 "In_Digital1" O L 9450 5050 50 
F6 "In_Digital2" O L 9450 5200 50 
F7 "In_Digital0" O L 9450 4900 50 
F8 "Out_Analog0" I L 9450 2900 50 
F9 "In_Analog0" O L 9450 1150 50 
F10 "In_Analog1" O L 9450 1550 50 
F11 "Out_L_220" I L 9450 5550 50 
F12 "Out_N_220" I L 9450 5750 50 
$EndSheet
Wire Wire Line
	8550 1150 9450 1150
Wire Wire Line
	9450 1550 8550 1550
Wire Wire Line
	8550 2900 9450 2900
$Sheet
S 6400 3900 2150 2100
U 5EE6B2B0
F0 "IOs digitales" 118
F1 "IOs digitales.sch" 118
F2 "CPU_Out0" I L 6400 4050 50 
F3 "CPU_Out1" I L 6400 4200 50 
F4 "CPU_Out2" I L 6400 4350 50 
F5 "Salida0" O R 8550 4050 50 
F6 "Salida1" O R 8550 4200 50 
F7 "Salida2" O R 8550 4350 50 
F8 "CPU_In0" O L 6400 4900 50 
F9 "Entrada0" I R 8550 4900 50 
F10 "CPU_In1" O L 6400 5050 50 
F11 "Entrada1" I R 8550 5050 50 
F12 "CPU_ModPower" I L 6400 4500 50 
F13 "L_220V_Out" O R 8550 5550 50 
F14 "N_220V_Out" O R 8550 5750 50 
F15 "CPU_In2" O L 6400 5200 50 
F16 "Entrada2" I R 8550 5200 50 
$EndSheet
Wire Wire Line
	8550 4050 9450 4050
Wire Wire Line
	9450 4200 8550 4200
Wire Wire Line
	8550 4350 9450 4350
Wire Wire Line
	8550 4900 9450 4900
Wire Wire Line
	9450 5050 8550 5050
Wire Wire Line
	8550 5550 9450 5550
Wire Wire Line
	8550 5750 9450 5750
$Sheet
S 3350 850  2100 5150
U 5ED9C9D6
F0 "CPU" 118
F1 "CPU.sch" 118
F2 "ADC0" I R 5450 1150 50 
F3 "ADC1" I R 5450 1500 50 
F4 "UART_RX" I L 3350 2700 50 
F5 "UART_TX" O L 3350 2350 50 
F6 "ModPowerOut" O R 5450 4500 50 
F7 "ModOut0" O R 5450 4050 50 
F8 "ModOut1" O R 5450 4200 50 
F9 "ModOut2" O R 5450 4350 50 
F10 "ModIn0" I R 5450 4900 50 
F11 "ModIn1" I R 5450 5050 50 
F12 "ModIn2" I R 5450 5200 50 
F13 "SCL" O R 5450 2700 50 
F14 "SDA" B R 5450 2900 50 
$EndSheet
Wire Wire Line
	6400 1150 5450 1150
Wire Wire Line
	6400 1500 5450 1500
Wire Wire Line
	5450 2700 6400 2700
Wire Wire Line
	6400 2900 5450 2900
Wire Wire Line
	5450 4200 6400 4200
Wire Wire Line
	5450 4050 6400 4050
Wire Wire Line
	6400 4350 5450 4350
Wire Wire Line
	6400 4500 5450 4500
Wire Wire Line
	5450 4900 6400 4900
Wire Wire Line
	6400 5050 5450 5050
Wire Wire Line
	9450 5200 8550 5200
Wire Wire Line
	6400 5200 5450 5200
$Comp
L Mechanical:MountingHole H101
U 1 1 5ED1215B
P 1200 6450
F 0 "H101" H 1300 6496 50  0000 L CNN
F 1 "MountingHole" H 1300 6405 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1200 6450 50  0001 C CNN
F 3 "~" H 1200 6450 50  0001 C CNN
	1    1200 6450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H103
U 1 1 5ED12ABD
P 1950 6450
F 0 "H103" H 2050 6496 50  0000 L CNN
F 1 "MountingHole" H 2050 6405 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1950 6450 50  0001 C CNN
F 3 "~" H 1950 6450 50  0001 C CNN
	1    1950 6450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H102
U 1 1 5ED130EC
P 1200 6900
F 0 "H102" H 1300 6946 50  0000 L CNN
F 1 "MountingHole" H 1300 6855 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1200 6900 50  0001 C CNN
F 3 "~" H 1200 6900 50  0001 C CNN
	1    1200 6900
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H104
U 1 1 5ED136EF
P 1950 6900
F 0 "H104" H 2050 6946 50  0000 L CNN
F 1 "MountingHole" H 2050 6855 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1950 6900 50  0001 C CNN
F 3 "~" H 1950 6900 50  0001 C CNN
	1    1950 6900
	1    0    0    -1  
$EndComp
$EndSCHEMATC
