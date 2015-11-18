Feature: List Students
	Scenario Outline: List all possible times a class can be moved to
		Given the course and upper bounds "<course>" "<seniors>" "<others>"
		When the program is run
		Then the possible time slots should be "<output>"
		Examples:
		|course		|seniors|others	|output|
		|CS374.1	|3		|2		|800-850 MWF 1200-1250 MWF endl|