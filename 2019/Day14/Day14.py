import os
from pathlib import Path
import fnmatch

def main ():
    outFilePath = Path("C:/Users/aarong/Advent of Code/Day14/Input.txt")
    ChemLines = []
    f = open(outFilePath, "r")
    for line in f:
        ChemLines.append(line)
    f.close
    #print(ChemLines)
    line = str(fnmatch.filter(ChemLines, "*FUEL"))
    line = line[2:len(line)-2]
    print(line)
    index = ChemLines.index(line)
    print(index)
    


main ()