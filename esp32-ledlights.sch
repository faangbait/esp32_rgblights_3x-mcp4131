EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:ESP32-footprints-Shem-Lib
LIBS:mcp4131
LIBS:esp32-ledlights-cache
EELAYER 25 0
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
L Screw_Terminal_01x08 J1
U 1 1 5AF7F4CD
P 900 1100
F 0 "J1" H 900 1500 50  0000 C CNN
F 1 "Screw_Terminal_01x08" H 900 600 50  0000 C CNN
F 2 "TerminalBlocks_Phoenix:TerminalBlock_Phoenix_PT-3.5mm_8pol" H 900 1100 50  0001 C CNN
F 3 "" H 900 1100 50  0001 C CNN
	1    900  1100
	-1   0    0    1   
$EndComp
Text GLabel 1600 900  2    60   Output ~ 0
TX
Text GLabel 1600 1100 2    60   Output ~ 0
RX
Text GLabel 1350 1500 3    60   Output ~ 0
BLUE
Text GLabel 1250 1500 3    60   Output ~ 0
GREEN
Text GLabel 1150 1500 3    60   Output ~ 0
RED
$Comp
L GND #GND01
U 1 1 5AF7F788
P 1450 700
F 0 "#GND01" H 1450 450 50  0001 C CNN
F 1 "GND" H 1450 550 50  0000 C CNN
F 2 "" H 1450 700 50  0001 C CNN
F 3 "" H 1450 700 50  0001 C CNN
	1    1450 700 
	0    -1   -1   0   
$EndComp
$Comp
L ESP32-WROOM U1
U 1 1 5AF7F7ED
P 3750 2300
F 0 "U1" H 3050 3550 60  0000 C CNN
F 1 "ESP32-WROOM" H 4250 3550 60  0000 C CNN
F 2 "ESP32-footprints-Lib:ESP32-WROOM" H 4100 3650 60  0001 C CNN
F 3 "" H 3300 2750 60  0001 C CNN
	1    3750 2300
	1    0    0    -1  
$EndComp
$Comp
L GND #GND02
U 1 1 5AF7FD09
P 1300 3800
F 0 "#GND02" H 1300 3550 50  0001 C CNN
F 1 "GND" H 1300 3650 50  0000 C CNN
F 2 "" H 1300 3800 50  0001 C CNN
F 3 "" H 1300 3800 50  0001 C CNN
	1    1300 3800
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #3.3V03
U 1 1 5AF80030
P 1600 3500
F 0 "#3.3V03" H 1600 3350 50  0001 C CNN
F 1 "+3.3V" H 1600 3640 50  0000 C CNN
F 2 "" H 1600 3500 50  0001 C CNN
F 3 "" H 1600 3500 50  0001 C CNN
	1    1600 3500
	-1   0    0    1   
$EndComp
$Comp
L +3.3V #3.3V04
U 1 1 5AF800F1
P 2800 1700
F 0 "#3.3V04" H 2800 1550 50  0001 C CNN
F 1 "+3.3V" H 2800 1840 50  0000 C CNN
F 2 "" H 2800 1700 50  0001 C CNN
F 3 "" H 2800 1700 50  0001 C CNN
	1    2800 1700
	1    0    0    -1  
$EndComp
$Comp
L R R10K1
U 1 1 5AF80274
P 2250 1800
F 0 "R10K1" V 2330 1800 50  0000 C CNN
F 1 "R10K" V 2250 1800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2180 1800 50  0001 C CNN
F 3 "" H 2250 1800 50  0001 C CNN
	1    2250 1800
	0    1    1    0   
$EndComp
$Comp
L GND #GND05
U 1 1 5AF8047A
P 2450 2600
F 0 "#GND05" H 2450 2350 50  0001 C CNN
F 1 "GND" H 2450 2450 50  0000 C CNN
F 2 "" H 2450 2600 50  0001 C CNN
F 3 "" H 2450 2600 50  0001 C CNN
	1    2450 2600
	1    0    0    -1  
