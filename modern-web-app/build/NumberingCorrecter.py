#!/usr/local/bin/python3

import re
from io import StringIO
import sys
import os.path
import argparse

parser=argparse.ArgumentParser(
    description='''How to run this command:''')
parser.add_argument('<md-file-path>',type=str,help='Provide the full path to the markdown file that needs to be updated')
args = parser.parse_args()

if len(sys.argv) < 2:
    print('Provide a file path, usage : NumberingCorrecter.py <file-path>')

else:
    file = sys.argv[1]
    if os.path.exists(file):
        inputFile = open(file,'r')
        i = 0
        output = StringIO()
        for line in inputFile.readlines():
            if (re.search("^[0-9]+\.\s+",line)):
                i += 1
                replacement = str(i)+'. '
                newLine = re.sub('^[0-9]+\.\s*(\[?[0-9]*\]?\s*)*',replacement,line)
                #print (newLine)
                output.write(newLine)
            else:
                output.write(line)

        print ("Number of steps:", i)
        inputFile.close()

        inputFile = open(file,'w')
        inputFile.write(output.getvalue())
        inputFile.close()
    else:
        print ('Provided file path doesn\'t exist')
