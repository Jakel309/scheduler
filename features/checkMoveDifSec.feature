Feature: List Students
	Scenario Outline: Distinguishes between different sections
		Given the input "<course>" "<days>" "<time>"
		When the user checks for conflicts
		Then the resultant conflicts should be "<output>"
		Examples:
		|course		|days	|time	|output|
		|BIOL101.1	|MWF	|1200-1250| Sydney Payne 000339601 sydneypayne@acu.edu SO MATH123.T1 Elementary Statistics Alfred Dunn 000661693 alfreddunn@acu.edu SO JMC201.L1 Introduction to Visual Media Mary Reid 000824623 maryreid@acu.edu SO ENGL112.04 Composition and Literature Seth Robinson 000986641 sethrobinson@acu.edu SO MATH130.02 Finite Math for Applications Nina Wade 000301133 ninawade@acu.edu JR JMC201.L2 Introduction to Visual Media endl|
		|BIOL101.2	|MWF	|1200-1250|	John Anderson 000269101 johnanderson@acu.edu FR BIBL101.T16 Jesus: His Life and Teachings Albert Hanlon 000776393 alberthanlon@acu.edu FR ENGL112.04 Composition and Literature Teresa Hefty 000928825 teresahefty@acu.edu FR ENGL3.02 Academic Literacies endl|