$EndComp
Text GLabel 3800 3750 3    60   Output ~ 0
CLK
Text GLabel 4000 3350 3    60   Output ~ 0
MOSI
Text GLabel 4650 1750 2    60   Input ~ 0
TX
Text GLabel 4650 1850 2    60   Input ~ 0
RX
Text GLabel 4650 2450 2    60   Output ~ 0
CS1
Text GLabel 4650 2250 2    60   Output ~ 0
CS2
Text GLabel 4650 2150 2    60   Output ~ 0
CS3
$Comp
L MCP4131 IC1
U 1 1 5AF81A6E
P 6750 1050
F 0 "IC1" H 6750 1350 60  0000 C CNN
F 1 "MCP4131" V 6750 1050 60  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm" H 6750 1050 60  0001 C CNN
F 3 "" H 6750 1050 60  0001 C CNN
	1    6750 1050
	1    0    0    -1  
$EndComp
$Comp
L MCP4131 IC2
U 1 1 5AF81A8F
P 6750 2250
F 0 "IC2" H 6750 2550 60  0000 C CNN
F 1 "MCP4131" V 6750 2250 60  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm" H 6750 2250 60  0001 C CNN
F 3 "" H 6750 2250 60  0001 C CNN
	1    6750 2250
	1    0    0    -1  
$EndComp
$Comp
L MCP4131 IC3
U 1 1 5AF81AD6
P 6750 3450
F 0 "IC3" H 6750 3750 60  0000 C CNN
F 1 "MCP4131" V 6750 3450 60  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm" H 6750 3450 60  0001 C CNN
F 3 "" H 6750 3450 60  0001 C CNN
	1    6750 3450
	1    0    0    -1  
$EndComp
Text GLabel 7250 3500 2    60   Output ~ 0
BLUE
Text GLabel 7250 2300 2    60   Output ~ 0
GREEN
Text GLabel 7250 1100 2    60   Output ~ 0
RED
Text GLabel 6250 900  0    60   Input ~ 0
CS1
Text GLabel 6250 2100 0    60   Input ~ 0
CS2
Text GLabel 6250 3300 0    60   Input ~ 0
CS3
Text GLabel 5900 3400 0    60   Input ~ 0
CLK
Text GLabel 6250 2200 0    60   Input ~ 0
CLK
Text GLabel 6250 1000 0    60   Input ~ 0
CLK
Text GLabel 6250 1100 0    60   Input ~ 0
MOSI
Text GLabel 6250 2300 0    60   Input ~ 0
MOSI
Text GLabel 6250 3500 0    60   Input ~ 0
MOSI
$Comp
L GND #PWR06
U 1 1 5AF8238E
P 6250 3600
F 0 "#PWR06" H 6250 3350 50  0001 C CNN
F 1 "GND" H 6250 3450 50  0000 C CNN
F 2 "" H 6250 3600 50  0001 C CNN
F 3 "" H 6250 3600 50  0001 C CNN
	1    6250 3600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 5AF823B2
P 6250 2400
F 0 "#PWR07" H 6250 2150 50  0001 C CNN
F 1 "GND" H 6250 2250 50  0000 C CNN
F 2 "" H 6250 2400 50  0001 C CNN
F 3 "" H 6250 2400 50  0001 C CNN
	1    6250 2400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 5AF823F5
P 6250 1200
F 0 "#PWR08" H 6250 950 50  0001 C CNN
F 1 "GND" H 6250 1050 50  0000 C CNN
F 2 "" H 6250 1200 50  0001 C CNN
F 3 "" H 6250 1200 50  0001 C CNN
	1    6250 1200
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR09
U 1 1 5AF82419
P 7250 800
F 0 "#PWR09" H 7250 650 50  0001 C CNN
F 1 "+5V" H 7250 940 50  0000 C CNN
F 2 "" H 7250 800 50  0001 C CNN
F 3 "" H 7250 800 50  0001 C CNN
	1    7250 800 
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR010
U 1 1 5AF82461
P 7250 3300
F 0 "#PWR010" H 7250 3150 50  0001 C CNN
F 1 "+5V" H 7250 3440 50  0000 C CNN
F 2 "" H 7250 3300 50  0001 C CNN
F 3 "" H 7250 3300 50  0001 C CNN
	1    7250 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 5AF8253A
