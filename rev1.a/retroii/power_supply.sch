EESchema Schematic File Version 4
LIBS:retroii-cache
EELAYER 29 0
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
L 6502Computer-rescue:LED-RESCUE-6502Computer LED1
U 1 1 5C8AD97F
P 5940 6790
AR Path="/5C8AA2BF/5C8AD97F" Ref="LED1"  Part="1" 
AR Path="/5C8AABED/5C8AD97F" Ref="LED?"  Part="1" 
F 0 "LED1" H 5940 6890 50  0000 C CNN
F 1 "LED" H 5940 6690 50  0000 C CNN
F 2 "retroii_footprints:WP1503CB_LED" H 5940 6790 60  0001 C CNN
F 3 "" H 5940 6790 60  0000 C CNN
	1    5940 6790
	0    -1   -1   0   
$EndComp
$Comp
L device:R R49
U 1 1 56D512BD
P 5940 7140
AR Path="/5C8AA2BF/56D512BD" Ref="R49"  Part="1" 
AR Path="/5C8AABED/56D512BD" Ref="R?"  Part="1" 
F 0 "R49" V 6020 7140 50  0000 C CNN
F 1 "330" V 5940 7140 50  0000 C CNN
F 2 "retroii_footprints:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5870 7140 30  0001 C CNN
F 3 "" H 5940 7140 30  0000 C CNN
	1    5940 7140
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR060
U 1 1 56D512BE
P 5940 7465
AR Path="/5C8AA2BF/56D512BE" Ref="#PWR060"  Part="1" 
AR Path="/5C8AABED/56D512BE" Ref="#PWR?"  Part="1" 
F 0 "#PWR060" H 5940 7215 50  0001 C CNN
F 1 "GND" H 5940 7315 50  0000 C CNN
F 2 "" H 5940 7465 60  0000 C CNN
F 3 "" H 5940 7465 60  0000 C CNN
	1    5940 7465
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR052
U 1 1 5C8AD982
P 1525 6790
AR Path="/5C8AA2BF/5C8AD982" Ref="#PWR052"  Part="1" 
AR Path="/5C8AABED/5C8AD982" Ref="#PWR?"  Part="1" 
F 0 "#PWR052" H 1525 6540 50  0001 C CNN
F 1 "GND" H 1525 6640 50  0000 C CNN
F 2 "" H 1525 6790 60  0000 C CNN
F 3 "" H 1525 6790 60  0000 C CNN
	1    1525 6790
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5940 7465 5940 7290
Text Notes 885  6365 0    60   ~ 0
12 volts input
Text Notes 7360 7510 0    60   ~ 0
POWER SUPPLY, ADDRESS DECODING
Text Notes 8185 7645 0    60   ~ 0
3/22/2016
Text Notes 10575 7640 0    60   ~ 0
1.A
$Comp
L 6502:SPST2 SW2
U 1 1 5C8ADA13
P 2410 6590
AR Path="/5C8AA2BF/5C8ADA13" Ref="SW2"  Part="1" 
AR Path="/5C8AABED/5C8ADA13" Ref="SW?"  Part="1" 
F 0 "SW2" H 2410 6690 50  0000 C CNN
F 1 "SPST2" H 2410 6490 50  0000 C CNN
F 2 "retroii_footprints:SW_Micro_Right_Angle_SPST" H 2410 6590 50  0001 C CNN
F 3 "" H 2410 6590 50  0000 C CNN
	1    2410 6590
	1    0    0    -1  
$EndComp
Wire Wire Line
	5940 6405 5940 6590
Text Label 5940 6405 3    50   ~ 0
+5V
$Comp
L Regulator_Switching:LM2575-12BT U11
U 1 1 5CA26C25
P 2960 1450
F 0 "U11" H 2595 1210 50  0000 C CNN
F 1 "LM2576-12" H 2960 1726 50  0000 C CNN
F 2 "retroii_footprints:TO-220-5_Horizontal_TabDown" H 2960 1200 50  0001 L CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/lm2575.pdf" H 2960 1450 50  0001 C CNN
	1    2960 1450
	1    0    0    -1  
$EndComp
$Comp
L 6502:BARREL_JACK_NEW J10
U 1 1 5C8AD983
P 1225 6690
AR Path="/5C8AA2BF/5C8AD983" Ref="J10"  Part="1" 
AR Path="/5C8AABED/5C8AD983" Ref="J?"  Part="1" 
F 0 "J10" H 1225 6940 60  0000 C CNN
F 1 "BARREL_JACK" H 1225 6490 60  0000 C CNN
F 2 "retroii_footprints:Barrel_Jack_PJ002A" H 1225 6690 60  0001 C CNN
F 3 "" H 1225 6690 60  0000 C CNN
	1    1225 6690
	1    0    0    -1  
$EndComp
NoConn ~ 1525 6690
$Comp
L Diode:1N5819 D1
U 1 1 5C99DD0A
P 3520 1825
F 0 "D1" V 3474 1904 50  0000 L CNN
F 1 "1N5822" V 3565 1904 50  0000 L CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 3520 1650 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88525/1n5817.pdf" H 3520 1825 50  0001 C CNN
	1    3520 1825
	0    1    1    0   
$EndComp
$Comp
L Device:CP1_Small C22
U 1 1 5C99EC4A
P 4035 1780
F 0 "C22" H 4040 1840 50  0000 L CNN
F 1 "1000uF" H 4045 1705 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D13.0mm_P5.00mm" H 4073 1630 50  0001 C CNN
F 3 "~" H 4035 1780 50  0001 C CNN
	1    4035 1780
	1    0    0    -1  
$EndComp
$Comp
L Device:L L1
U 1 1 5C99F662
P 3785 1550
F 0 "L1" V 3850 1550 50  0000 C CNN
F 1 "68uH" V 3750 1550 50  0000 C CNN
F 2 "retroii_footprints:Bourns_SRP1770TA-101M" H 3785 1550 50  0001 C CNN
F 3 "~" H 3785 1550 50  0001 C CNN
	1    3785 1550
	0    1    1    0   
$EndComp
$Comp
L Device:CP1_Small C19
U 1 1 5C9A17A4
P 1815 1565
F 0 "C19" H 1906 1611 50  0000 L CNN
F 1 "100uF" H 1906 1520 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 1853 1415 50  0001 C CNN
F 3 "~" H 1815 1565 50  0001 C CNN
	1    1815 1565
	1    0    0    -1  
