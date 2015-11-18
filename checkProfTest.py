import sys
import re
import mysql.connector
from mysql.connector.constants import ClientFlag
import string
import ConfigParser
import os

class Student:
	def __init__(self, firstName, lastName, banner, classification, email, courseCode, courseName):
		self.fn=firstName
		self.ln=lastName
		self.b=banner
		self.c=classification
		self.cc=courseCode
		self.cn=courseName
		self.e=email
	def __eq__(self, other):
		return self.b==other.b

class Professor:
	def __init__(self,firstName,lastName,pId,courseCode, courseName):
		self.fn=firstName
		self.ln=lastName
		self.id=pId
		self.cc=courseCode
		self.cn=courseName

Config = ConfigParser.ConfigParser()
Config.read("config.ini")
Config.sections()
def ConfigSectionMap(section):
    dict1 = {}
    options = Config.options(section)
    for option in options:
        try:
            dict1[option] = Config.get(section, option)
            if dict1[option] == -1:
                DebugPrint("skip: %s" % option)
        except:
            print("exception on %s!" % option)
            dict1[option] = None
    return dict1

db = mysql.connector.connect(user=ConfigSectionMap("Database")['user'], password=ConfigSectionMap("Database")['password'],
	host=ConfigSectionMap("Database")['host'], database=ConfigSectionMap("Database")['database'], client_flags=[ClientFlag.LOCAL_FILES])
cursor = db.cursor()

fullCourse=sys.argv[1].translate(None,'[],').split('.')
secNum=fullCourse[1]
if not type(secNum) is str:
	secNum=str(secNum)
if len(secNum)==1:
	secNum='0'+secNum
course=re.match(r"([A-Z]+)([0-9]+)",fullCourse[0],re.I)
cursor.execute(''.join(["select max(`Term Code`) from enrollment"]))
termCode=cursor.fetchone()[0]

if course:
	items=course.groups()

days=sys.argv[2].translate(None,'[],')

time=sys.argv[3].translate(None,'[],').split('-')

conflicts=[]

