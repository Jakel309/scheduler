import sys
import re
import mysql.connector
from mysql.connector.constants import ClientFlag
import string
import ConfigParser

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
studs=[]
if course:
	items=course.groups()

cursor.execute(''.join(["select st.`First Name`, st.`Last Name`, st.`Banner ID` from",
		" section se inner join enrollment e on e.CRN = se.CRN and e.`Term Code` = se.`Term Code`  inner join",
		" student st on e.`Banner ID` = st.`Banner ID` where",
		" se.`Subject Code` = '", items[0], "' and se.`Course Number`=",str(items[1])," and se.`Section Number` like '%",secNum,"' and se.`Term Code`=",str(termCode)," order by st.`Last Name`;"]))

for (fname, lname, banner) in cursor:
		print fname + ' ' + lname + ', ' + banner
