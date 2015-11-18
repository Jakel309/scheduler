Feature: List Students
	Scenario Outline: List all students in a course given course number and section
		Given the professor course "<course>" "<days>" "<time>"
		When the user checks for prfessor conflicts
		Then the resultant professor conflicts should be "<output>"
		Examples:
		|course		|days	|time	|output|
		|CS374.1	|MWF	|1300-1350| Professor is unavailable because of IT220.01 Intro to Databases & DBMS|