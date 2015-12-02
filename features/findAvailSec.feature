Feature: List Students
	Scenario Outline: List all possible times a class can be moved to regardless of sec number size
		Given the course and upper bounds "<course>" "<seniors>" "<others>"
		When the program is run
		Then the possible time slots should be "<output>"
		Examples:
		|course		|seniors|others	|output|
		|CS374.1	|3		|2		|800-850 MWF 800-920 TR 900-950 MWF 930-1050 TR 1000-1050 MWF 1200-1250 MWF 1200-1320 TR 1300-1420 TR 1330-1450 TR 1500-1550 MWF 1500-1620 TR 1530-1650 TR 1600-1720 TR endl|
		|CS374.01	|3		|2		|800-850 MWF 800-920 TR 900-950 MWF 930-1050 TR 1000-1050 MWF 1200-1250 MWF 1200-1320 TR 1300-1420 TR 1330-1450 TR 1500-1550 MWF 1500-1620 TR 1530-1650 TR 1600-1720 TR endl|