$EndComp
Wire Wire Line
	3460 1550 3520 1550
Wire Wire Line
	3520 1675 3520 1550
Connection ~ 3520 1550
Wire Wire Line
	3520 1550 3635 1550
Wire Wire Line
	4035 1680 4035 1550
Wire Wire Line
	4035 1550 3935 1550
Wire Wire Line
	3460 1350 4035 1350
Wire Wire Line
	2960 1750 2960 2240
Wire Wire Line
	2960 2240 3520 2240
Wire Wire Line
	3520 1975 3520 2240
Connection ~ 3520 2240
Wire Wire Line
	3520 2240 4035 2240
Wire Wire Line
	4035 1880 4035 2240
Wire Wire Line
	2460 1550 2425 1550
Wire Wire Line
	2425 1550 2425 2240
Wire Wire Line
	2425 2240 2960 2240
Connection ~ 2960 2240
Text HLabel 5675 2240 2    50   Output ~ 0
-12V
Wire Wire Line
	2170 1350 1815 1350
Wire Wire Line
	1815 1350 1815 1465
Connection ~ 1815 1350
Wire Wire Line
	1815 1665 1815 1745
$Comp
L 6502Bootstrapper-cache:GND #PWR053
U 1 1 5C9AC9DE
P 1815 1745
F 0 "#PWR053" H 1815 1495 50  0001 C CNN
F 1 "GND" H 1820 1572 50  0000 C CNN
F 2 "" H 1815 1745 60  0000 C CNN
F 3 "" H 1815 1745 60  0000 C CNN
	1    1815 1745
	1    0    0    -1  
$EndComp
Wire Wire Line
	1605 1350 1815 1350
Text Label 1605 1350 0    50   ~ 0
+VIN
$Comp
L Regulator_Switching:LM2576HVS-5 U12
U 1 1 5C9B0101
P 3335 3185
F 0 "U12" H 2965 2945 50  0000 C CNN
F 1 "LM2576-5" H 3330 3425 50  0000 C CNN
F 2 "retroii_footprints:TO-220-5_Horizontal_TabDown" H 3335 2935 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm2576.pdf" H 3335 3185 50  0001 C CNN
	1    3335 3185
	1    0    0    -1  
$EndComp
$Comp
L Device:L L2
U 1 1 5C9B242E
P 4170 3285
F 0 "L2" V 4235 3285 50  0000 C CNN
F 1 "68uH" V 4135 3285 50  0000 C CNN
F 2 "retroii_footprints:Bourns_SRP1770TA-101M" H 4170 3285 50  0001 C CNN
F 3 "~" H 4170 3285 50  0001 C CNN
	1    4170 3285
	0    1    1    0   
$EndComp
$Comp
L Diode:1N5822 D2
U 1 1 5C9B396D
P 3930 3495
F 0 "D2" V 3884 3574 50  0000 L CNN
F 1 "1N5822" V 3975 3574 50  0000 L CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 3930 3320 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88526/1n5820.pdf" H 3930 3495 50  0001 C CNN
	1    3930 3495
	0    1    1    0   
$EndComp
$Comp
L Device:CP1_Small C23
U 1 1 5C9B410C
P 4450 3490
F 0 "C23" H 4460 3560 50  0000 L CNN
F 1 "1000uF" H 4470 3405 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D13.0mm_P5.00mm" H 4488 3340 50  0001 C CNN
F 3 "~" H 4450 3490 50  0001 C CNN
	1    4450 3490
	1    0    0    -1  
$EndComp
Wire Wire Line
	2835 3285 2805 3285
$Comp
L Device:CP1_Small C20
U 1 1 5C9B6B90
P 2250 3270
F 0 "C20" H 2341 3316 50  0000 L CNN
F 1 "100uF" H 2341 3225 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 2288 3120 50  0001 C CNN
F 3 "~" H 2250 3270 50  0001 C CNN
	1    2250 3270
	1    0    0    -1  
$EndComp
Wire Wire Line
	2595 3085 2250 3085
Wire Wire Line
	2250 3085 2250 3170
Wire Wire Line
	2250 3085 2080 3085
Connection ~ 2250 3085
Text Label 2080 3085 0    50   ~ 0
+VIN
Wire Wire Line
	4020 3285 3930 3285
Wire Wire Line
	3930 3345 3930 3285
Connection ~ 3930 3285
Wire Wire Line
	3930 3285 3835 3285
Wire Wire Line
	5545 3285 5735 3285
Text Label 5735 3285 2    50   ~ 0
+5V
Text HLabel 5735 3285 2    50   Output ~ 0
+5V
$Comp
L Device:CP1_Small C26
U 1 1 5C9C2BC0
P 5260 3495
F 0 "C26" H 5270 3565 50  0000 L CNN
F 1 "100uF" H 5280 3410 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 5298 3345 50  0001 C CNN
F 3 "~" H 5260 3495 50  0001 C CNN
	1    5260 3495
	1    0    0    -1  
$EndComp
$Comp
L Device:L L5
U 1 1 5C9C34DF
P 5025 3285
F 0 "L5" V 5090 3285 50  0000 C CNN
F 1 "20uH" V 4990 3285 50  0000 C CNN
F 2 "retroii_footprints:Pulse_PF0382.223NLT" H 5025 3285 50  0001 C CNN
F 3 "~" H 5025 3285 50  0001 C CNN
	1    5025 3285
	0    1    1    0   
$EndComp
Wire Wire Line
	5175 3285 5260 3285
Wire Wire Line
	5260 3285 5260 3395
Wire Wire Line
	2910 6590 3265 6590
Text Label 3265 6590 2    50   ~ 0
+VIN
$Comp
L Regulator_Switching:LM2576HVS-5 U13
U 1 1 5CA434E4
P 3335 4745
F 0 "U13" H 2965 4505 50  0000 C CNN
F 1 "LM2576-12" H 3330 4985 50  0000 C CNN
F 2 "retroii_footprints:TO-220-5_Horizontal_TabDown" H 3335 4495 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm2576.pdf" H 3335 4745 50  0001 C CNN
	1    3335 4745
	1    0    0    -1  
