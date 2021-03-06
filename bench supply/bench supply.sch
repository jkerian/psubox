EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L power:VS #PWR0108
U 1 1 6067AEB1
P 2400 1100
F 0 "#PWR0108" H 2200 950 50  0001 C CNN
F 1 "VS" H 2415 1273 50  0000 C CNN
F 2 "" H 2400 1100 50  0001 C CNN
F 3 "" H 2400 1100 50  0001 C CNN
	1    2400 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 6067CA7E
P 3700 1100
F 0 "D1" H 3693 845 50  0000 C CNN
F 1 "Standby LED" H 3693 936 50  0000 C CNN
F 2 "" H 3700 1100 50  0001 C CNN
F 3 "~" H 3700 1100 50  0001 C CNN
	1    3700 1100
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R1
U 1 1 6067DB05
P 3150 1100
F 0 "R1" V 2954 1100 50  0000 C CNN
F 1 "R_Small" V 3045 1100 50  0000 C CNN
F 2 "" H 3150 1100 50  0001 C CNN
F 3 "~" H 3150 1100 50  0001 C CNN
	1    3150 1100
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 1100 3550 1100
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 606A9A0F
P 2400 1700
F 0 "#FLG0101" H 2400 1775 50  0001 C CNN
F 1 "PWR_FLAG" H 2400 1873 50  0000 C CNN
F 2 "" H 2400 1700 50  0001 C CNN
F 3 "~" H 2400 1700 50  0001 C CNN
	1    2400 1700
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW1
U 1 1 606AAB21
P 3200 800
F 0 "SW1" H 3200 1035 50  0000 C CNN
F 1 "Main Power Switch" H 3200 944 50  0000 C CNN
F 2 "" H 3200 800 50  0001 C CNN
F 3 "~" H 3200 800 50  0001 C CNN
	1    3200 800 
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R7
U 1 1 606AB537
P 3400 1700
F 0 "R7" V 3204 1700 50  0000 C CNN
F 1 "R_Small" V 3295 1700 50  0000 C CNN
F 2 "" H 3400 1700 50  0001 C CNN
F 3 "~" H 3400 1700 50  0001 C CNN
	1    3400 1700
	0    1    1    0   
$EndComp
$Comp
L Device:LED D7
U 1 1 606ABCA2
P 3950 1700
F 0 "D7" H 3943 1445 50  0000 C CNN
F 1 "Power LED" H 3943 1536 50  0000 C CNN
F 2 "" H 3950 1700 50  0001 C CNN
F 3 "~" H 3950 1700 50  0001 C CNN
	1    3950 1700
	-1   0    0    1   
$EndComp
Wire Wire Line
	3500 1700 3800 1700
$Comp
L power:GND #PWR?
U 1 1 606E5306
P 2400 1250
F 0 "#PWR?" H 2400 1000 50  0001 C CNN
F 1 "GND" H 2405 1077 50  0000 C CNN
F 2 "" H 2400 1250 50  0001 C CNN
F 3 "" H 2400 1250 50  0001 C CNN
	1    2400 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 1100 3850 1250
Connection ~ 3850 1250
Wire Wire Line
	3850 1250 4600 1250
Text Notes 2650 1700 0    50   ~ 0
2Wago
Text Notes 2550 1050 0    50   ~ 0
3Wago
Text Notes 3900 1850 0    50   ~ 0
3Wago
Wire Notes Line
	1650 550  2600 550 
$Comp
L power:+VSW #PWR?
U 1 1 60792EE4
P 2400 800
F 0 "#PWR?" H 2400 650 50  0001 C CNN
F 1 "+VSW" H 2415 973 50  0000 C CNN
F 2 "" H 2400 800 50  0001 C CNN
F 3 "" H 2400 800 50  0001 C CNN
	1    2400 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 1700 3300 1700
Wire Wire Line
	2400 800  3000 800 
Wire Wire Line
	3400 800  4600 800 
Wire Wire Line
	4100 1700 4600 1700
Wire Wire Line
	4600 800  4600 1250
Wire Wire Line
	2400 1250 3850 1250
Wire Wire Line
	2400 1100 3050 1100
Wire Wire Line
	5950 4750 5950 3400
