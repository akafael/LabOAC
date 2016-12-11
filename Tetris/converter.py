#!/usr/bin/python
##
# Conversor from .miff to asm MIPS
# @author Rafael
# @version 1.0
##

import sys, getopt

def main(argv):
    inputfile = ''
    outputfile = ''
    try:
       opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
    except getopt.GetoptError:
       print 'test.py -i <inputfile> -o <outputfile>'
       sys.exit(2)
    for opt, arg in opts:
       if opt == '-h':
          print 'test.py -i <inputfile> -o <outputfile>'
          sys.exit()
       elif opt in ("-i", "--ifile"):
          inputfile = arg
       elif opt in ("-o", "--ofile"):
          outputfile = arg
    print 'Processing file "', inputfile,'"'

    # Read File

    mFile = open(inputfile,'r')        # Open File
    fileData = '\n'+mFile.read()             # Read File

    # Break into substrings
    vectorLines = fileData.split('BEGIN')        # Remove Header
    vectorLines = vectorLines[1].split('\r\nEND')    # Remove Footer
    vectorLines = vectorLines[0].split(';\r\n')     # Break Lines
    tmpVectorLine = vectorLines                  # Make a Copy

    for i in range(len(vectorLines)):
        line = vectorLines[i].split(':') # Remove Label
        if len(line)>1:
            tmpLine = line[1].split(' ') # Remove ' '
            # Dark Magic to put ',' and '0x'
            tmpVectorLine[i] = ', 0x'.join([str(item) for item in tmpLine])

    # Glue Everything together using map
    newVectorLine = '.byte:'+''.join(map(str, tmpVectorLine))[1:]+'\r\n'

    # Make a new file
    mNewFile = open(outputfile,'w')
    mNewFile.write(""+newVectorLine)
    mNewFile.close()
    mFile.close()
    print 'Output file is "', outputfile,'"'

if __name__ == "__main__":
   main(sys.argv[1:])