$EndComp
$Comp
L Device:L L3
U 1 1 5CA434EA
P 4170 4845
F 0 "L3" V 4235 4845 50  0000 C CNN
F 1 "68uH" V 4135 4845 50  0000 C CNN
F 2 "retroii_footprints:Bourns_SRP1770TA-101M" H 4170 4845 50  0001 C CNN
F 3 "~" H 4170 4845 50  0001 C CNN
	1    4170 4845
	0    1    1    0   
$EndComp
$Comp
L Diode:1N5822 D3
U 1 1 5CA434F0
P 3930 5055
F 0 "D3" V 3884 5134 50  0000 L CNN
F 1 "1N5822" V 3975 5134 50  0000 L CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 3930 4880 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88526/1n5820.pdf" H 3930 5055 50  0001 C CNN
	1    3930 5055
	0    1    1    0   
$EndComp
$Comp
L Device:CP1_Small C24
U 1 1 5CA434F6
P 4450 5050
F 0 "C24" H 4460 5120 50  0000 L CNN
F 1 "1000uF" H 4455 4985 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D13.0mm_P5.00mm" H 4488 4900 50  0001 C CNN
F 3 "~" H 4450 5050 50  0001 C CNN
	1    4450 5050
	1    0    0    -1  
$EndComp
$Comp
L 6502Bootstrapper-cache:GND #PWR055
U 1 1 5CA434FC
P 3570 5695
F 0 "#PWR055" H 3570 5445 50  0001 C CNN
F 1 "GND" H 3570 5565 50  0000 C CNN
F 2 "" H 3570 5695 60  0000 C CNN
F 3 "" H 3570 5695 60  0000 C CNN
	1    3570 5695
	1    0    0    -1  
$EndComp
Wire Wire Line
	2835 4845 2805 4845
$Comp
L Device:CP1_Small C21
U 1 1 5CA43503
P 2250 4830
F 0 "C21" H 2341 4876 50  0000 L CNN
F 1 "100uF" H 2341 4785 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 2288 4680 50  0001 C CNN
F 3 "~" H 2250 4830 50  0001 C CNN
	1    2250 4830
	1    0    0    -1  
$EndComp
Wire Wire Line
	2595 4645 2250 4645
Wire Wire Line
	2250 4645 2250 4730
Wire Wire Line
	2250 4645 2080 4645
Connection ~ 2250 4645
Text Label 2080 4645 0    50   ~ 0
+VIN
Wire Wire Line
	4320 4845 4450 4845
Wire Wire Line
	4020 4845 3930 4845
Wire Wire Line
	3930 4905 3930 4845
Connection ~ 3930 4845
Wire Wire Line
	3930 4845 3835 4845
Text Label 5735 4845 2    50   ~ 0
+12V
Text HLabel 5735 4845 2    50   Output ~ 0
+12V
$Comp
L Device:CP1_Small C27
U 1 1 5CA4351A
P 5260 5055
F 0 "C27" H 5270 5125 50  0000 L CNN
F 1 "100uF" H 5280 4970 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 5298 4905 50  0001 C CNN
F 3 "~" H 5260 5055 50  0001 C CNN
	1    5260 5055
	1    0    0    -1  
$EndComp
$Comp
L Device:L L6
U 1 1 5CA43520
P 5025 4845
F 0 "L6" V 5090 4845 50  0000 C CNN
F 1 "20uH" V 4990 4845 50  0000 C CNN
F 2 "retroii_footprints:Pulse_PF0382.223NLT" H 5025 4845 50  0001 C CNN
F 3 "~" H 5025 4845 50  0001 C CNN
	1    5025 4845
	0    1    1    0   
$EndComp
Wire Wire Line
	5175 4845 5260 4845
$Comp
L Regulator_Switching:LM2575-12BT U15
U 1 1 5CA4BB25
P 7745 1435
F 0 "U15" H 7380 1195 50  0000 C CNN
F 1 "LM2576-5" H 7745 1711 50  0000 C CNN
F 2 "retroii_footprints:TO-220-5_Horizontal_TabDown" H 7745 1185 50  0001 L CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/lm2575.pdf" H 7745 1435 50  0001 C CNN
	1    7745 1435
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N5819 D5
U 1 1 5CA4BB2B
P 8305 1810
F 0 "D5" V 8259 1889 50  0000 L CNN
F 1 "1N5822" V 8350 1889 50  0000 L CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 8305 1635 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88525/1n5817.pdf" H 8305 1810 50  0001 C CNN
	1    8305 1810
	0    1    1    0   
$EndComp
$Comp
L Device:CP1_Small C31
U 1 1 5CA4BB31
P 8820 1765
F 0 "C31" H 8830 1855 50  0000 L CNN
F 1 "1000uF" H 8825 1690 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D13.0mm_P5.00mm" H 8858 1615 50  0001 C CNN
F 3 "~" H 8820 1765 50  0001 C CNN
	1    8820 1765
	1    0    0    -1  
$EndComp
$Comp
L Device:L L8
U 1 1 5CA4BB37
P 8570 1535
F 0 "L8" V 8635 1535 50  0000 C CNN
F 1 "68uH" V 8535 1535 50  0000 C CNN
F 2 "retroii_footprints:Bourns_SRP1770TA-101M" H 8570 1535 50  0001 C CNN
F 3 "~" H 8570 1535 50  0001 C CNN
	1    8570 1535
	0    1    1    0   
$EndComp
$Comp
L Device:CP1_Small C29
U 1 1 5CA4BB3D
P 6600 1550
F 0 "C29" H 6691 1596 50  0000 L CNN
F 1 "100uF" H 6691 1505 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 6638 1400 50  0001 C CNN
F 3 "~" H 6600 1550 50  0001 C CNN
	1    6600 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8245 1535 8305 1535
Wire Wire Line
	8305 1660 8305 1535
Connection ~ 8305 1535
Wire Wire Line
	8305 1535 8420 1535
$Comp
L 6502Bootstrapper-cache:GND #PWR061
U 1 1 5CA4BB4F
P 10175 1480
F 0 "#PWR061" H 10175 1230 50  0001 C CNN
F 1 "GND" H 10180 1307 50  0000 C CNN
F 2 "" H 10175 1480 60  0000 C CNN
F 3 "" H 10175 1480 60  0000 C CNN
	1    10175 1480
	1    0    0    -1  
$EndComp
Wire Wire Line
	7745 1735 7745 2225
Wire Wire Line
	7745 2225 8305 2225
