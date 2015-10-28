import mysql.connector
from mysql.connector.constants import ClientFlag
from glob import glob
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
	host=ConfigSectionMap("Database")['host'], database=ConfigSectionMap("Database")['database'])
cursor = db.cursor()

#create (replace) registration table
for line in open("registrations.sql").read().split(';\n'):
    cursor.execute(line)

#get all csv files
for path in glob("csvs/*.csv"):
	#import each file
	cursor.execute("".join(["load data local infile '", path , "' ",
		"into table db.registrations ",
		"fields terminated by ',' enclosed by '\"' ",
		"lines terminated by '\n'; "]))
#clean up empty rows
cursor.execute("delete from registrations where crn = 0;")

#dump into real tables, then it's ready to go
for line in open("tables.sql").read().split(';\n'):
    cursor.execute(line)

db.commit()