Connection ~ 5950 4750
Wire Wire Line
	5650 4750 5950 4750
Connection ~ 4950 3400
Wire Wire Line
	2950 6700 5950 6700
Wire Wire Line
	5950 3400 4950 3400
Wire Wire Line
	5950 6700 5950 4750
Wire Wire Line
	4750 3400 4950 3400
NoConn ~ 5550 6000
Wire Wire Line
	4000 5400 3100 5400
Wire Wire Line
	3100 4100 3100 5400
Connection ~ 3100 5400
Wire Wire Line
	3100 5400 3100 5500
NoConn ~ 4750 5700
NoConn ~ 4750 5600
Wire Wire Line
	4600 6250 4750 6250
Connection ~ 4600 6250
Wire Wire Line
	4600 6000 4600 6250
Wire Wire Line
	4300 6250 4600 6250
Wire Wire Line
	3150 6500 4750 6500
$Comp
L Connector:USB_A J16
U 1 1 607410B9
P 5450 5600
F 0 "J16" H 5220 5589 50  0000 R CNN
F 1 "USB_A" H 5220 5498 50  0000 R CNN
F 2 "" H 5600 5550 50  0001 C CNN
F 3 " ~" H 5600 5550 50  0001 C CNN
	1    5450 5600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4950 3400 4950 2950
Wire Wire Line
	2950 6250 3750 6250
Connection ~ 2950 6250
Wire Wire Line
	2950 6700 2950 6250
Text Notes 2650 6350 0    50   ~ 0
3Wago\nClip
Wire Wire Line
	2400 6250 2950 6250
Text Notes 2000 4100 0    50   ~ 0
3Wago
NoConn ~ 4750 3300
NoConn ~ 3950 3300
NoConn ~ 3550 3700
NoConn ~ 4450 3700
NoConn ~ 4350 3700
NoConn ~ 3650 3700
Wire Wire Line
	3950 3400 4000 3400
Wire Wire Line
	3000 4100 3100 4100
Connection ~ 3000 4100
Connection ~ 3350 3800
Wire Wire Line
	3000 3800 3000 4100
Wire Wire Line
	3350 3800 3000 3800
Wire Wire Line
	3350 3800 3350 3700
Wire Wire Line
	4150 3800 3350 3800
Wire Wire Line
	4150 3700 4150 3800
Wire Wire Line
	3000 4550 3000 5600
Wire Wire Line
	2400 5000 2600 5000
Wire Wire Line
	2400 4100 2600 4100
Wire Wire Line
	4300 5200 5650 5200
Wire Wire Line
	5650 4750 5650 5200
Connection ~ 5650 4750
Wire Wire Line
	4300 4750 5650 4750
Wire Wire Line
	5650 4300 5650 4750
Wire Wire Line
	4300 4300 5650 4300
Wire Wire Line
	4000 4300 3750 4300
Wire Wire Line
	4000 5200 3750 5200
Wire Wire Line
	3750 4750 4000 4750
Wire Wire Line
	3750 4550 4450 4550
Connection ~ 3750 4550
Wire Wire Line
	3550 4550 3750 4550
Connection ~ 3750 4100
Wire Wire Line
	3550 4100 3750 4100
Wire Wire Line
	4450 4100 3750 4100
Connection ~ 3750 5000
Wire Wire Line
	3750 5000 4450 5000
Wire Wire Line
	3550 5000 3750 5000
Connection ~ 2900 5000
Wire Wire Line
	2900 5000 3150 5000
Connection ~ 3000 4550
Wire Wire Line
	3000 4550 3150 4550
Connection ~ 3100 4100
Wire Wire Line
	3100 4100 3150 4100
Connection ~ 3750 6250
Wire Wire Line
	3150 6500 3150 5800
Wire Wire Line
	3100 5500 3150 5500
Wire Wire Line
	2900 4100 3000 4100
Wire Wire Line
	3000 5600 3150 5600
Wire Wire Line
	2900 4550 3000 4550
Wire Wire Line
	2900 5700 3150 5700