Wire Wire Line
	8305 1960 8305 2225
Connection ~ 8305 2225
Wire Wire Line
	8305 2225 8820 2225
Wire Wire Line
	8820 1865 8820 2225
Wire Wire Line
	7245 1535 7210 1535
Wire Wire Line
	7210 1535 7210 2225
Wire Wire Line
	7210 2225 7745 2225
Connection ~ 7745 2225
Text HLabel 10365 2225 2    50   Output ~ 0
-5V
Wire Wire Line
	6955 1335 6600 1335
Wire Wire Line
	6600 1335 6600 1450
Connection ~ 6600 1335
Wire Wire Line
	6600 1650 6600 1730
$Comp
L 6502Bootstrapper-cache:GND #PWR058
U 1 1 5CA4BB66
P 6600 1730
F 0 "#PWR058" H 6600 1480 50  0001 C CNN
F 1 "GND" H 6605 1557 50  0000 C CNN
F 2 "" H 6600 1730 60  0000 C CNN
F 3 "" H 6600 1730 60  0000 C CNN
	1    6600 1730
	1    0    0    -1  
$EndComp
Wire Wire Line
	6390 1335 6600 1335
Text Label 6390 1335 0    50   ~ 0
+VIN
$Comp
L Regulator_Switching:LM2576HVS-5 U14
U 1 1 5CA5B567
P 7385 4755
F 0 "U14" H 7015 4515 50  0000 C CNN
F 1 "LM2576-3.3" H 7380 4995 50  0000 C CNN
F 2 "retroii_footprints:TO-220-5_Horizontal_TabDown" H 7385 4505 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm2576.pdf" H 7385 4755 50  0001 C CNN
	1    7385 4755
	1    0    0    -1  
$EndComp
$Comp
L Device:L L7
U 1 1 5CA5B56D
P 8220 4855
F 0 "L7" V 8285 4855 50  0000 C CNN
F 1 "68uH" V 8185 4855 50  0000 C CNN
F 2 "retroii_footprints:Bourns_SRP1770TA-101M" H 8220 4855 50  0001 C CNN
F 3 "~" H 8220 4855 50  0001 C CNN
	1    8220 4855
	0    1    1    0   
$EndComp
$Comp
L Diode:1N5822 D4
U 1 1 5CA5B573
P 7980 5065
F 0 "D4" V 7934 5144 50  0000 L CNN
F 1 "1N5822" V 8025 5144 50  0000 L CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 7980 4890 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88526/1n5820.pdf" H 7980 5065 50  0001 C CNN
	1    7980 5065
	0    1    1    0   
$EndComp
$Comp
L Device:CP1_Small C30
U 1 1 5CA5B579
P 8500 5060
F 0 "C30" H 8510 5130 50  0000 L CNN
F 1 "1000uF" H 8505 4975 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D13.0mm_P5.00mm" H 8538 4910 50  0001 C CNN
F 3 "~" H 8500 5060 50  0001 C CNN
	1    8500 5060
	1    0    0    -1  
$EndComp
Wire Wire Line
	6885 4855 6855 4855
$Comp
L Device:CP1_Small C28
U 1 1 5CA5B586
P 6300 4840
F 0 "C28" H 6391 4886 50  0000 L CNN
F 1 "100uF" H 6391 4795 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 6338 4690 50  0001 C CNN
F 3 "~" H 6300 4840 50  0001 C CNN
	1    6300 4840
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 4655 6300 4740
Wire Wire Line
	6300 4655 6130 4655
Text Label 6130 4655 0    50   ~ 0
+VIN
Wire Wire Line
	8070 4855 7980 4855
Wire Wire Line
	7980 4915 7980 4855
Connection ~ 7980 4855
Wire Wire Line
	7980 4855 7885 4855
Text Label 9785 4855 2    50   ~ 0
+3V3
Text HLabel 9785 4855 2    50   Output ~ 0
+3V3
$Comp
L Device:CP1_Small C32
U 1 1 5CA5B59D
P 9310 5065
F 0 "C32" H 9320 5135 50  0000 L CNN
F 1 "100uF" H 9330 4980 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 9348 4915 50  0001 C CNN
F 3 "~" H 9310 5065 50  0001 C CNN
	1    9310 5065
	1    0    0    -1  
$EndComp
$Comp
L Device:L L9
U 1 1 5CA5B5A3
P 9075 4855
F 0 "L9" V 9140 4855 50  0000 C CNN
F 1 "20uH" V 9040 4855 50  0000 C CNN
F 2 "retroii_footprints:Pulse_PF0382.223NLT" H 9075 4855 50  0001 C CNN
F 3 "~" H 9075 4855 50  0001 C CNN
	1    9075 4855
	0    1    1    0   
$EndComp
Wire Wire Line
	9225 4855 9310 4855
$Comp
L Connector_Generic:Conn_02x10_Odd_Even J11
U 1 1 5CAAD78B
P 4145 6830
F 0 "J11" V 4149 7310 50  0000 L CNN
F 1 "Conn_02x10" V 4240 7310 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x10_P2.54mm_Vertical" H 4145 6830 50  0001 C CNN
F 3 "~" H 4145 6830 50  0001 C CNN
	1    4145 6830
	0    1    1    0   
$EndComp
Wire Wire Line
	3645 6630 3645 6455
Wire Wire Line
	3645 6455 3745 6455
Wire Wire Line
	4545 6455 4545 6630
$Comp
L 6502Bootstrapper-cache:GND #PWR056
U 1 1 5CAB7CB2
P 4095 6395
F 0 "#PWR056" H 4095 6145 50  0001 C CNN
F 1 "GND" H 4100 6222 50  0000 C CNN
F 2 "" H 4095 6395 60  0000 C CNN
F 3 "" H 4095 6395 60  0000 C CNN
	1    4095 6395
	-1   0    0    1   
$EndComp
Wire Wire Line
	3745 6630 3745 6455
Connection ~ 3745 6455
Wire Wire Line
	3845 6630 3845 6455
Wire Wire Line
	3745 6455 3845 6455
Connection ~ 3845 6455
Wire Wire Line
	3945 6630 3945 6455
Wire Wire Line
	3845 6455 3945 6455
Connection ~ 3945 6455
Wire Wire Line
	3945 6455 4045 6455
Wire Wire Line
	4045 6630 4045 6455