for i in days:
	if i=='M': 
		cursor.execute(''.join(["select distinct st.`First Name`, st.`Last Name`, st.`Banner ID`, st.`Class Code`, se.`Subject Code`, se.`Course Number`, se.`Section Number`, se.`Course Title`, st.`ACU Email Address` ",
				"from section as se, enrollment as en, student as st ",
				"where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`) ",
				"and st.`Banner ID` = en.`Banner ID` ",
				"and se.`Term Code` = ",str(termCode)," ",
				"and st.`Banner ID` in ",
				"(select st.`Banner ID` ",
				"from section as se, student as st, enrollment as en ",
				"where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`) ",
				"and st.`Banner ID` = en.`Banner ID` ",
				"and se.`Subject Code` = '",items[0],"' and se.`Course Number` = ",str(items[1])," and se.`Section Number` = '",secNum,"' and se.`Term Code` = ",str(termCode),") ",
				"and se.`Monday Ind1`='M' ",
				"and se.`Begin Time 1`=",str(time[0])," ",
				"and se.`End Time1`=",str(time[1]),";"]))
	elif i=='T':
		cursor.execute(''.join(["select distinct st.`First Name`, st.`Last Name`, st.`Banner ID`, st.`Class Code`, se.`Subject Code`, se.`Course Number`, se.`Section Number`, se.`Course Title`, st.`ACU Email Address` ",
				"from section as se, enrollment as en, student as st ",
				"where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`) ",
				"and st.`Banner ID` = en.`Banner ID` ",
				"and se.`Term Code` = ",termCode," ",
				"and st.`Banner ID` in ",
				"(select st.`Banner ID` ",
				"from section as se, student as st, enrollment as en ",
				"where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`) ",
				"and st.`Banner ID` = en.`Banner ID` ",
				"and se.`Subject Code` = '",items[0],"' and se.`Course Number` = ",str(items[1])," and se.`Section Number` = '",secNum,"' and se.`Term Code` = ",str(termCode),") ",
				"and se.`Tuesday Ind1`='T' ",
				"and se.`Begin Time 1`=",time[0]," ",
				"and se.`End Time1`=",time[1],";"]))
	elif i=='W':
		cursor.execute(''.join(["select distinct st.`First Name`, st.`Last Name`, st.`Banner ID`, st.`Class Code`, se.`Subject Code`, se.`Course Number`, se.`Section Number`, se.`Course Title`, st.`ACU Email Address` ",
				"from section as se, enrollment as en, student as st ",
				"where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`) ",
				"and st.`Banner ID` = en.`Banner ID` ",
				"and se.`Term Code` = ",str(termCode)," ",
				"and st.`Banner ID` in ",
				"(select st.`Banner ID` ",
				"from section as se, student as st, enrollment as en ",
				"where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`) ",
				"and st.`Banner ID` = en.`Banner ID` ",
				"and se.`Subject Code` = '",items[0],"' and se.`Course Number` = ",str(items[1])," and se.`Section Number` = '",secNum,"' and se.`Term Code` = ",str(termCode),") ",
				"and se.`Wednesday Ind1`='W' ",
				"and se.`Begin Time 1`=",str(time[0])," ",
				"and se.`End Time1`=",str(time[1]),";"]))
	elif i=='R':
		cursor.execute(''.join(["select distinct st.`First Name`, st.`Last Name`, st.`Banner ID`, st.`Class Code`, se.`Subject Code`, se.`Course Number`, se.`Section Number`, se.`Course Title`, st.`ACU Email Address` ",
				"from section as se, enrollment as en, student as st ",
				"where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`) ",
				"and st.`Banner ID` = en.`Banner ID` ",
				"and se.`Term Code` = ",str(termCode)," ",
				"and st.`Banner ID` in ",
				"(select st.`Banner ID` ",
				"from section as se, student as st, enrollment as en ",
				"where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`) ",
				"and st.`Banner ID` = en.`Banner ID` ",
				"and se.`Subject Code` = '",items[0],"' and se.`Course Number` = ",str(items[1])," and se.`Section Number` = '",secNum,"' and se.`Term Code` = ",str(termCode),") ",
				"and se.`Thursday Ind1`='R' ",
				"and se.`Begin Time 1`=",str(time[0])," ",
				"and se.`End Time1`=",str(time[1]),";"]))
	elif i=='F':
		cursor.execute(''.join(["select distinct st.`First Name`, st.`Last Name`, st.`Banner ID`, st.`Class Code`, se.`Subject Code`, se.`Course Number`, se.`Section Number`, se.`Course Title`, st.`ACU Email Address` ",
				"from section as se, enrollment as en, student as st ",
				"where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`) ",
				"and st.`Banner ID` = en.`Banner ID` ",
				"and se.`Term Code` = ",str(termCode)," ",
				"and st.`Banner ID` in ",
				"(select st.`Banner ID` ",
				"from section as se, student as st, enrollment as en ",
				"where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`) ",
				"and st.`Banner ID` = en.`Banner ID` ",
				"and se.`Subject Code` = '",items[0],"' and se.`Course Number` = ",str(items[1])," and se.`Section Number` = '",secNum,"' and se.`Term Code` = ",str(termCode),") ",
				"and se.`Friday Ind1`='F' ",
				"and se.`Begin Time 1`=",str(time[0])," ",
				"and se.`End Time1`=",str(time[1]),";"]))
	elif i=='S':
		cursor.execute(''.join(["select distinct st.`First Name`, st.`Last Name`, st.`Banner ID`, st.`Class Code`, se.`Subject Code`, se.`Course Number`, se.`Section Number`, se.`Course Title`, st.`ACU Email Address` ",
				"from section as se, enrollment as en, student as st ",
				"where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`) ",
				"and st.`Banner ID` = en.`Banner ID` ",
				"and se.`Term Code` = ",str(termCode)," ",
				"and st.`Banner ID` in ",
				"(select st.`Banner ID` ",
				"from section as se, student as st, enrollment as en ",
				"where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`) ",
				"and st.`Banner ID` = en.`Banner ID` ",
				"and se.`Subject Code` = '",items[0],"' and se.`Course Number` = ",str(items[1])," and se.`Section Number` = '",secNum,"' and se.`Term Code` = ",str(termCode),") ",
				"and se.`Saturday Ind1`='S' ",
				"and se.`Begin Time 1`=",str(time[0])," ",
				"and se.`End Time1`=",str(time[1]),";"]))
	elif i=='U':
		cursor.execute(''.join(["select distinct st.`First Name`, st.`Last Name`, st.`Banner ID`, st.`Class Code`, se.`Subject Code`, se.`Course Number`, se.`Section Number`, se.`Course Title`, st.`ACU Email Address` ",
				"from section as se, enrollment as en, student as st ",
				"where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`) ",
				"and st.`Banner ID` = en.`Banner ID` ",
				"and se.`Term Code` = ",str(termCode)," ",
				"and st.`Banner ID` in ",
				"(select st.`Banner ID` ",
				"from section as se, student as st, enrollment as en ",
				"where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`) ",
				"and st.`Banner ID` = en.`Banner ID` ",
				"and se.`Subject Code` = '",items[0],"' and se.`Course Number` = ",str(items[1])," and se.`Section Number` = '",secNum,"' and se.`Term Code` = ",str(termCode),") ",
				"and se.`Sunday Ind1`='U' ",
				"and se.`Begin Time 1`=",str(time[0])," ",
				"and se.`End Time1`=",str(time[1]),";"]))
	for (fname, lname, banner, classification, sCode, cNum, sNum, courseName, email) in cursor:
		courseCode=""
		if type(sNum) is str:
			courseCode=sCode+str(cNum)+'.'+sNum
		else:
			courseCode=sCode+str(cNum)+'.'+str(sNum)
		temp=Student(fname,lname,banner,classification,email,courseCode,courseName)
		isThere=False
		for j in conflicts:
			if temp==j:
				isThere=True
				break
		if not isThere:
			conflicts.append(temp)