Wire Wire Line
	2900 5000 2900 5700
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 605D0AA5
P 4000 5600
F 0 "J4" V 3872 5680 50  0000 L CNN
F 1 "Voltmeter Power" V 3963 5680 50  0000 L CNN
F 2 "" H 4000 5600 50  0001 C CNN
F 3 "~" H 4000 5600 50  0001 C CNN
	1    4000 5600
	0    1    1    0   
$EndComp
Wire Wire Line
	3550 5650 3750 5650
Wire Wire Line
	3750 6250 3900 6250
Wire Wire Line
	3750 6050 3750 6250
Wire Notes Line
	3600 6450 4400 6450
Wire Notes Line
	3600 5550 3600 6450
Wire Notes Line
	4400 5550 3600 5550
Wire Notes Line
	4400 6450 4400 5550
$Comp
L Device:Amperemeter_DC MES2
U 1 1 605C4C2E
P 4100 6250
F 0 "MES2" V 4000 6050 50  0000 C CNN
F 1 "Amperemeter_DC" V 4250 6200 50  0000 C CNN
F 2 "" V 4100 6350 50  0001 C CNN
F 3 "~" V 4100 6350 50  0001 C CNN
	1    4100 6250
	0    1    1    0   
$EndComp
$Comp
L Device:Voltmeter_DC MES1
U 1 1 605C19A3
P 3750 5850
F 0 "MES1" H 3903 5896 50  0000 L CNN
F 1 "Voltmeter_DC" H 3903 5805 50  0000 L CNN
F 2 "" V 3750 5950 50  0001 C CNN
F 3 "~" V 3750 5950 50  0001 C CNN
	1    3750 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 605B881A
P 3750 5100
F 0 "R4" H 3809 5146 50  0000 L CNN
F 1 "680 1W?" H 3809 5055 50  0000 L CNN
F 2 "" H 3750 5100 50  0001 C CNN
F 3 "~" H 3750 5100 50  0001 C CNN
	1    3750 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 605B8206
P 3750 4650
F 0 "R3" H 3809 4696 50  0000 L CNN
F 1 "200?" H 3809 4605 50  0000 L CNN
F 2 "" H 3750 4650 50  0001 C CNN
F 3 "~" H 3750 4650 50  0001 C CNN
	1    3750 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R2
U 1 1 605B737B
P 3750 4200
F 0 "R2" H 3809 4246 50  0000 L CNN
F 1 "300?" H 3809 4155 50  0000 L CNN
F 2 "" H 3750 4200 50  0001 C CNN
F 3 "~" H 3750 4200 50  0001 C CNN
	1    3750 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D4
U 1 1 605AC090
P 4150 5200
F 0 "D4" H 4143 4945 50  0000 C CNN
F 1 "LED" H 4143 5036 50  0000 C CNN
F 2 "" H 4150 5200 50  0001 C CNN
F 3 "~" H 4150 5200 50  0001 C CNN
	1    4150 5200
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D3
U 1 1 605ABBD1
P 4150 4750
F 0 "D3" H 4143 4495 50  0000 C CNN
F 1 "LED" H 4143 4586 50  0000 C CNN
F 2 "" H 4150 4750 50  0001 C CNN
F 3 "~" H 4150 4750 50  0001 C CNN
	1    4150 4750
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D2
U 1 1 605AA0D0
P 4150 4300
F 0 "D2" H 4143 4045 50  0000 C CNN
F 1 "LED" H 4143 4136 50  0000 C CNN
F 2 "" H 4150 4300 50  0001 C CNN
F 3 "~" H 4150 4300 50  0001 C CNN
	1    4150 4300
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_SPST SW4
U 1 1 605743E5
P 3350 5000
F 0 "SW4" H 3350 5235 50  0000 C CNN
F 1 "12V Switch" H 3350 5144 50  0000 C CNN
F 2 "" H 3350 5000 50  0001 C CNN
F 3 "~" H 3350 5000 50  0001 C CNN
	1    3350 5000
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW3
U 1 1 60574005
P 3350 4550
F 0 "SW3" H 3350 4785 50  0000 C CNN
F 1 "3.3V Switch" H 3350 4694 50  0000 C CNN
F 2 "" H 3350 4550 50  0001 C CNN
F 3 "~" H 3350 4550 50  0001 C CNN
	1    3350 4550
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW2
U 1 1 60573171
P 3350 4100
F 0 "SW2" H 3350 4335 50  0000 C CNN
F 1 "5V Switch" H 3350 4244 50  0000 C CNN
F 2 "" H 3350 4100 50  0001 C CNN
F 3 "~" H 3350 4100 50  0001 C CNN
	1    3350 4100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J6