Connection ~ 4045 6455
Wire Wire Line
	4145 6630 4145 6455
Connection ~ 4145 6455
Wire Wire Line
	4145 6455 4245 6455
Wire Wire Line
	4245 6630 4245 6455
Connection ~ 4245 6455
Wire Wire Line
	4245 6455 4345 6455
Wire Wire Line
	4345 6630 4345 6455
Connection ~ 4345 6455
Wire Wire Line
	4345 6455 4445 6455
Wire Wire Line
	4445 6630 4445 6455
Connection ~ 4445 6455
Wire Wire Line
	4445 6455 4545 6455
Wire Wire Line
	4045 6455 4095 6455
Wire Wire Line
	4095 6455 4095 6395
Connection ~ 4095 6455
Wire Wire Line
	4095 6455 4145 6455
Text Label 5675 2240 2    50   ~ 0
-12V
Text Label 10365 2225 2    50   ~ 0
-5V
Wire Wire Line
	3645 7130 3645 7325
Wire Wire Line
	3745 7130 3745 7325
Wire Wire Line
	4245 7130 4245 7325
Wire Wire Line
	4345 7130 4345 7325
Wire Wire Line
	4045 7130 4045 7325
Wire Wire Line
	4145 7130 4145 7325
Wire Wire Line
	3845 7130 3845 7325
Wire Wire Line
	3945 7130 3945 7325
Wire Wire Line
	4445 7130 4445 7325
Wire Wire Line
	4545 7130 4545 7325
Text Label 3645 7325 1    50   ~ 0
+12V
Text Label 3745 7325 1    50   ~ 0
+12V
Text Label 4245 7325 1    50   ~ 0
-12V
Text Label 4345 7325 1    50   ~ 0
-12V
Text Label 4045 7325 1    50   ~ 0
+5V
Text Label 4145 7325 1    50   ~ 0
+5V
Text Label 3845 7325 1    50   ~ 0
-5V
Text Label 3945 7325 1    50   ~ 0
-5V
Text Label 4445 7325 1    50   ~ 0
+3V3
Text Label 4545 7325 1    50   ~ 0
+3V3
$Comp
L Device:CP1_Small C33
U 1 1 5CCD9D55
P 9590 1765
F 0 "C33" H 9600 1835 50  0000 L CNN
F 1 "100uF" H 9610 1680 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 9628 1615 50  0001 C CNN
F 3 "~" H 9590 1765 50  0001 C CNN
	1    9590 1765
	1    0    0    -1  
$EndComp
$Comp
L Device:L L10
U 1 1 5CCDA72D
P 9375 2225
F 0 "L10" V 9440 2225 50  0000 C CNN
F 1 "20uH" V 9270 2220 50  0000 C CNN
F 2 "retroii_footprints:Pulse_PF0382.223NLT" H 9375 2225 50  0001 C CNN
F 3 "~" H 9375 2225 50  0001 C CNN
	1    9375 2225
	0    1    1    0   
$EndComp
Connection ~ 8820 2225
Wire Wire Line
	9590 1865 9590 2225
Wire Wire Line
	9590 2225 9525 2225
Wire Wire Line
	9850 2225 10365 2225
Wire Wire Line
	10175 1335 10175 1480
Wire Wire Line
	9130 1335 9590 1335
Wire Wire Line
	9590 1665 9590 1335
Wire Wire Line
	9850 1335 10175 1335
$Comp
L 6502Bootstrapper-cache:GND #PWR057
U 1 1 5CD0ECE9
P 5485 1495
F 0 "#PWR057" H 5485 1245 50  0001 C CNN
F 1 "GND" H 5490 1322 50  0000 C CNN
F 2 "" H 5485 1495 60  0000 C CNN
F 3 "" H 5485 1495 60  0000 C CNN
	1    5485 1495
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C25
U 1 1 5CD0ECEF
P 4890 1780
F 0 "C25" H 4900 1850 50  0000 L CNN
F 1 "100uF" H 4910 1695 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 4928 1630 50  0001 C CNN
F 3 "~" H 4890 1780 50  0001 C CNN
	1    4890 1780
	1    0    0    -1  
$EndComp
Wire Wire Line
	4890 1880 4890 2240
Wire Wire Line
	4890 2240 4825 2240
Wire Wire Line
	5160 2240 5675 2240
Wire Wire Line
	4890 1680 4890 1350
Wire Wire Line
	5160 1350 5485 1350
$Comp
L Device:L L4
U 1 1 5CD15769
P 4675 2240
F 0 "L4" V 4740 2240 50  0000 C CNN
F 1 "20uH" V 4570 2235 50  0000 C CNN
F 2 "retroii_footprints:Pulse_PF0382.223NLT" H 4675 2240 50  0001 C CNN
F 3 "~" H 4675 2240 50  0001 C CNN
	1    4675 2240
	0    1    1    0   
$EndComp
Connection ~ 4035 2240
Wire Wire Line
	5485 1495 5485 1350
$Comp
L 6502:R R82
U 1 1 5D5287CA
P 4800 5035
F 0 "R82" H 4840 5035 50  0000 L CNN
F 1 "0" H 4775 5030 50  0000 L CNN
F 2 "retroii_footprints:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4730 5035 30  0001 C CNN
F 3 "" H 4800 5035 30  0000 C CNN
	1    4800 5035
	1    0    0    -1  
$EndComp
$Comp
L 6502:R R83
U 1 1 5D53754F
P 4800 5395
F 0 "R83" H 4840 5395 50  0000 L CNN
F 1 "DNP" V 4800 5320 50  0000 L CNN
F 2 "retroii_footprints:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4730 5395 30  0001 C CNN
F 3 "" H 4800 5395 30  0000 C CNN
	1    4800 5395
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4845 4800 4885
Wire Wire Line
	4450 4845 4800 4845
Wire Wire Line
	4875 4845 4800 4845
Connection ~ 4800 4845
Wire Wire Line
	4800 5185 4800 5215
Wire Wire Line
	4450 4950 4450 4845
Connection ~ 4450 4845
Wire Wire Line
	4670 4645 4670 5215
Wire Wire Line
	4670 5215 4800 5215
Wire Wire Line
	3835 4645 4670 4645
Connection ~ 4800 5215
Wire Wire Line
	4800 5215 4800 5245
Wire Wire Line
	4800 5545 4800 5640
Wire Wire Line
	4800 5640 4450 5640
