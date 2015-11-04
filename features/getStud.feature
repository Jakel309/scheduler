<<<<<<< HEAD
Feature: List Students
	Scenario Outline: List all students in a course given course number and section
		Given the input "<course>"
		When the program is run
		Then the output should be "<output>"
		Examples:
		|course		|output|
=======
Feature: List Students
	Scenario Outline: List all students in a course given course number and section
		Given the input "<course>"
		When the program is run
		Then the output should be "<output>"
		Examples:
		|course		|output|
>>>>>>> 7827a4af786e6a8ce8e303d5a54363774bf33afa
		|ART213.1	|Judy Addison 000360801\nDonald Barmore 000881951\nMichele Chapin 000031624\nHenry Franks 000742767\nJohn Lozon 000165817\nChristoper Martin 000470296\nKenny Nolte 000373791\nDennis Pare 000191822\nDonnie Ross 000885148\nRichard Smith 000970118\nPatricia Weeden 000083204\nWilliam Yardley 000672857\n|