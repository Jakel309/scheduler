Feature: List Students
	Scenario Outline: Checks whether the professor can teach at a certain time
		Given the professor course "<course>" "<days>" "<time>"
		When the user checks for prfessor conflicts
		Then the resultant professor conflicts should be "<output>"
		Examples:
		|course		|days	|time	|output|
		|CS374.1	|MWF	|1300-1350| Professor is unavailable because of IT220.01 Intro to Databases & DBMS|
		|CS374.1	|MWF	|900-950| Professor is available at this time|