U 1 1 60571AC4
P 4650 4100
F 0 "J6" H 4678 4126 50  0000 L CNN
F 1 "5V Power Plug" H 4678 4035 50  0000 L CNN
F 2 "" H 4650 4100 50  0001 C CNN
F 3 "~" H 4650 4100 50  0001 C CNN
	1    4650 4100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J7
U 1 1 6057161B
P 4650 4550
F 0 "J7" H 4678 4576 50  0000 L CNN
F 1 "3.3V Power Plug" H 4678 4485 50  0000 L CNN
F 2 "" H 4650 4550 50  0001 C CNN
F 3 "~" H 4650 4550 50  0001 C CNN
	1    4650 4550
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J8
U 1 1 60571166
P 4650 5000
F 0 "J8" H 4678 5026 50  0000 L CNN
F 1 "12V Power Plug" H 4678 4935 50  0000 L CNN
F 2 "" H 4650 5000 50  0001 C CNN
F 3 "~" H 4650 5000 50  0001 C CNN
	1    4650 5000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J9
U 1 1 605701BD
P 4950 6250
F 0 "J9" H 4978 6276 50  0000 L CNN
F 1 "Metered Ground" H 4978 6185 50  0000 L CNN
F 2 "" H 4950 6250 50  0001 C CNN
F 3 "~" H 4950 6250 50  0001 C CNN
	1    4950 6250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J10
U 1 1 6056CD3B
P 4950 6500
F 0 "J10" H 4978 6526 50  0000 L CNN
F 1 "Voltmeter Plug" H 4978 6435 50  0000 L CNN
F 2 "" H 4950 6500 50  0001 C CNN
F 3 "~" H 4950 6500 50  0001 C CNN
	1    4950 6500
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0107
U 1 1 6055CE52
P 1800 4550
F 0 "#PWR0107" H 1800 4400 50  0001 C CNN
F 1 "+3.3V" H 1815 4723 50  0000 C CNN
F 2 "" H 1800 4550 50  0001 C CNN
F 3 "" H 1800 4550 50  0001 C CNN
	1    1800 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 6055DE5E
P 1800 4100
F 0 "#PWR0106" H 1800 3950 50  0001 C CNN
F 1 "+5V" H 1815 4273 50  0000 C CNN
F 2 "" H 1800 4100 50  0001 C CNN
F 3 "" H 1800 4100 50  0001 C CNN
	1    1800 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0105
U 1 1 6055E9E7
P 1800 5000
F 0 "#PWR0105" H 1800 4850 50  0001 C CNN
F 1 "+12V" H 1815 5173 50  0000 C CNN
F 2 "" H 1800 5000 50  0001 C CNN
F 3 "" H 1800 5000 50  0001 C CNN
	1    1800 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 60563361
P 2400 6250
F 0 "#PWR0102" H 2400 6000 50  0001 C CNN
F 1 "GND" H 2405 6077 50  0000 C CNN
F 2 "" H 2400 6250 50  0001 C CNN
F 3 "" H 2400 6250 50  0001 C CNN
	1    2400 6250
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SP4T SW5
U 1 1 60560CE5
P 3350 5650
F 0 "SW5" H 3350 5985 50  0000 C CNN
F 1 "Voltmeter Selector" H 3200 5850 50  0000 C CNN
F 2 "" H 3350 5650 50  0000 C CNN
F 3 "" H 3350 5650 50  0000 C CNN
	1    3350 5650
	-1   0    0    -1  
$EndComp
$Comp
L Device:Fuse F3
U 1 1 6055C2F1
P 2750 5000
F 0 "F3" V 2553 5000 50  0000 C CNN
F 1 "Fuse" V 2644 5000 50  0000 C CNN
F 2 "" V 2680 5000 50  0001 C CNN
F 3 "~" H 2750 5000 50  0001 C CNN
	1    2750 5000
	0    1    1    0   