prof=""
for day in days:
	if day=='M':
		cursor.execute(''.join(["select `Instructor ID`, `Instructor Name`, `Subject Code`, `Course Number`, `Section Number`, `Course Title` ",
			"from section ",
			"where `Instructor ID`=",
			"(select `Instructor ID` from section ",
				"where `Subject Code` = '",items[0],"' ",
				"and `Course Number` = ",str(items[1])," ",
				"and `Section Number` like '%",secNum,"' ",
				"and `Term Code` = ",str(termCode),") ",
			"and `Monday Ind1`='M' and `Begin Time 1`=",str(time[0])," and `End Time1`=",str(time[1])," and `Term Code`=",str(termCode),";"]))
	elif day=='T':
		cursor.execute(''.join(["select `Instructor ID`, `Instructor Name`, `Subject Code`, `Course Number`, `Section Number`, `Course Title` ",
			"from section ",
			"where `Instructor ID`=",
			"(select `Instructor ID` from section ",
				"where `Subject Code` = '",items[0],"' ",
				"and `Course Number` = ",str(items[1])," ",
				"and `Section Number` like '%",secNum,"' ",
				"and `Term Code` = ",str(termCode),") ",
			"and `Tuesday Ind1`='T' and `Begin Time 1`=",str(time[0])," and `End Time1`=",str(time[1])," and `Term Code`=",str(termCode),";"]))
	elif day=='W':
		cursor.execute(''.join(["select `Instructor ID`, `Instructor Name`, `Subject Code`, `Course Number`, `Section Number`, `Course Title` ",
			"from section ",
			"where `Instructor ID`=",
			"(select `Instructor ID` from section ",
				"where `Subject Code` = '",items[0],"' ",
				"and `Course Number` = ",str(items[1])," ",
				"and `Section Number` like '%",secNum,"' ",
				"and `Term Code` = ",str(termCode),") ",
			"and `Wednesday Ind1`='W' and `Begin Time 1`=",str(time[0])," and `End Time1`=",str(time[1])," and `Term Code`=",str(termCode),";"]))
	elif day=='R':
		cursor.execute(''.join(["select `Instructor ID`, `Instructor Name`, `Subject Code`, `Course Number`, `Section Number`, `Course Title` ",
			"from section ",
			"where `Instructor ID`=",
			"(select `Instructor ID` from section ",
				"where `Subject Code` = '",items[0],"' ",
				"and `Course Number` = ",str(items[1])," ",
				"and `Section Number` like '%",secNum,"' ",
				"and `Term Code` = ",str(termCode),") ",
			"and `Thursday Ind1`='R' and `Begin Time 1`=",str(time[0])," and `End Time1`=",str(time[1])," and `Term Code`=",str(termCode),";"]))
	elif day=='F':
		cursor.execute(''.join(["select `Instructor ID`, `Instructor Name`, `Subject Code`, `Course Number`, `Section Number`, `Course Title` ",
			"from section ",
			"where `Instructor ID`=",
			"(select `Instructor ID` from section ",
				"where `Subject Code` = '",items[0],"' ",
				"and `Course Number` = ",str(items[1])," ",
				"and `Section Number` like '%",secNum,"' ",
				"and `Term Code` = ",str(termCode),") ",
			"and `Friday Ind1`='F' and `Begin Time 1`=",str(time[0])," and `End Time1`=",str(time[1])," and `Term Code`=",str(termCode),";"]))
	elif day=='S':
		cursor.execute(''.join(["select `Instructor ID`, `Instructor Name`, `Subject Code`, `Course Number`, `Section Number`, `Course Title` ",
			"from section ",
			"where `Instructor ID`=",
			"(select `Instructor ID` from section ",
				"where `Subject Code` = '",items[0],"' ",
				"and `Course Number` = ",str(items[1])," ",
				"and `Section Number` like '%",secNum,"' ",
				"and `Term Code` = ",str(termCode),") ",
			"and `Saturday Ind1`='S' and `Begin Time 1`=",str(time[0])," and `End Time1`=",str(time[1])," and `Term Code`=",str(termCode),";"]))
	elif day=='U':
		cursor.execute(''.join(["select `Instructor ID`, `Instructor Name`, `Subject Code`, `Course Number`, `Section Number`, `Course Title` ",
			"from section ",
			"where `Instructor ID`=",
			"(select `Instructor ID` from section ",
				"where `Subject Code` = '",items[0],"' ",
				"and `Course Number` = ",str(items[1])," ",
				"and `Section Number` like '%",secNum,"' ",
				"and `Term Code` = ",str(termCode),") ",
			"and `Sunday Ind1`='U' and `Begin Time 1`=",str(time[0])," and `End Time1`=",str(time[1])," and `Term Code`=",str(termCode),";"]))
	for(inID, iName, sCode, cNum, sNum, courseName) in cursor:
		name=iName.split(", ")
		courseCode=""
		if type(sNum) is str:
			courseCode=sCode+str(cNum)+'.'+sNum
		else:
			courseCode=sCode+str(cNum)+'.'+str(sNum)
		prof=Professor(name[1],name[0],inID,courseCode,courseName)
	if prof!="":
		break


cursor.execute(''.join(["select count(`Banner ID`) from",
	" enrollment e inner join section s on e.CRN = s.CRN and e.`Term Code` = s.`Term Code`",
	" where s.`Subject Code` = '",items[0],"'",
	" and s.`Course Number`=",str(items[1])," and s.`Section Number` like '%",secNum,"' and s.`Term Code`=",str(termCode),";"]))

numStud=cursor.fetchone()[0]

#print str(len(conflicts))+' out of '+str(numStud)+' have schedule conflicts and here are the students with the conflicts\n'

if prof!="":
	sys.stdout.write("Professor is unavailable because of "+prof.cc+' '+prof.cn)
else:
	sys.stdout.write("Professor is available at this time")
