import os
from pathlib import Path

def main ():
    inputFilePath = Path("C:/Users/aarong/Advent of Code/Day17/Outfile.txt")
    outputFilePath = Path("C:/Users/aarong/Advent of Code/Day17/Outfile2.txt")
    AlignmentParamater = 0
    xMax = 55
    yMax = 42
    y = yMax
    x = xMax
    scaffoldArray = [[0] * y for i in range(x)]
    if inputFilePath.exists:
         f = open(inputFilePath, "r")
         y = 0
         for line in f:
                x = 0
                for character in line:
                    scaffoldArray[x][y] = character
                    x = x + 1
                y = y + 1
    x = 0
    y = 0
    while y < yMax:
        x = 0
        while x < xMax:
            if scaffoldArray[x][y] == "#" and scaffoldArray[x+1][y] == "#" and scaffoldArray[x-1][y] == "#" and scaffoldArray[x][y+1] == "#" and scaffoldArray[x][y-1] == "#":
                AlignmentParamater = AlignmentParamater + ((x-1) * (y-1))
            x = x + 1
        y = y + 1
    print(AlignmentParamater)

main()