$EndComp
$Comp
L Device:Fuse F2
U 1 1 6055BE1B
P 2750 4550
F 0 "F2" V 2553 4550 50  0000 C CNN
F 1 "Fuse" V 2644 4550 50  0000 C CNN
F 2 "" V 2680 4550 50  0001 C CNN
F 3 "~" H 2750 4550 50  0001 C CNN
	1    2750 4550
	0    1    1    0   
$EndComp
$Comp
L Device:Fuse F1
U 1 1 60559817
P 2750 4100
F 0 "F1" V 2553 4100 50  0000 C CNN
F 1 "Fuse" V 2644 4100 50  0000 C CNN
F 2 "" V 2680 4100 50  0001 C CNN
F 3 "~" H 2750 4100 50  0001 C CNN
	1    2750 4100
	0    1    1    0   
$EndComp
Wire Wire Line
	2400 6850 2400 6900
Wire Wire Line
	2400 6850 3200 6850
$Comp
L power:GND #PWR?
U 1 1 607023B5
P 2400 6900
F 0 "#PWR?" H 2400 6650 50  0001 C CNN
F 1 "GND" H 2405 6727 50  0000 C CNN
F 2 "" H 2400 6900 50  0001 C CNN
F 3 "" H 2400 6900 50  0001 C CNN
	1    2400 6900
	1    0    0    -1  
$EndComp
Text Notes 2650 6950 0    50   ~ 0
3Wago\nClip
Wire Notes Line
	2600 7700 1650 7700
Wire Wire Line
	3200 7000 3200 6850
Connection ~ 3200 7000
Wire Wire Line
	3300 7000 3200 7000
Connection ~ 3200 6850
Wire Wire Line
	3200 7250 3200 7000
Wire Wire Line
	3300 7250 3200 7250
Wire Wire Line
	4400 7000 4400 6850
Connection ~ 4400 7000
Wire Wire Line
	4450 7000 4400 7000
Wire Wire Line
	4400 6850 3200 6850
Wire Wire Line
	4400 7250 4400 7000
Wire Wire Line
	4450 7250 4400 7250
$Comp
L Connector:Conn_01x01_Female J2
U 1 1 6066C65A
P 3500 7250
F 0 "J2" H 3528 7276 50  0000 L CNN
F 1 "Ground Plug" H 3528 7185 50  0000 L CNN
F 2 "" H 3500 7250 50  0001 C CNN
F 3 "~" H 3500 7250 50  0001 C CNN
	1    3500 7250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J1
U 1 1 6066B65B
P 3500 7000
F 0 "J1" H 3528 7026 50  0000 L CNN
F 1 "Ground Plug" H 3528 6935 50  0000 L CNN
F 2 "" H 3500 7000 50  0001 C CNN
F 3 "~" H 3500 7000 50  0001 C CNN
	1    3500 7000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J11
U 1 1 6066ABAF
P 4650 7000
F 0 "J11" H 4678 7026 50  0000 L CNN
F 1 "Ground Plug" H 4678 6935 50  0000 L CNN
F 2 "" H 4650 7000 50  0001 C CNN
F 3 "~" H 4650 7000 50  0001 C CNN
	1    4650 7000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J12
U 1 1 6066152C
P 4650 7250
F 0 "J12" H 4678 7276 50  0000 L CNN
F 1 "Ground Plug" H 4678 7185 50  0000 L CNN
F 2 "" H 4650 7250 50  0001 C CNN
F 3 "~" H 4650 7250 50  0001 C CNN
	1    4650 7250
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0101
U 1 1 60563D0F
P 2400 7500
F 0 "#PWR0101" H 2400 7250 50  0001 C CNN
F 1 "Earth" H 2400 7350 50  0001 C CNN
F 2 "" H 2400 7500 50  0001 C CNN
F 3 "~" H 2400 7500 50  0001 C CNN
	1    2400 7500
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J15
U 1 1 605BFF1B
P 4650 7500
F 0 "J15" H 4678 7526 50  0000 L CNN
F 1 "Earth Ground Plug" H 4678 7435 50  0000 L CNN
F 2 "" H 4650 7500 50  0001 C CNN
F 3 "~" H 4650 7500 50  0001 C CNN
	1    4650 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 7500 4450 7500
