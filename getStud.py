import sys
import re
# import mysql.connector
import string
# import ConfigParser
import csv

# db = mysql.connector.connect(user=ConfigSectionMap("Database")['user'], password=ConfigSectionMap("Database")['password'],
# 	host=ConfigSectionMap("Database")['host'], database=ConfigSectionMap("Database")['database'])
# cursor = db.cursor()

fullCourse=sys.argv[1].translate(None,'[]').split('.')
secNum=fullCourse[1]
course=re.match(r"([A-Z]+)([0-9]+)",fullCourse[0],re.I)
termCode='201610'
studs=[]
if course:
	items=course.groups()
# cursor.execute(''.join(["select s.`First Name`, s.`Last Name`, s.`Banner ID` from",
# 		" enrollment e inner join student s, section se on e.`Banner Id` = s.`Banner ID` where ",
# 		"e.`Subject Code` = '", items[0], "' and e.`Course Number`=''",items[1]," and se.`Section Number` like '%",secNum,"order by `Last Name`;"]))
# for (fname, lname, banner) in cursor:
# 		print fname + ' ' + lname + ', ' + banner

f=open('csvs/cs374_anon.csv','rb')
try:
	reader=csv.DictReader(f)
	for row in reader:
		if row['Subject Code']==items[0] and row['Course Number']==items[1] and int(row['Section Number'])==int(secNum) and int(row['Term Code'])==int(termCode):
			print row['First Name']+' '+row['Last Name']+' '+row['Banner ID']
finally:
	f.close()