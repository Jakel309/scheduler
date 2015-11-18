Feature: List Students
	Scenario Outline: List all students in a course given course number and section
		Given the input "<course>" "<days>" "<time>"
		When the user checks for conflicts
		Then the resultant conflicts should be "<output>"
		Examples:
		|course		|days	|time	|output|
		|ART213.1	|MWF	|900-950|0 out of 0 have schedule conflicts and here are the students with the conflicts\n|