/* This query should return all of the students, their classes, and the times/days for their classes*/
select st.`Last Name`, st.`First Name`, st.`Banner ID`,
se.`CRN`, se.`Subject Code`, se.`Course Number`, se.`Section Number`,
se.`Begin Time 1`, se.`End Time1`,
se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`, se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`
from section as se, enrollment as en, student as st
where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`)
and st.`Banner ID` = en.`Banner ID`
and se.`Term Code` = 201610
order by st.`Last Name`, st.`First Name`, se.`Begin Time 1`;



/* This query gets the schedule of everyone in a course. CS374 is used as an example*/
select st.`Last Name`, st.`First Name`, st.`Banner ID`,
se.`CRN`, se.`Subject Code`, se.`Course Number`, se.`Section Number`,
se.`Begin Time 1`, se.`End Time1`,
se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`, se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`
from section as se, enrollment as en, student as st
where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`)
and st.`Banner ID` = en.`Banner ID`
and se.`Term Code` = 201610
and st.`Banner ID` in
(
select st.`Banner ID`
from section as se, student as st, enrollment as en
where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`)
and st.`Banner ID` = en.`Banner ID`
and se.`Subject Code` = 'CS' and se.`Course Number` = 374 and se.`Section Number` = 01
and se.`Term Code` = 201610
)
order by st.`Last Name`, st.`First Name`, se.`Begin Time 1`;



/* Get all the classes and times that have the same professor as a given course */
select se.`Instructor Name`, se.`Instructor ID`,
se.`CRN`, se.`Subject Code`, se.`Course Number`, se.`Section Number`,
se.`Begin Time 1`, se.`End Time1`,
se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`,
se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`
from section as se
where se.`Instructor ID` in
(
	select se.`Instructor ID`
	from section as se
	where se.`Subject Code` = 'CS' and se.`Course Number` = 374 and se.`Section Number` = 01
	and se.`Term Code` = 201610
)
order by se.`Begin Time 1`;



/* This query should return the number of students that have a class at a certain day/time */
select count(*) as "# of Students", se.`Begin Time 1`, se.`End Time1`,
se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`, se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`
from section as se, enrollment as en, student as st
where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`)
and st.`Banner ID` = en.`Banner ID`
and se.`Term Code` = 201610
and st.`Banner ID` in
(
select st.`Banner ID`
from section as se, student as st, enrollment as en
where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`)
and st.`Banner ID` = en.`Banner ID`
and se.`Subject Code` = 'CS' and se.`Course Number` = 374 and se.`Section Number` = 01
and se.`Term Code` = 201610
)
group by se.`Begin Time 1`, se.`End Time1`, se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`, se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`
order by count(*) desc, se.`Begin Time 1`;



/* This query should return the number of students that have a class at a certain day/time by classifcation */
select count(*) as "# of Students", st.`Class Code`, se.`Begin Time 1`, se.`End Time1`,
se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`, se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`
from section as se, enrollment as en, student as st
where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`)
and st.`Banner ID` = en.`Banner ID`
and se.`Term Code` = 201610
and st.`Banner ID` in
(
select st.`Banner ID`
from section as se, student as st, enrollment as en
where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`)
and st.`Banner ID` = en.`Banner ID`
and se.`Subject Code` = 'CS' and se.`Course Number` = 374 and se.`Section Number` = 01
and se.`Term Code` = 201610
)
group by st.`Class Code`, se.`Begin Time 1`, se.`End Time1`, se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`, se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`
order by count(*) desc, st.`Class Code`, se.`Begin Time 1`;



/* Retrieve all of the possible times a class can take place */
select distinct se.`Begin Time 1`, se.`End Time1`,
se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`, se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`
from section as se
order by se.`Begin Time 1`;



/* Retrieve only MWF and TR timeslots */
select distinct se.`Begin Time 1`, se.`End Time1`,
se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`, se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`
from section as se
where
(
	(se.`Monday Ind1` = 'M' and se.`Wednesday Ind1` = 'W' and se.`Friday Ind1` = 'F' and se.`Tuesday Ind1` != 'T' and se.`Thursday Ind1` != 'R' and (se.`End Time1` - se.`Begin Time 1`) = 50)
	or (se.`Tuesday Ind1` = 'T' and se.`Thursday Ind1` = 'R' and se.`Monday Ind1` != 'M' and se.`Wednesday Ind1` != 'W' and se.`Friday Ind1` != 'F' and (se.`End Time1` - se.`Begin Time 1`) = 120)
)
and se.`Begin Time 1` >= 800 and se.`Begin Time 1` <= 1500
order by se.`Begin Time 1`;



/* Find "normal" timeslots that intersect with "odd" timeslots */
select distinct se.`Begin Time 1`, se.`End Time1`,
se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`, se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`
from section as se, section as se2, enrollment as en, student as st
where (se2.`CRN` = en.`CRN` and se2.`Term Code` = en.`Term Code`)
and st.`Banner ID` = en.`Banner ID`
and se.`Term Code` = 201610
and st.`Banner ID` in
	(
		select st.`Banner ID`
		from section as se, student as st, enrollment as en
		where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`)
		and st.`Banner ID` = en.`Banner ID`
		and se.`Subject Code` = 'CS' and se.`Course Number` = 374 and se.`Section Number` = 01
		and se.`Term Code` = 201610
	)
