import os
from pathlib import Path
import math

def main ():
    x = 0
    y = 0
    floatTest = 1
    xTop = 1465 + 198
    testTop = 1465+58
    testBot = (1052 - 100) + 70
    yTop = 952 + 96
    xBot = 1465 + 98
    yBot = 952 + 198
    slopeTop = yTop/xTop
    slopeBot = yBot/xBot
    testVal = 200
    distanceMet = 0
    distanceNeeded = math.sqrt(100**2+100**2)
    while distanceMet == 0:
        print(testVal)
        xTestTop = testVal
        xTestBot = testVal - 100
        yTestTop = slopeTop * xTestTop
        if yTestTop % 1 >= 0.5:
            yTestTop = int(yTestTop + 1)
        else:
            yTestTop = int(yTestTop)
        yTestBot = slopeBot * xTestBot
        if yTestBot % 1 >= 0.5:
            yTestBot = int(yTestBot + 1)
        else:
            yTestBot = int(yTestBot)
        actualDistance = math.sqrt((xTestBot - xTestTop)**2+(yTestTop - yTestBot)**2)
        if int(actualDistance) == int(distanceNeeded) :
            print("I think I found it")
            print(xTestTop)
            print(yTestTop)
            print(xTestBot)            
            print(yTestBot)
            answer = testTop * 10000 + testBot
            print("15651052 too high, 15221122 to low, 15261024 to high, ")
            print(answer)
            distanceMet = 1
        else:
            testVal = testVal + 1
        
    #print(yTestTop)
    #print(yTestBot)
    #Top line formula is y = slopeTop * x
    #Bot formula is y = slopeBot * x
    #I need to know the first place where the distance between x and y is sqrt(100^2+100^2) = 
    
    
    

main()