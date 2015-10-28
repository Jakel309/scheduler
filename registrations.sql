drop table if exists registrations;
CREATE TABLE registrations (
	`Pidm` INTEGER NOT NULL, 
	`Term Code` INTEGER NOT NULL, 
	`Part of Term Code` INTEGER NOT NULL, 
	`Part of Term Desc` VARCHAR(9) NOT NULL, 
	`Enrolled Ind` BOOL NOT NULL, 
	`Registered Ind` BOOL NOT NULL, 
	`FIELD7` VARCHAR(32), 
	`Student Status Code` VARCHAR(2) NOT NULL, 
	`Student Status Desc` VARCHAR(6) NOT NULL, 
	`Level Code` VARCHAR(2) NOT NULL, 
	`Level Desc` VARCHAR(13) NOT NULL, 
	`Student Type Code` VARCHAR(1) NOT NULL, 
	`Student Type Desc` VARCHAR(10) NOT NULL, 
	`Program Code1` VARCHAR(7) NOT NULL, 
	`Program Code2` VARCHAR(32), 
	`Campus Code` TIME NOT NULL, 
	`Campus Desc` VARCHAR(28) NOT NULL, 
	`Department Code` VARCHAR(3) NOT NULL, 
	`Department Desc` VARCHAR(30) NOT NULL, 
	`Degree Code1` VARCHAR(2) NOT NULL, 
	`Degree Desc1` VARCHAR(19) NOT NULL, 
	`College Code1` VARCHAR(2) NOT NULL, 
	`College Desc1` VARCHAR(28) NOT NULL, 
	`Major Code1` VARCHAR(4) NOT NULL, 
	`Major Desc1` VARCHAR(14) NOT NULL, 
	`Major Code1 2` VARCHAR(32), 
	`Major Desc1 2` VARCHAR(32), 
	`Degree Code2` VARCHAR(32), 
	`Degree Desc2` VARCHAR(32), 
	`College Code2` VARCHAR(32), 
	`College Desc2` VARCHAR(32), 
	`Major Code2` VARCHAR(32), 
	`Major Desc2` VARCHAR(32), 
	`Class Code` VARCHAR(2) NOT NULL, 
	`Class Desc` VARCHAR(6) NOT NULL, 
	`CRN` INTEGER NOT NULL, 
	`Reg STS Code` VARCHAR(2) NOT NULL, 
	`Reg STS Desc` VARCHAR(14) NOT NULL, 
	`Spec Approval Ind` VARCHAR(32), 
	`Reg Error Flag` VARCHAR(32), 
	`Subject Code` VARCHAR(4) NOT NULL, 
	`Subject Desc` VARCHAR(14) NOT NULL, 
	`Course Number` INTEGER NOT NULL, 
	`Section Number` VARCHAR(4) NOT NULL, 
	`Course Title` VARCHAR(21) NOT NULL, 
	`Course Level Code` VARCHAR(2) NOT NULL, 
	`Course Campus Code` TIME NOT NULL, 
	`Billing Hours` INTEGER NOT NULL, 
	`Credit Hours` INTEGER NOT NULL, 
	`Instructor ID` INTEGER NOT NULL, 
	`Instructor Name` VARCHAR(13) NOT NULL, 
	`Hours Attended` VARCHAR(32), 
	`Grade Mode Code` BOOL NOT NULL, 
	`Grade Mode Desc` VARCHAR(10) NOT NULL, 
	`Midterm Grade Code` VARCHAR(32), 
	`Grade Code` VARCHAR(32), 
	`Banner ID` VARCHAR(9) NOT NULL, 
	`First Name` VARCHAR(32) NOT NULL, 
	`Last Name` VARCHAR(32) NOT NULL, 
	`Middle Name` VARCHAR(32) NOT NULL, 
	`Prefix` VARCHAR(3) NOT NULL, 
	`Suffix` VARCHAR(32), 
	`Preferred First Name` VARCHAR(32) NOT NULL, 
	`Confid Ind` BOOL NOT NULL, 
	`ACU Email Address` VARCHAR(16) NOT NULL, 
	`Home Email Address` VARCHAR(32), 
	`Begin Time 1` INTEGER NOT NULL, 
	`End Time1` INTEGER NOT NULL, 
	`Bldg Code1` VARCHAR(3) NOT NULL, 
	`Bldg Desc1` VARCHAR(11) NOT NULL, 
	`Room Code1` VARCHAR(32), 
	`Schd Code1` VARCHAR(3) NOT NULL, 
	`Monday Ind1` VARCHAR(32), 
	`Tuesday Ind1` VARCHAR(32),
	`Wednesday Ind1` VARCHAR(32), 
	`Thursday Ind1` VARCHAR(32), 
	`Friday Ind1` VARCHAR(32), 
	`Saturday Ind1` VARCHAR(32), 
	`Sunday Ind1` VARCHAR(32), 
	`Begin Time2` VARCHAR(32), 
	`End Time2` VARCHAR(32), 
	`Bldg Code2` VARCHAR(32), 
	`Bldg Desc2` VARCHAR(32), 
	`Room Code2` VARCHAR(32), 
	`Schd Code2` VARCHAR(32), 
	`Monday Ind2` VARCHAR(32), 
	`Tuesday Ind2` VARCHAR(32), 
	`Wednesday Ind2` VARCHAR(32), 
	`Thursday Ind2` VARCHAR(32), 
	`Friday Ind2` VARCHAR(32), 
	`Saturday Ind2` VARCHAR(32), 
	`Sunday Ind2` VARCHAR(32), 
	`Advisor1 Term Code Eff` INTEGER NOT NULL, 
	`Advisor1 Last Name` VARCHAR(6) NOT NULL, 
	`Advisor1 First Name` VARCHAR(9) NOT NULL, 
	`Advisor1 Advisor Code` VARCHAR(32), 
	`Advisor1 Primary Advisor Ind` VARCHAR(1) NOT NULL, 
	`Sport1 Activity Code` VARCHAR(32), 
	`Sport1 Code` VARCHAR(32), 
	`Sport1 Eligibilty Code` VARCHAR(32), 
	`Sport1 Athletic Aid Ind` VARCHAR(32), 
	`Sport2 Activity  Code` VARCHAR(32), 
	`Sport2 Code` VARCHAR(32), 
	`Sport2 Eligibility Code` VARCHAR(32), 
	`Sport2 Athletic Aid Ind` VARCHAR(32), 
	`Vet Term` VARCHAR(32), 
	`Vet Code` VARCHAR(32), 
	`Vet Desc` VARCHAR(32), 
	`Vet Certified Hours` VARCHAR(32), 
	`Vet Certified Date` VARCHAR(32), 
	`Minor Code1` VARCHAR(32), 
	`Minor Desc1` VARCHAR(32), 
	`Conc Code1` VARCHAR(3) NOT NULL, 
	`Conc Desc1` VARCHAR(30) NOT NULL, 
	`Minor Code1 2` VARCHAR(32), 
	`Minor Desc1 2` VARCHAR(32), 
	`Conc Code1 2` VARCHAR(32), 
	`Conc Desc1 2` VARCHAR(32), 
	`Minor Code2` VARCHAR(32), 
	`Minor Desc2` VARCHAR(32), 
	`Rate Code` INTEGER NOT NULL, 
	`Ovrall Cumm GPA Hrs Attempted` INTEGER NOT NULL, 
	`Ovrall Cumm GPA Hours Earned` INTEGER NOT NULL, 
	`Ovrall Cumm GPA Hrs` INTEGER NOT NULL, 
	`Ovrall Cumm GPA Quality Points` INTEGER NOT NULL, 
	`Ovrall Cumm GPA` INTEGER NOT NULL, 
	`Ovrall Cumm GPA Hrs Passed` INTEGER NOT NULL, 
	`Dead Ind` VARCHAR(32), 
	`Date Class Added` DATETIME NOT NULL, 
	`Registration Status Date` DATETIME NOT NULL, 
	`Activity Date` DATETIME NOT NULL, 
	`Course College Code` VARCHAR(2) NOT NULL, 
	`Course College Desc` VARCHAR(28) NOT NULL, 
	`Course Dept Code` VARCHAR(3) NOT NULL, 
	`Course Dept Desc` VARCHAR(30) NOT NULL, 
	`International Ind` BOOL NOT NULL, 
	`Part of Term Start Date` DATE NOT NULL, 
	`Part of Term End Date` DATE NOT NULL, 
	`Section Max Enrollment` INTEGER NOT NULL, 
	`Section Enrollment` INTEGER NOT NULL, 
	`Section Available Seats` INTEGER NOT NULL, 
	`Section Schedule Type` VARCHAR(3) NOT NULL, 
	`Section Instruction Method` VARCHAR(3) NOT NULL, 
	`Section Session Code` VARCHAR(32), 
	`Ipeds Ethnic Code` INTEGER NOT NULL, 
	`Ipeds Ethnic Desc` VARCHAR(7) NOT NULL, 
	CHECK (`Enrolled Ind` IN (0, 1)), 
	CHECK (`Registered Ind` IN (0, 1)), 
	CHECK (`Grade Mode Code` IN (0, 1)), 
	CHECK (`Confid Ind` IN (0, 1)), 
	CHECK (`Tuesday Ind1` IN (0, 1)), 
	CHECK (`International Ind` IN (0, 1))
);