Wire Wire Line
	2250 4930 2250 5640
Wire Wire Line
	2805 4845 2805 5640
Wire Wire Line
	3930 5205 3930 5640
Connection ~ 3930 5640
Wire Wire Line
	3930 5640 3570 5640
Wire Wire Line
	4450 5150 4450 5640
Connection ~ 4450 5640
Wire Wire Line
	4450 5640 3930 5640
Wire Wire Line
	5260 5640 4800 5640
Connection ~ 4800 5640
Text Notes 2380 880  0    50   ~ 0
Added flexibility of voltage programming resistors into the fixed regulator design\nin case I ever wanted to go with the adjustable lm2576 version for cost savings.
Wire Wire Line
	3570 5695 3570 5640
Connection ~ 3570 5640
Wire Wire Line
	3570 5640 3335 5640
Wire Wire Line
	3335 5045 3335 5640
Connection ~ 3335 5640
Wire Wire Line
	3335 5640 2805 5640
$Comp
L 6502:R R90
U 1 1 5D5C78CB
P 8850 5045
F 0 "R90" H 8890 5045 50  0000 L CNN
F 1 "0" H 8825 5040 50  0000 L CNN
F 2 "retroii_footprints:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8780 5045 30  0001 C CNN
F 3 "" H 8850 5045 30  0000 C CNN
	1    8850 5045
	1    0    0    -1  
$EndComp
$Comp
L 6502:R R91
U 1 1 5D5C78D1
P 8850 5405
F 0 "R91" H 8890 5405 50  0000 L CNN
F 1 "DNP" V 8850 5330 50  0000 L CNN
F 2 "retroii_footprints:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8780 5405 30  0001 C CNN
F 3 "" H 8850 5405 30  0000 C CNN
	1    8850 5405
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 5195 8850 5225
Connection ~ 8850 5225
Wire Wire Line
	8850 5225 8850 5255
Wire Wire Line
	8370 4855 8500 4855
Wire Wire Line
	8500 4960 8500 4855
Wire Wire Line
	7885 4655 8705 4655
$Comp
L 6502Bootstrapper-cache:GND #PWR059
U 1 1 5D615E16
P 7620 5705
F 0 "#PWR059" H 7620 5455 50  0001 C CNN
F 1 "GND" H 7620 5575 50  0000 C CNN
F 2 "" H 7620 5705 60  0000 C CNN
F 3 "" H 7620 5705 60  0000 C CNN
	1    7620 5705
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 5555 8850 5650
Wire Wire Line
	8850 5650 8500 5650
Wire Wire Line
	6300 4940 6300 5650
Wire Wire Line
	6855 4855 6855 5650
Wire Wire Line
	7980 5215 7980 5650
Connection ~ 7980 5650
Wire Wire Line
	7980 5650 7620 5650
Wire Wire Line
	8500 5160 8500 5650
Connection ~ 8500 5650
Wire Wire Line
	8500 5650 7980 5650
Wire Wire Line
	9310 5650 8850 5650
Connection ~ 8850 5650
Wire Wire Line
	7620 5705 7620 5650
Connection ~ 7620 5650
Wire Wire Line
	7620 5650 7385 5650
Wire Wire Line
	7385 5055 7385 5650
Connection ~ 7385 5650
Wire Wire Line
	7385 5650 6855 5650
Wire Wire Line
	8925 4855 8850 4855
Connection ~ 8500 4855
Wire Wire Line
	8850 4895 8850 4855
Connection ~ 8850 4855
Wire Wire Line
	8850 4855 8500 4855
Wire Wire Line
	8705 4655 8705 5225
Wire Wire Line
	8705 5225 8850 5225
$Comp
L 6502Bootstrapper-cache:GND #PWR054
U 1 1 5D69CFDE
P 3570 4135
F 0 "#PWR054" H 3570 3885 50  0001 C CNN
F 1 "GND" H 3570 4005 50  0000 C CNN
F 2 "" H 3570 4135 60  0000 C CNN
F 3 "" H 3570 4135 60  0000 C CNN
	1    3570 4135
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3985 4800 4080
Wire Wire Line
	4800 4080 4450 4080
Wire Wire Line
	2250 3370 2250 4080
Wire Wire Line
	2805 3285 2805 4080
Connection ~ 3930 4080
Wire Wire Line
	3930 4080 3570 4080
Wire Wire Line
	4450 3590 4450 4080
Connection ~ 4450 4080
Wire Wire Line
	4450 4080 3930 4080
Wire Wire Line
	5260 4080 4800 4080
Wire Wire Line
	5260 3595 5260 4080
Connection ~ 4800 4080
Wire Wire Line
	3570 4135 3570 4080
Connection ~ 3570 4080
Wire Wire Line
	3570 4080 3335 4080
Wire Wire Line
	3335 3485 3335 4080
Connection ~ 3335 4080
Wire Wire Line
	3335 4080 2805 4080
Wire Wire Line
	3930 3645 3930 4080
$Comp
L 6502:R R86
U 1 1 5D6B0EA0
P 4800 3475
F 0 "R86" H 4840 3475 50  0000 L CNN
F 1 "0" H 4775 3470 50  0000 L CNN
F 2 "retroii_footprints:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4730 3475 30  0001 C CNN
F 3 "" H 4800 3475 30  0000 C CNN
	1    4800 3475
	1    0    0    -1  
$EndComp
$Comp
L 6502:R R87
U 1 1 5D6B0EA6
P 4800 3835
F 0 "R87" H 4840 3835 50  0000 L CNN
F 1 "DNP" V 4800 3760 50  0000 L CNN
F 2 "retroii_footprints:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4730 3835 30  0001 C CNN
F 3 "" H 4800 3835 30  0000 C CNN
	1    4800 3835
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3625 4800 3655
Wire Wire Line
	4670 3655 4800 3655
Connection ~ 4800 3655
Wire Wire Line
	4800 3655 4800 3685
Wire Wire Line
	4800 3325 4800 3285
Connection ~ 4800 3285
Wire Wire Line
	4800 3285 4875 3285
Wire Wire Line
	4320 3285 4450 3285
Wire Wire Line
	4450 3390 4450 3285
Connection ~ 4450 3285
Wire Wire Line
	4450 3285 4800 3285
Wire Wire Line
	4670 3085 4670 3655
