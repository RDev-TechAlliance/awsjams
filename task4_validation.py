#  Description:  Script to read json file produced from consec CLI (tcs) and list Plugin-IDs with tagged as Critical Severity vulnerabilities
#  Author:   Rick Devera
#  Email:  rdevera@tenable.com
#
import json
import sys
import argparse

# Parse command-line
parser = argparse.ArgumentParser()
parser.add_argument("jsonFile")
args = parser.parse_args()
sourceFile = args.jsonFile

#print(args.jsonFile)


try:
#verify is source file contains json

#  JSON string is now and list object
# 
  f = open(sourceFile)

  data = json.load(f)
                                         
# parse through the list and grab ID's
# initialize the string on first pass
# then append the string on multiple passes
                                                          
except ValueError as err:
  print ("Problems with json file: ", err)
  sys.exit(0)

except:
  print ("Command line argument is not valid JSON")
  sys.exit(0)

print ("\nParsing json file for CRITICAL vulnerabilities...\n")
total=0

for i in data['vulnerabilities']['findings']:
    if (i['severity'] == "CRITICAL"):
      print("PLUGIN ID: ", i['plugin_id'])
      total+=1
      
print ("Total: ", total)



f.close()
