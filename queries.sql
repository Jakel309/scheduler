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
)
order by st.`Last Name`, st.`First Name`, se.`Begin Time 1`;