Wire Wire Line
	3835 3085 4670 3085
$Comp
L 6502:R R84
U 1 1 5D6FB570
P 4375 1630
F 0 "R84" H 4415 1630 50  0000 L CNN
F 1 "0" H 4350 1625 50  0000 L CNN
F 2 "retroii_footprints:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4305 1630 30  0001 C CNN
F 3 "" H 4375 1630 30  0000 C CNN
	1    4375 1630
	1    0    0    -1  
$EndComp
$Comp
L 6502:R R85
U 1 1 5D6FB576
P 4375 1990
F 0 "R85" H 4415 1990 50  0000 L CNN
F 1 "DNP" V 4375 1915 50  0000 L CNN
F 2 "retroii_footprints:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4305 1990 30  0001 C CNN
F 3 "" H 4375 1990 30  0000 C CNN
	1    4375 1990
	1    0    0    -1  
$EndComp
Wire Wire Line
	4375 1780 4375 1810
Wire Wire Line
	4245 1810 4375 1810
Connection ~ 4375 1810
Wire Wire Line
	4375 1810 4375 1840
Wire Wire Line
	4035 2240 4375 2240
Wire Wire Line
	4375 2140 4375 2240
Connection ~ 4375 2240
Wire Wire Line
	4375 2240 4525 2240
Wire Wire Line
	4375 1350 4375 1480
Wire Wire Line
	4375 1350 4890 1350
Wire Wire Line
	4035 1550 4205 1550
Wire Wire Line
	4205 1550 4205 1350
Wire Wire Line
	4205 1350 4375 1350
Connection ~ 4035 1550
Connection ~ 4375 1350
Wire Wire Line
	4245 1395 4035 1395
Wire Wire Line
	4035 1395 4035 1350
Wire Wire Line
	4245 1395 4245 1810
$Comp
L 6502:R R88
U 1 1 5D74B3C8
P 9130 1600
F 0 "R88" H 9170 1600 50  0000 L CNN
F 1 "0" H 9105 1595 50  0000 L CNN
F 2 "retroii_footprints:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9060 1600 30  0001 C CNN
F 3 "" H 9130 1600 30  0000 C CNN
	1    9130 1600
	1    0    0    -1  
$EndComp
$Comp
L 6502:R R89
U 1 1 5D74B3CE
P 9130 1960
F 0 "R89" H 9170 1960 50  0000 L CNN
F 1 "DNP" V 9130 1885 50  0000 L CNN
F 2 "retroii_footprints:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9060 1960 30  0001 C CNN
F 3 "" H 9130 1960 30  0000 C CNN
	1    9130 1960
	1    0    0    -1  
$EndComp
Wire Wire Line
	9130 1750 9130 1780
Connection ~ 9130 1780
Wire Wire Line
	9130 1780 9130 1810
Wire Wire Line
	8820 2225 9130 2225
Wire Wire Line
	9130 2110 9130 2225
Connection ~ 9130 2225
Wire Wire Line
	9130 2225 9225 2225
Wire Wire Line
	9130 1335 9130 1450
Wire Wire Line
	9130 1335 8995 1335
Wire Wire Line
	8995 1335 8995 1535
Wire Wire Line
	8720 1535 8820 1535
Connection ~ 9130 1335
Wire Wire Line
	8820 1665 8820 1535
Connection ~ 8820 1535
Wire Wire Line
	8820 1535 8995 1535
Wire Wire Line
	8965 1335 8965 1780
Wire Wire Line
	8245 1335 8965 1335
Wire Wire Line
	8965 1780 9130 1780
$Comp
L Device:C_Small C81
U 1 1 5CF58C2D
P 2595 3545
F 0 "C81" H 2687 3591 50  0000 L CNN
F 1 "DNP" H 2687 3500 50  0000 L CNN
F 2 "retroii_footprints:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 2595 3545 50  0001 C CNN
F 3 "~" H 2595 3545 50  0001 C CNN
	1    2595 3545
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C84
U 1 1 5CF5ABFB
P 5545 3705
F 0 "C84" H 5637 3751 50  0000 L CNN
F 1 "DNP" H 5637 3660 50  0000 L CNN
F 2 "retroii_footprints:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 5545 3705 50  0001 C CNN
F 3 "~" H 5545 3705 50  0001 C CNN
	1    5545 3705
	1    0    0    -1  
$EndComp
Wire Wire Line
	2595 3085 2595 3445
Wire Wire Line
	2595 3645 2595 4080
Wire Wire Line
	2250 4080 2595 4080
Wire Wire Line
	2595 4080 2805 4080
Connection ~ 2595 4080
Connection ~ 2805 4080
Wire Wire Line
	2835 3085 2595 3085
Connection ~ 2595 3085
Wire Wire Line
	5260 3285 5545 3285
Wire Wire Line
	5545 3285 5545 3605
Connection ~ 5260 3285
Wire Wire Line
	5545 3805 5545 4080
Wire Wire Line
	5545 4080 5260 4080
Connection ~ 5260 4080
Connection ~ 5545 3285
$Comp
L Device:C_Small C82
U 1 1 5CFDF5E4
P 2595 5105
F 0 "C82" H 2687 5151 50  0000 L CNN
F 1 "DNP" H 2687 5060 50  0000 L CNN
F 2 "retroii_footprints:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 2595 5105 50  0001 C CNN
F 3 "~" H 2595 5105 50  0001 C CNN
	1    2595 5105
	1    0    0    -1  
$EndComp
Wire Wire Line
	2595 4645 2595 5005
Wire Wire Line
	2595 5205 2595 5640
Wire Wire Line
	2835 4645 2595 4645
Connection ~ 2595 4645
Wire Wire Line
	2805 5640 2595 5640
Connection ~ 2805 5640
Wire Wire Line
	2250 5640 2595 5640
Connection ~ 2595 5640
Wire Wire Line
	5545 4845 5735 4845
$Comp
L Device:C_Small C85
U 1 1 5D044616
P 5545 5265
F 0 "C85" H 5637 5311 50  0000 L CNN
F 1 "DNP" H 5637 5220 50  0000 L CNN
F 2 "retroii_footprints:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 5545 5265 50  0001 C CNN
F 3 "~" H 5545 5265 50  0001 C CNN
	1    5545 5265
	1    0    0    -1  
$EndComp
Wire Wire Line
	5260 4845 5545 4845
