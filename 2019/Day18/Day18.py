import os
from pathlib import Path
import math


def main ():
    inputFile = Path("C:/Users/aarong/Advent of Code/Day18/Input.txt")
    inputMaze = []
    keysFound = []
    keysNotFound = []
    xMax = 10
    yMax = 3
    inputMaze = [[0] * yMax for i in range(xMax)]
    f = open(inputFile, "r")
    y = 0
    for l in f:
        x = 0
        for c in l:
            inputMaze[x][y] = c
            x = x + 1
        y = y + 1
    origin = FindOrigin(inputMaze, xMax, yMax)
    StartMovement(inputMaze, origin, xMax, yMax)

def FindOrigin(inputMaze, xMax, yMax):
    y = 0
    while y < yMax:
        x = 0
        while x < xMax:
            if inputMaze[x][y] == "@":
                originR = str(x) + "," + str(y)
                return originR
            x = x + 1
        y = y + 1

def StartMovement(inputMaze, origin, xMax, yMax):
    previousDirection = ""
    directions = PossibleDirections(inputMaze, origin, xMax, yMax, previousDirection)
    directions = directions
    directions = directions.split(",")
    opt = len(directions) - 1
    c = 0
    while c < opt:
        Movement(inputMaze, origin, xMax, yMax,directions[c])
        c = c + 1
    print(directions)

def PossibleDirections(inputMaze, origin, xMax, yMax, previousDirection):
    directionPossible = ""
    origin = origin.split(",")
    originX = int(origin[0])
    originY = int(origin[1])
    
    if inputMaze[originX - 1][originY] == ".":
        directionPossible += "left,"
    
    if inputMaze[originX + 1][originY] == ".":
        directionPossible += "right,"
    
    if inputMaze[originX][originY - 1] == ".":
        directionPossible += "up,"
    
    if inputMaze[originX][originY + 1] == ".":
        directionPossible += "down,"
    
    return directionPossible

def Movement(inputMaze, origin, xMax, yMax,direction):
    origin = origin.split(",")
    x = int(origin[0])
    y = int(origin[1])
    movementArray = inputMaze.
    if direction == "up":
        movementArray[x][y-1] = "@"
        movementArray[x][y] = "."
    elif direction == "down":
        movementArray[x][y+1] = "@"
        movementArray[x][y] = "."
    elif direction == "right":
        movementArray[x+1][y] = "@"
        movementArray[x][y] = "."
    elif direction == "left":
        movementArray[x-1][y] = "@"
        movementArray[x][y] = "."
    y=0
    printStr = ""
    print(direction)
    while y < yMax:
        x = 0
        while x < xMax:
            printStr = printStr + str(movementArray[x][y]) 
            x = x + 1
        #printStr = printStr + "\r\n"
        y = y + 1
    print(printStr)
main ()