P 7400 1000
F 0 "#PWR011" H 7400 750 50  0001 C CNN
F 1 "GND" H 7400 850 50  0000 C CNN
F 2 "" H 7400 1000 50  0001 C CNN
F 3 "" H 7400 1000 50  0001 C CNN
	1    7400 1000
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR012
U 1 1 5AF8255E
P 7400 2200
F 0 "#PWR012" H 7400 1950 50  0001 C CNN
F 1 "GND" H 7400 2050 50  0000 C CNN
F 2 "" H 7400 2200 50  0001 C CNN
F 3 "" H 7400 2200 50  0001 C CNN
	1    7400 2200
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR013
U 1 1 5AF82582
P 7400 3400
F 0 "#PWR013" H 7400 3150 50  0001 C CNN
F 1 "GND" H 7400 3250 50  0000 C CNN
F 2 "" H 7400 3400 50  0001 C CNN
F 3 "" H 7400 3400 50  0001 C CNN
	1    7400 3400
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR014
U 1 1 5AF83022
P 7250 1200
F 0 "#PWR014" H 7250 1050 50  0001 C CNN
F 1 "+5V" H 7250 1340 50  0000 C CNN
F 2 "" H 7250 1200 50  0001 C CNN
F 3 "" H 7250 1200 50  0001 C CNN
	1    7250 1200
	-1   0    0    1   
$EndComp
$Comp
L R R10K2
U 1 1 5AF83CB7
P 5350 3150
F 0 "R10K2" V 5430 3150 50  0000 C CNN
F 1 "R10K" V 5350 3150 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5280 3150 50  0001 C CNN
F 3 "" H 5350 3150 50  0001 C CNN
	1    5350 3150
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR015
U 1 1 5AF853C2
P 1100 800
F 0 "#PWR015" H 1100 650 50  0001 C CNN
F 1 "+5V" H 1100 940 50  0000 C CNN
F 2 "" H 1100 800 50  0001 C CNN
F 3 "" H 1100 800 50  0001 C CNN
	1    1100 800 
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR016
U 1 1 5AF86318
P 7400 3750
F 0 "#PWR016" H 7400 3600 50  0001 C CNN
F 1 "+5V" H 7400 3890 50  0000 C CNN
F 2 "" H 7400 3750 50  0001 C CNN
F 3 "" H 7400 3750 50  0001 C CNN
	1    7400 3750
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR017
U 1 1 5AF869DB
P 7250 1900
F 0 "#PWR017" H 7250 1750 50  0001 C CNN
F 1 "+5V" H 7250 2040 50  0000 C CNN
F 2 "" H 7250 1900 50  0001 C CNN
F 3 "" H 7250 1900 50  0001 C CNN
	1    7250 1900
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR018
U 1 1 5AF879D5
P 1000 3500
F 0 "#PWR018" H 1000 3350 50  0001 C CNN
F 1 "+5V" H 1000 3640 50  0000 C CNN
F 2 "" H 1000 3500 50  0001 C CNN
F 3 "" H 1000 3500 50  0001 C CNN
	1    1000 3500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR019
U 1 1 5AF87BF4
P 7450 2600
F 0 "#PWR019" H 7450 2450 50  0001 C CNN
F 1 "+5V" H 7450 2740 50  0000 C CNN
F 2 "" H 7450 2600 50  0001 C CNN
F 3 "" H 7450 2600 50  0001 C CNN
	1    7450 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 700  1450 700 
Wire Wire Line
	1100 1100 1450 1100
Connection ~ 1450 1100
Wire Wire Line
	1100 900  1600 900 
Wire Wire Line
	1100 1000 1550 1000
Wire Wire Line
	1550 1000 1550 1100
Wire Wire Line
	1550 1100 1600 1100
Wire Wire Line
	1100 1200 1350 1200
Wire Wire Line
	1350 1200 1350 1500
Wire Wire Line
	1100 1300 1250 1300
Wire Wire Line
	1250 1300 1250 1500
Wire Wire Line
	1100 1400 1150 1400
Wire Wire Line
	1150 1400 1150 1500
Wire Wire Line
	1450 1100 1450 700 
