


select distinct se.`Begin Time 1`, se.`End Time1`,
se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`,
se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`
from 
(
	select * from (	
		select distinct se.`Begin Time 1`, se.`End Time1`,
		se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`,
		se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1` from section as se
		where
		(
			(se.`Monday Ind1` = 'M' and se.`Wednesday Ind1` = 'W' and se.`Friday Ind1` = 'F' and se.`Tuesday Ind1` != 'T' and se.`Thursday Ind1` != 'R' and (se.`End Time1` - se.`Begin Time 1`) = 50)
			or (se.`Tuesday Ind1` = 'T' and se.`Thursday Ind1` = 'R' and se.`Monday Ind1` != 'M' and se.`Wednesday Ind1` != 'W' and se.`Friday Ind1` != 'F' and (se.`End Time1` - se.`Begin Time 1`) = 120)
		)
		and se.`Begin Time 1` >= 800 and se.`Begin Time 1` <= 1600
	) as se
	where (se.`Begin Time 1`, se.`End Time1`, se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`, se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`) not in
	(	
		select distinct t1.`Begin Time 1`, t1.`End Time1`,
		t1.`Monday Ind1`, t1.`Tuesday Ind1`, t1.`Wednesday Ind1`, t1.`Thursday Ind1`, t1.`Friday Ind1`, t1.`Saturday Ind1`, t1.`Sunday Ind1`
		from
		(
			select distinct se.`Begin Time 1`, se.`End Time1`,
			se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`, se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`
			from section as se
			where
			(
				(se.`Monday Ind1` = 'M' and se.`Wednesday Ind1` = 'W' and se.`Friday Ind1` = 'F' and se.`Tuesday Ind1` != 'T' and se.`Thursday Ind1` != 'R' and (se.`End Time1` - se.`Begin Time 1`) = 50)
				or (se.`Tuesday Ind1` = 'T' and se.`Thursday Ind1` = 'R' and se.`Monday Ind1` != 'M' and se.`Wednesday Ind1` != 'W' and se.`Friday Ind1` != 'F' and (se.`End Time1` - se.`Begin Time 1`) = 120)
			)
		) as t1,
		(
		select se.`Begin Time 1`, se.`End Time1`,
		se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`, se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`
        from section as se
    		where se.`Instructor ID` in
			(
				select se.`Instructor ID`
				from section as se
				where se.`Subject Code` = 'CS' and se.`Course Number` = 374 and se.`Section Number` = 01
				and se.`Term Code` = 201610
			)
		) as t2
		where
		(
			(
				(t1.`Monday Ind1` = 'M' and t1.`Monday Ind1` = t2.`Monday Ind1`)
				or (t1.`Tuesday Ind1` = 'T' and t1.`Tuesday Ind1` = t2.`Tuesday Ind1`)
				or (t1.`Wednesday Ind1` = 'W' and t1.`Wednesday Ind1` = t2.`Wednesday Ind1`)
				or (t1.`Thursday Ind1` = 'R' and t1.`Thursday Ind1` = t2.`Thursday Ind1`)
				or (t1.`Friday Ind1` = 'F' and t1.`Friday Ind1` = t2.`Friday Ind1`)
			)
		)
		and
		(
			(t1.`Begin Time 1` between t2.`Begin Time 1` and t2.`End Time1`)
			or (t1.`End Time1` between t2.`Begin Time 1` and t2.`End Time1`)
		)
	)
) as se
where (se.`Begin Time 1`, se.`End Time1`, se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`, se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`) not in 
(	
	select distinct t1.`Begin Time 1`, t1.`End Time1`,
	t1.`Monday Ind1`, t1.`Tuesday Ind1`, t1.`Wednesday Ind1`, t1.`Thursday Ind1`, t1.`Friday Ind1`, t1.`Saturday Ind1`, t1.`Sunday Ind1`
	from
	(
		select distinct se.`Begin Time 1`, se.`End Time1`,
		se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`, se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`
		from section as se
		where
		(
			(se.`Monday Ind1` = 'M' and se.`Wednesday Ind1` = 'W' and se.`Friday Ind1` = 'F' and se.`Tuesday Ind1` != 'T' and se.`Thursday Ind1` != 'R' and (se.`End Time1` - se.`Begin Time 1`) = 50)
			or (se.`Tuesday Ind1` = 'T' and se.`Thursday Ind1` = 'R' and se.`Monday Ind1` != 'M' and se.`Wednesday Ind1` != 'W' and se.`Friday Ind1` != 'F' and (se.`End Time1` - se.`Begin Time 1`) = 120)
		)
	) as t1,
	(
		select st.`Class Code`, se.`Begin Time 1`, se.`End Time1`,
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
	) as t2
	where
	(
		(
			(t1.`Monday Ind1` = 'M' and t1.`Monday Ind1` = t2.`Monday Ind1`)
			or (t1.`Tuesday Ind1` = 'T' and t1.`Tuesday Ind1` = t2.`Tuesday Ind1`)
			or (t1.`Wednesday Ind1` = 'W' and t1.`Wednesday Ind1` = t2.`Wednesday Ind1`)
			or (t1.`Thursday Ind1` = 'R' and t1.`Thursday Ind1` = t2.`Thursday Ind1`)
			or (t1.`Friday Ind1` = 'F' and t1.`Friday Ind1` = t2.`Friday Ind1`)
		)
	)
	and
	(
		(t1.`Begin Time 1` between t2.`Begin Time 1` and t2.`End Time1`)
		or (t1.`End Time1` between t2.`Begin Time 1` and t2.`End Time1`)
	)
	group by t1.`Begin Time 1`, t1.`End Time1`,
	t1.`Monday Ind1`, t1.`Tuesday Ind1`, t1.`Wednesday Ind1`, t1.`Thursday Ind1`, t1.`Friday Ind1`, t1.`Saturday Ind1`, t1.`Sunday Ind1`
	
	having sum(t2.`Class Code` = 'SR') > 3 or sum(t2.`Class Code` != 'SR') > 2
)
order by se.`Begin Time 1`;
