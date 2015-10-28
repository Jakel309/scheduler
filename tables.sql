drop table if exists student;
drop table if exists section;
drop table if exists enrollment;

create table student(
	`Banner ID` VARCHAR(9) NOT NULL, 
	`First Name` VARCHAR(32) NOT NULL, 
	`Last Name` VARCHAR(32) NOT NULL,
	`Ovrall Cumm GPA Hrs Attempted` INTEGER NOT NULL, 
	`Ovrall Cumm GPA Hours Earned` INTEGER NOT NULL, 
	`Ovrall Cumm GPA Hrs` INTEGER NOT NULL, 
	`Ovrall Cumm GPA Quality Points` INTEGER NOT NULL, 
	`Ovrall Cumm GPA` INTEGER NOT NULL, 
	`Ovrall Cumm GPA Hrs Passed` INTEGER NOT NULL,
	primary key(`Banner ID`)
);

create table section(
	`CRN` INTEGER NOT NULL,
	`Subject Code` VARCHAR(4) NOT NULL,
	`Course Number` INTEGER NOT NULL,
	`Section Number` VARCHAR(4) NOT NULL,
	`Term Code` INTEGER NOT NULL,
	primary key (`CRN`, `Term Code`)
);

create table enrollment(
	`Banner ID` VARCHAR(9) NOT NULL,
	`CRN` INTEGER NOT NULL,
	`Term Code` INTEGER NOT NULL,
	`Grade` CHAR,
	primary key (`Banner ID`,`CRN`,`Term Code`)
);

insert into student (`Banner ID`,`First Name`,`Last Name`,`Ovrall Cumm GPA Hrs Attempted`, 
	`Ovrall Cumm GPA Hours Earned`,`Ovrall Cumm GPA Hrs`,`Ovrall Cumm GPA Quality Points`, 
	`Ovrall Cumm GPA`,`Ovrall Cumm GPA Hrs Passed`)
select `Banner ID`,`First Name`,`Last Name`,`Ovrall Cumm GPA Hrs Attempted`, 
	`Ovrall Cumm GPA Hours Earned`,`Ovrall Cumm GPA Hrs`,`Ovrall Cumm GPA Quality Points`, 
	`Ovrall Cumm GPA`,`Ovrall Cumm GPA Hrs Passed` from (select * from registrations order by `Term Code` DESC) r
	group by `Banner ID`,`First Name`,`Last Name`;

insert into section (`CRN`,`Subject Code`,`Course Number`,`Section Number`, `Term Code`)
select distinct `CRN`,`Subject Code`,`Course Number`,`Section Number`, `Term Code` from registrations;

insert into enrollment (`Banner ID`,`CRN`, `Term Code`, `Grade`)
select distinct `Banner ID`,`CRN`, `Term Code`, `Grade Code` from registrations;