Wire Wire Line
	2100 1700 2800 1700
Wire Wire Line
	2100 1700 2100 1800
Wire Wire Line
	7250 3400 7400 3400
Wire Wire Line
	7250 2200 7400 2200
Wire Wire Line
	7250 1000 7400 1000
Wire Wire Line
	2700 1700 2700 3650
Wire Wire Line
	2700 3650 5350 3650
Connection ~ 2700 1700
Wire Wire Line
	5350 3650 5350 3300
Wire Wire Line
	5450 1750 5050 2200
Wire Wire Line
	5050 2200 5050 2750
Wire Wire Line
	5050 2750 4650 2750
Wire Wire Line
	4900 2750 4900 3000
Wire Wire Line
	4900 3000 5350 3000
Connection ~ 4900 2750
Wire Wire Line
	5350 2950 5450 2150
Wire Wire Line
	7250 3600 7250 3750
Wire Wire Line
	7250 3750 7400 3750
Wire Wire Line
	7250 2100 7250 1900
Wire Wire Line
	5900 3400 6250 3400
Wire Wire Line
	3800 3350 3800 3750
Wire Wire Line
	7250 2400 7250 2600
Wire Wire Line
	7250 2600 7450 2600
Connection ~ 2800 2000
Connection ~ 2800 2100
Connection ~ 2800 2200
Connection ~ 2800 2300
Connection ~ 2800 2400
Connection ~ 2800 2500
Connection ~ 2800 2600
Connection ~ 2800 2700
Connection ~ 2800 2800
Connection ~ 2800 2900
Connection ~ 2800 3000
Wire Wire Line
	7250 800  7250 900 
Wire Wire Line
	5350 2950 5650 2950
Wire Wire Line
	5650 2950 5650 3050
$Comp
L GND #PWR020
U 1 1 5AF8925F
P 5650 3050
F 0 "#PWR020" H 5650 2800 50  0001 C CNN
F 1 "GND" H 5650 2900 50  0000 C CNN
F 2 "" H 5650 3050 50  0001 C CNN
F 3 "" H 5650 3050 50  0001 C CNN
	1    5650 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 3000 2800 3150
$Comp
L GND #PWR021
U 1 1 5AF895AB
P 2800 3150
F 0 "#PWR021" H 2800 2900 50  0001 C CNN
F 1 "GND" H 2800 3000 50  0000 C CNN
F 2 "" H 2800 3150 50  0001 C CNN
F 3 "" H 2800 3150 50  0001 C CNN
	1    2800 3150
	1    0    0    -1  
$EndComp
$Comp
L SW_Push SW1
U 1 1 5AF89CCF
P 2150 2250
F 0 "SW1" H 2200 2350 50  0000 L CNN
F 1 "SW_Push" H 2150 2190 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_TH_Tactile_Omron_B3F-10xx" H 2150 2450 50  0001 C CNN
F 3 "" H 2150 2450 50  0001 C CNN
	1    2150 2250
	0    1    1    0   
$EndComp
$Comp
L SW_Push SW2
U 1 1 5AF89D35
P 5450 1950
F 0 "SW2" H 5500 2050 50  0000 L CNN
F 1 "SW_Push" H 5450 1890 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_TH_Tactile_Omron_B3F-10xx" H 5450 2150 50  0001 C CNN
F 3 "" H 5450 2150 50  0001 C CNN
	1    5450 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	2800 1800 2400 1800
Wire Wire Line
	2150 2050 2500 2050
Wire Wire Line
	2500 2050 2500 1800
Connection ~ 2500 1800
Wire Wire Line
	2150 2450 2150 2550
Wire Wire Line
	2150 2550 2450 2550
Wire Wire Line
	2450 2550 2450 2600
$Comp
L AZ1117-3.3 U2
U 1 1 5AF8A600
P 1300 3500
F 0 "U2" H 1150 3625 50  0000 C CNN
F 1 "AZ1117-3.3" H 1300 3625 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-223" H 1300 3750 50  0001 C CIN
F 3 "" H 1300 3500 50  0001 C CNN
	1    1300 3500
	1    0    0    -1  
$EndComp
$EndSCHEMATC