Wire Wire Line
	5545 4845 5545 5165
Wire Wire Line
	5545 5365 5545 5640
Wire Wire Line
	5545 5640 5260 5640
Connection ~ 5545 4845
Wire Wire Line
	6645 4655 6300 4655
$Comp
L Device:C_Small C86
U 1 1 5D062763
P 6645 5115
F 0 "C86" H 6737 5161 50  0000 L CNN
F 1 "DNP" H 6737 5070 50  0000 L CNN
F 2 "retroii_footprints:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 6645 5115 50  0001 C CNN
F 3 "~" H 6645 5115 50  0001 C CNN
	1    6645 5115
	1    0    0    -1  
$EndComp
Wire Wire Line
	6645 4655 6645 5015
Wire Wire Line
	6645 5215 6645 5650
Wire Wire Line
	6885 4655 6645 4655
Connection ~ 6645 4655
Connection ~ 6300 4655
Wire Wire Line
	6855 5650 6645 5650
Connection ~ 6855 5650
Wire Wire Line
	6300 5650 6645 5650
Connection ~ 6645 5650
Wire Wire Line
	9595 4855 9785 4855
$Comp
L Device:C_Small C88
U 1 1 5D0B9988
P 9595 5275
F 0 "C88" H 9687 5321 50  0000 L CNN
F 1 "DNP" H 9687 5230 50  0000 L CNN
F 2 "retroii_footprints:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 9595 5275 50  0001 C CNN
F 3 "~" H 9595 5275 50  0001 C CNN
	1    9595 5275
	1    0    0    -1  
$EndComp
Wire Wire Line
	9310 4855 9595 4855
Wire Wire Line
	9595 4855 9595 5175
Wire Wire Line
	9595 5375 9595 5650
Wire Wire Line
	9595 5650 9310 5650
Connection ~ 9595 4855
Wire Wire Line
	5260 4955 5260 4845
Connection ~ 5260 4845
Wire Wire Line
	5260 5155 5260 5640
Connection ~ 5260 5640
Wire Wire Line
	9310 4855 9310 4965
Connection ~ 9310 4855
Wire Wire Line
	9310 5165 9310 5650
Connection ~ 9310 5650
$Comp
L Device:C_Small C80
U 1 1 5D1048E9
P 2170 1565
F 0 "C80" H 2262 1611 50  0000 L CNN
F 1 "DNP" H 2262 1520 50  0000 L CNN
F 2 "retroii_footprints:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 2170 1565 50  0001 C CNN
F 3 "~" H 2170 1565 50  0001 C CNN
	1    2170 1565
	1    0    0    -1  
$EndComp
Wire Wire Line
	2460 1350 2170 1350
Wire Wire Line
	2170 1350 2170 1465
Wire Wire Line
	2170 1665 2170 1745
$Comp
L 6502Bootstrapper-cache:GND #PWR0117
U 1 1 5D14047D
P 2170 1745
F 0 "#PWR0117" H 2170 1495 50  0001 C CNN
F 1 "GND" H 2175 1572 50  0000 C CNN
F 2 "" H 2170 1745 60  0000 C CNN
F 3 "" H 2170 1745 60  0000 C CNN
	1    2170 1745
	1    0    0    -1  
$EndComp
Connection ~ 2170 1350
$Comp
L Device:C_Small C83
U 1 1 5D192006
P 5160 1785
F 0 "C83" H 5252 1831 50  0000 L CNN
F 1 "DNP" H 5252 1740 50  0000 L CNN
F 2 "retroii_footprints:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 5160 1785 50  0001 C CNN
F 3 "~" H 5160 1785 50  0001 C CNN
	1    5160 1785
	1    0    0    -1  
$EndComp
Wire Wire Line
	5160 1685 5160 1350
Wire Wire Line
	5160 1350 4890 1350
Connection ~ 4890 1350
Wire Wire Line
	5160 1885 5160 2240
Wire Wire Line
	5160 2240 4890 2240
Connection ~ 4890 2240
Connection ~ 5160 1350
Connection ~ 5160 2240
$Comp
L Device:C_Small C87
U 1 1 5D1D4546
P 6955 1550
F 0 "C87" H 7047 1596 50  0000 L CNN
F 1 "DNP" H 7047 1505 50  0000 L CNN
F 2 "retroii_footprints:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 6955 1550 50  0001 C CNN
F 3 "~" H 6955 1550 50  0001 C CNN
	1    6955 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7245 1335 6955 1335
Wire Wire Line
	6955 1335 6955 1450
Wire Wire Line
	6955 1650 6955 1730
$Comp
L 6502Bootstrapper-cache:GND #PWR0118
U 1 1 5D1D454F
P 6955 1730
F 0 "#PWR0118" H 6955 1480 50  0001 C CNN
F 1 "GND" H 6960 1557 50  0000 C CNN
F 2 "" H 6955 1730 60  0000 C CNN
F 3 "" H 6955 1730 60  0000 C CNN
	1    6955 1730
	1    0    0    -1  
$EndComp
Connection ~ 6955 1335
$Comp
L Device:C_Small C89
U 1 1 5D205B7E
P 9850 1770
F 0 "C89" H 9942 1816 50  0000 L CNN
F 1 "DNP" H 9942 1725 50  0000 L CNN
F 2 "retroii_footprints:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 9850 1770 50  0001 C CNN
F 3 "~" H 9850 1770 50  0001 C CNN
	1    9850 1770
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 1670 9850 1335
Wire Wire Line
	9850 1870 9850 2225
Wire Wire Line
	9590 1335 9850 1335
Connection ~ 9590 1335
Wire Wire Line
	9590 2225 9850 2225
Connection ~ 9590 2225
Connection ~ 9850 1335
Connection ~ 9850 2225
$Comp
L Device:Fuse F1
U 1 1 5D375059
P 1715 6590
F 0 "F1" V 1518 6590 50  0000 C CNN
F 1 "Fuse 2.5 amp" V 1609 6590 50  0000 C CNN
F 2 "retroii_footprints:littlefuse_5.08_radial" V 1645 6590 50  0001 C CNN
F 3 "~" H 1715 6590 50  0001 C CNN
	1    1715 6590
	0    1    1    0   
$EndComp
Wire Wire Line
	1525 6590 1565 6590
Wire Wire Line
	1865 6590 1910 6590
$EndSCHEMATC
