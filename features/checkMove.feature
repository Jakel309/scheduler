Feature: List Students
	Scenario Outline: List all students in a course given course number and section
		Given the input "<course>" "<days>" "<time>"
		When the user checks for conflicts
		Then the resultant conflicts should be "<output>"
		Examples:
		|course		|days	|time	|output|
		|CS374.1	|MWF	|900-950| Lola Pucci 000111564 lolapucci@acu.edu JR CS332.01 Design & Analysis of Algorithm Joe Allery 000567980 joeallery@acu.edu SR CS332.01 Design & Analysis of Algorithm Connie Cook 000750781 conniecook@acu.edu SR CS332.01 Design & Analysis of Algorithm Rhonda Vanhook 000986049 rhondavanhook@acu.edu JR CS332.01 Design & Analysis of Algorithm endl|