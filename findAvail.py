import sys
import re
import mysql.connector
from mysql.connector.constants import ClientFlag
import string
import ConfigParser

class Course:
	def __init__(self, bt, et, m, t, w, r, f, sa, su):
		self.bt=bt
		self.et=et
		self.m=m
		self.t=t
		self.w=w
		self.r=r
		self.f=f
		self.sa=sa
		self.su=su

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

fullCourse=sys.argv[1].translate(None,'[]').split('.')
secNum=fullCourse[1]
course=re.match(r"([A-Z]+)([0-9]+)",fullCourse[0],re.I)
cursor.execute(''.join(["select max(`Term Code`) from enrollment"]))
termCode=cursor.fetchone()[0]
if course:
	items=course.groups()

cursor.execute(''.join(["select distinct se.`Begin Time 1`, se.`End Time1`, ",
	"se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`, ",
	"se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1` ",
	"from section as se ",
	"where ((se.`Monday Ind1` = 'M' and se.`Wednesday Ind1` = 'W' and se.`Friday Ind1` = 'F' and se.`Tuesday Ind1` != 'T' and se.`Thursday Ind1` != 'R') ",
	"or (se.`Tuesday Ind1` = 'T' and se.`Thursday Ind1` = 'R' and se.`Monday Ind1` != 'M' and se.`Wednesday Ind1` != 'W' and se.`Friday Ind1` != 'F')) ",
	"and se.`Begin Time 1` >= 800 and se.`Begin Time 1` <= 1600 and ((se.`End Time1` - se.`Begin Time 1`) = 50 or (se.`End Time1` - se.`Begin Time 1`) = 120) ",
	"and (se.`Begin Time 1`, se.`End Time1`, se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`, se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1`) not in ",
	"(select se.`Begin Time 1`, se.`End Time1`, ",
	"se.`Monday Ind1`, se.`Tuesday Ind1`, se.`Wednesday Ind1`, se.`Thursday Ind1`, se.`Friday Ind1`, se.`Saturday Ind1`, se.`Sunday Ind1` ",
	"from section as se, enrollment as en, student as st ",
	"where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`) ",
	"and st.`Banner ID` = en.`Banner ID` ",
	"and se.`Term Code` = ",str(termCode)," ",
	"and st.`Banner ID` in ",
	"(select st.`Banner ID`",
	"from section as se, student as st, enrollment as en ",
	"where (se.`CRN` = en.`CRN` and se.`Term Code` = en.`Term Code`) ",
	"and st.`Banner ID` = en.`Banner ID` ",
	"and se.`Subject Code` = '",items[0],"' and se.`Course Number` = ",str(items[1])," and se.`Section Number` like '%",secNum,"') ",
	"order by st.`Last Name`, st.`First Name`, se.`Begin Time 1`) ",
	"order by se.`Begin Time 1`;"]))

courses=[]

for (bt, et, m, t, w, r, f, sa, su) in cursor:
	temp=Course(bt,et,m,t,w,r,f,sa,su)
	courses.append(temp)

for i in courses:
	if i.t=='T' or i.r=='R':
		if i.et-i.bt==120:
			print str(i.bt)+'-'+str(i.et)+' '+i.t+i.r
	elif i.m=="M" or i.w=="W" or i.f=='F':
		if i.et-i.bt==50:
			print str(i.bt)+'-'+str(i.et)+' '+i.m+i.w+i.f