and
(
	not (se2.`Monday Ind1` = 'M' and se2.`Wednesday Ind1` = 'W' and se2.`Friday Ind1` = 'F' and se2.`Tuesday Ind1` != 'T' and se2.`Thursday Ind1` != 'R' and (se2.`End Time1` - se2.`Begin Time 1`) = 50)
	and not (se2.`Tuesday Ind1` = 'T' and se2.`Thursday Ind1` = 'R' and se2.`Monday Ind1` != 'M' and se2.`Wednesday Ind1` != 'W' and se2.`Friday Ind1` != 'F' and (se2.`End Time1` - se2.`Begin Time 1`) = 120)
)
and
(
	(se.`Monday Ind1` = 'M' and se.`Wednesday Ind1` = 'W' and se.`Friday Ind1` = 'F' and se.`Tuesday Ind1` != 'T' and se.`Thursday Ind1` != 'R' and (se.`End Time1` - se.`Begin Time 1`) = 50)
	or (se.`Tuesday Ind1` = 'T' and se.`Thursday Ind1` = 'R' and se.`Monday Ind1` != 'M' and se.`Wednesday Ind1` != 'W' and se.`Friday Ind1` != 'F' and (se.`End Time1` - se.`Begin Time 1`) = 120)
)
and
(
	(
		(se.`Monday Ind1` = 'M' and se.`Monday Ind1` = se2.`Monday Ind1`)
        or (se.`Tuesday Ind1` = 'T' and se.`Tuesday Ind1` = se2.`Tuesday Ind1`)
        or (se.`Wednesday Ind1` = 'W' and se.`Wednesday Ind1` = se2.`Wednesday Ind1`)
        or (se.`Thursday Ind1` = 'R' and se.`Thursday Ind1` = se2.`Thursday Ind1`)
        or (se.`Friday Ind1` = 'F' and se.`Friday Ind1` = se2.`Friday Ind1`)
	)
)
and
(
	(se.`Begin Time 1` between se2.`Begin Time 1` and se2.`End Time1`)
    or (se.`End Time1` between se2.`Begin Time 1` and se2.`End Time1`)
)
order by se.`Begin Time 1`;



/* Find possible times that the class can be moved to by checking schedules of all students in a class and comparing with a list of ideal time slots */
/* Only accounts for MWF and TR */
select distinct se.`Begin Time 1`, se.`End Time1`,
se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`,
se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`
from section as se
where
(	/* Look only for practical MWF or TR times */
	(se.`Monday Ind1` = 'M' and se.`Wednesday Ind1` = 'W' and se.`Friday Ind1` = 'F' and se.`Tuesday Ind1` != 'T' and se.`Thursday Ind1` != 'R' and (se.`End Time1` - se.`Begin Time 1`) = 50)
	or (se.`Tuesday Ind1` = 'T' and se.`Thursday Ind1` = 'R' and se.`Monday Ind1` != 'M' and se.`Wednesday Ind1` != 'W' and se.`Friday Ind1` != 'F' and (se.`End Time1` - se.`Begin Time 1`) = 120)
)
and se.`Begin Time 1` >= 800 and se.`Begin Time 1` <= 1600
and (se.`Begin Time 1`, se.`End Time1`, se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`, se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`) not in 
(	/* Rule out times with student conflicts */
	select se.`Begin Time 1`, se.`End Time1`,
	se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`, se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`
	from section as se, enrollment as en, student as st
	where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`)
	and st.`Banner ID` = en.`Banner ID`
	and se.`Term Code` = 201610
	and st.`Banner ID` in
	(
		select st.`Banner ID`
		from section as se, student as st, enrollment as en
		where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`)
		and st.`Banner ID` = en.`Banner ID`
		and se.`Subject Code` = 'CS' and se.`Course Number` = 374 and se.`Section Number` = 01
		and se.`Term Code` = 201610
	)
	group by se.`Begin Time 1`, se.`End Time1`,
	se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`, se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`
	/* Acceptable losses: replace the zero with whatever number of students you are willing to lose */
	having sum(st.`Class Code` = 'SR') > 0 or sum(st.`Class Code` != 'SR') > 0
)
and (se.`Begin Time 1`, se.`End Time1`, se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`, se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`) not in 
(	/* Check times for instructor conflicts */
	select se.`Begin Time 1`, se.`End Time1`,
	se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`,
	se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`
	from section as se
	where se.`Instructor ID` in
	(
		select se.`Instructor ID`
		from section as se
		where se.`Subject Code` = 'CS' and se.`Course Number` = 374 and se.`Section Number` = 01
		and se.`Term Code` = 201610
	)
)
order by se.`Begin Time 1`;