Text Notes 2350 7450 0    50   ~ 0
2Wago
Wire Wire Line
	5650 2750 5650 2250
Wire Notes Line
	1950 5200 2300 5200
Wire Notes Line
	2300 5200 2300 4000
Wire Notes Line
	2300 4000 1950 4000
Wire Notes Line
	1950 4000 1950 5200
Wire Wire Line
	1800 4100 1900 4100
Wire Wire Line
	1900 4100 1900 4250
Wire Wire Line
	1900 4250 2400 4250
Wire Wire Line
	2400 4250 2400 4100
Wire Wire Line
	1800 4550 2600 4550
Wire Wire Line
	2400 5000 2400 4850
Wire Wire Line
	2400 4850 1900 4850
Wire Wire Line
	1900 4850 1900 5000
Wire Wire Line
	1900 5000 1800 5000
$Comp
L Device:Fuse F4
U 1 1 6055C639
P 2750 2050
F 0 "F4" V 2553 2050 50  0000 C CNN
F 1 "Fuse" V 2644 2050 50  0000 C CNN
F 2 "" V 2680 2050 50  0001 C CNN
F 3 "~" H 2750 2050 50  0001 C CNN
	1    2750 2050
	0    1    1    0   
$EndComp
$Comp
L Device:Fuse F5
U 1 1 6055C9B4
P 2750 2550
F 0 "F5" V 2553 2550 50  0000 C CNN
F 1 "Fuse" V 2644 2550 50  0000 C CNN
F 2 "" V 2680 2550 50  0001 C CNN
F 3 "~" H 2750 2550 50  0001 C CNN
	1    2750 2550
	0    1    1    0   
$EndComp
$Comp
L power:-12V #PWR0103
U 1 1 6055FCAB
P 1800 2550
F 0 "#PWR0103" H 1800 2650 50  0001 C CNN
F 1 "-12V" H 1815 2723 50  0000 C CNN
F 2 "" H 1800 2550 50  0001 C CNN
F 3 "" H 1800 2550 50  0001 C CNN
	1    1800 2550
	1    0    0    -1  
$EndComp
$Comp
L power:-5V #PWR0104
U 1 1 6055F147
P 1800 2050
F 0 "#PWR0104" H 1800 2150 50  0001 C CNN
F 1 "-5V" H 1815 2223 50  0000 C CNN
F 2 "" H 1800 2050 50  0001 C CNN
F 3 "" H 1800 2050 50  0001 C CNN
	1    1800 2050
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J14
U 1 1 605705A7
P 4650 2550
F 0 "J14" H 4678 2576 50  0000 L CNN
F 1 "-12V Power Plug" H 4678 2485 50  0000 L CNN
F 2 "" H 4650 2550 50  0001 C CNN
F 3 "~" H 4650 2550 50  0001 C CNN
	1    4650 2550
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J13
U 1 1 60570CBD
P 4650 2050
F 0 "J13" H 4678 2076 50  0000 L CNN
F 1 "-5V Power Plug" H 4678 1985 50  0000 L CNN
F 2 "" H 4650 2050 50  0001 C CNN
F 3 "~" H 4650 2050 50  0001 C CNN
	1    4650 2050
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW6
U 1 1 60574784
P 3350 2050
F 0 "SW6" H 3350 2285 50  0000 C CNN
F 1 "-5V Switch" H 3350 2194 50  0000 C CNN
F 2 "" H 3350 2050 50  0001 C CNN
F 3 "~" H 3350 2050 50  0001 C CNN
	1    3350 2050
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW7
U 1 1 60574BC3
P 3350 2550
F 0 "SW7" H 3350 2785 50  0000 C CNN
F 1 "-12V Switch" H 3350 2694 50  0000 C CNN
F 2 "" H 3350 2550 50  0001 C CNN
F 3 "~" H 3350 2550 50  0001 C CNN
	1    3350 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D5
U 1 1 605AC642
P 4150 2250
F 0 "D5" H 4143 2467 50  0000 C CNN
F 1 "LED" H 4143 2376 50  0000 C CNN
F 2 "" H 4150 2250 50  0001 C CNN
F 3 "~" H 4150 2250 50  0001 C CNN
	1    4150 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R5
