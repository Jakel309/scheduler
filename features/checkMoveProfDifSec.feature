Feature: List Students
	Scenario Outline: Distinguishes professors from different sections
		Given the professor course "<course>" "<days>" "<time>"
		When the user checks for prfessor conflicts
		Then the resultant professor conflicts should be "<output>"
		Examples:
		|course		|days	|time	|output|
		|BIOL101.1	|MWF	|800-850| Professor is available at this time|
		|BIOL101.2	|MWF	|800-850| Professor is unavailable because of BIOL355.01 Microbiology|