Feature: List Students
	Scenario Outline: Distuinguishes between different sections
		Given the course and upper bounds "<course>" "<seniors>" "<others>"
		When the program is run
		Then the possible time slots should be "<output>"
		Examples:
		|course		|seniors|others	|output|
		|BIOL101.1	|3		|20		|800-850 MWF 800-920 TR 1200-1250 MWF 1400-1450 MWF 1500-1550 MWF 1500-1620 TR 1530-1650 TR 1600-1720 TR endl|
		|BIOL101.2	|3		|20		|800-920 TR 1500-1550 MWF 1500-1620 TR 1530-1650 TR 1600-1720 TR endl|