U 1 1 605B8D50
P 3750 2150
F 0 "R5" H 3809 2196 50  0000 L CNN
F 1 "R_Small" H 3809 2105 50  0000 L CNN
F 2 "" H 3750 2150 50  0001 C CNN
F 3 "~" H 3750 2150 50  0001 C CNN
	1    3750 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R6
U 1 1 605B91D3
P 3750 2650
F 0 "R6" H 3809 2696 50  0000 L CNN
F 1 "R_Small" H 3809 2605 50  0000 L CNN
F 2 "" H 3750 2650 50  0001 C CNN
F 3 "~" H 3750 2650 50  0001 C CNN
	1    3750 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2050 3750 2050
Connection ~ 3750 2050
Wire Wire Line
	3750 2050 3550 2050
Wire Wire Line
	4450 2550 3750 2550
Connection ~ 3750 2550
Wire Wire Line
	3750 2550 3550 2550
Wire Wire Line
	3150 2550 2900 2550
Wire Wire Line
	2600 2550 2400 2550
Wire Wire Line
	3150 2050 2900 2050
Wire Wire Line
	2600 2050 2400 2050
Wire Wire Line
	4000 2250 3750 2250
Wire Wire Line
	4300 2250 5650 2250
Text Notes 2050 2100 0    50   ~ 0
2Wago
Wire Notes Line
	2600 550  2600 7700
Wire Notes Line
	2000 2000 2350 2000
Wire Notes Line
	2350 2000 2350 2400
Wire Notes Line
	2350 2400 2000 2400
Wire Notes Line
	2000 2000 2000 2400
Wire Wire Line
	2400 2050 2400 2150
Wire Wire Line
	2400 2150 1950 2150
Wire Wire Line
	1950 2150 1950 2050
Wire Wire Line
	2400 2550 2400 2250
Wire Wire Line
	2400 2250 1950 2250
Wire Wire Line
	1950 2250 1950 2550
Wire Wire Line
	1800 2050 1950 2050
Wire Wire Line
	1800 2550 1950 2550
Wire Notes Line
	1650 550  1650 7700
Wire Wire Line
	4300 2750 5650 2750
Wire Wire Line
	3750 2750 4000 2750
$Comp
L Device:LED D6
U 1 1 605ACD44
P 4150 2750
F 0 "D6" H 4143 2967 50  0000 C CNN
F 1 "LED" H 4143 2876 50  0000 C CNN
F 2 "" H 4150 2750 50  0001 C CNN
F 3 "~" H 4150 2750 50  0001 C CNN
	1    4150 2750
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_A J5
U 1 1 6063670A
P 4350 3400
F 0 "J5" V 3983 3343 50  0000 C CNN
F 1 "USB_A" V 4074 3343 50  0000 C CNN
F 2 "" H 4500 3350 50  0001 C CNN
F 3 " ~" H 4500 3350 50  0001 C CNN
	1    4350 3400
	0    -1   1    0   
$EndComp
$Comp
L Connector:USB_A J3
U 1 1 6063B40F
P 3550 3400
F 0 "J3" V 3183 3343 50  0000 C CNN
F 1 "USB_A" V 3274 3343 50  0000 C CNN
F 2 "" H 3700 3350 50  0001 C CNN
F 3 " ~" H 3700 3350 50  0001 C CNN
	1    3550 3400
	0    -1   1    0   
$EndComp
Wire Wire Line
	4000 3400 4000 2950
Wire Wire Line
	4950 2950 4000 2950
$Comp
L power:GND #PWR?
U 1 1 606842A1
P 2400 2850
F 0 "#PWR?" H 2400 2600 50  0001 C CNN
F 1 "GND" H 2405 2677 50  0000 C CNN
F 2 "" H 2400 2850 50  0001 C CNN
F 3 "" H 2400 2850 50  0001 C CNN
	1    2400 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 2850 5650 2850
Wire Wire Line
	5650 2850 5650 2750
Connection ~ 5650 2750
Wire Wire Line
	4600 6000 5450 6000
Wire Wire Line
	5150 5400 4000 5400
Connection ~ 4000 5400
$EndSCHEMATC
