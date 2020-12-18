import os
from pathlib import Path


def main ():
    inputList = '3,1033,1008,1033,1,1032,1005,1032,31,1008,1033,2,1032,1005,1032,58,1008,1033,3,1032,1005,1032,81,1008,1033,4,1032,1005,1032,104,99,102,1,1034,1039,1001,1036,0,1041,1001,1035,-1,1040,1008,1038,0,1043,102,-1,1043,1032,1,1037,1032,1042,1106,0,124,1001,1034,0,1039,102,1,1036,1041,1001,1035,1,1040,1008,1038,0,1043,1,1037,1038,1042,1106,0,124,1001,1034,-1,1039,1008,1036,0,1041,1002,1035,1,1040,102,1,1038,1043,1002,1037,1,1042,1106,0,124,1001,1034,1,1039,1008,1036,0,1041,1001,1035,0,1040,1001,1038,0,1043,1002,1037,1,1042,1006,1039,217,1006,1040,217,1008,1039,40,1032,1005,1032,217,1008,1040,40,1032,1005,1032,217,1008,1039,7,1032,1006,1032,165,1008,1040,33,1032,1006,1032,165,1101,2,0,1044,1105,1,224,2,1041,1043,1032,1006,1032,179,1102,1,1,1044,1105,1,224,1,1041,1043,1032,1006,1032,217,1,1042,1043,1032,1001,1032,-1,1032,1002,1032,39,1032,1,1032,1039,1032,101,-1,1032,1032,101,252,1032,211,1007,0,60,1044,1105,1,224,1101,0,0,1044,1106,0,224,1006,1044,247,101,0,1039,1034,101,0,1040,1035,1002,1041,1,1036,1002,1043,1,1038,101,0,1042,1037,4,1044,1105,1,0,92,17,17,33,88,37,85,63,23,14,79,46,37,69,8,6,63,55,61,21,86,19,37,78,49,15,54,28,54,94,91,14,11,40,56,96,20,20,82,28,12,91,68,43,18,63,16,82,71,8,83,88,25,79,67,26,55,33,51,74,68,59,64,58,78,30,65,64,9,48,87,26,85,32,82,92,21,34,99,1,20,66,34,85,65,58,87,12,21,13,51,90,54,19,12,85,3,88,47,31,93,95,49,70,95,55,7,67,2,92,42,80,88,42,24,91,2,59,41,41,70,89,42,83,43,92,44,93,62,26,63,99,81,35,98,70,71,79,8,90,26,66,94,22,47,55,90,93,6,87,92,88,40,73,40,97,14,73,90,31,92,16,35,93,36,27,69,57,97,80,34,58,42,95,34,9,93,22,94,45,79,32,33,90,72,77,58,29,63,56,95,37,61,58,51,57,8,25,86,75,25,63,64,93,57,7,79,85,57,53,97,16,63,40,71,52,23,33,75,13,56,65,90,26,12,66,93,26,36,64,30,10,75,18,77,76,86,33,98,4,23,52,64,66,82,38,90,17,63,94,24,97,20,92,70,63,80,19,73,8,74,93,16,98,77,52,38,90,46,49,76,84,53,50,22,93,19,16,61,47,54,67,56,78,21,77,52,88,4,64,91,90,10,97,10,51,89,15,57,97,22,79,59,92,17,84,71,30,96,58,82,52,93,48,20,62,4,89,64,53,85,37,92,52,89,43,80,86,2,41,81,53,53,82,77,31,66,92,31,44,81,14,49,96,66,42,91,2,61,82,36,32,90,8,61,32,67,52,25,81,15,63,27,59,61,1,15,88,87,62,10,85,47,75,24,46,63,24,77,34,73,34,45,71,10,96,46,43,75,31,23,72,37,87,57,88,63,30,6,86,91,16,53,16,89,81,11,32,75,22,82,69,50,88,53,67,50,65,67,26,81,83,20,14,23,89,98,57,64,3,79,7,69,89,57,1,61,65,14,52,76,66,83,3,57,90,82,53,13,72,94,37,26,97,77,32,53,43,78,22,36,65,83,98,55,82,58,48,24,68,92,18,22,90,65,28,81,33,63,79,3,31,65,92,53,46,74,7,80,37,79,79,83,42,82,84,33,21,79,79,21,81,55,4,95,10,53,84,14,25,86,65,24,74,53,26,61,47,19,66,86,58,99,37,83,35,46,3,11,89,27,66,53,33,67,8,95,44,45,70,71,65,59,49,77,25,3,56,83,39,91,3,52,86,67,57,99,86,40,39,3,99,25,69,94,93,62,36,37,91,17,26,80,98,77,15,5,90,25,40,69,11,85,66,56,40,83,61,10,85,33,28,86,26,41,61,4,86,78,20,71,78,47,94,39,92,26,61,91,52,69,20,47,45,99,38,96,39,98,76,58,28,94,27,47,97,2,45,54,64,94,98,27,69,54,23,72,89,96,22,58,21,16,79,28,45,55,78,75,15,92,67,10,81,80,64,61,13,30,98,65,57,35,4,22,96,72,92,47,51,87,33,78,26,83,20,5,93,22,73,83,68,24,17,61,69,39,62,53,20,95,84,53,83,36,48,99,33,13,42,90,97,87,9,55,64,34,94,7,78,62,42,43,83,54,82,57,24,36,98,95,54,63,75,52,15,40,92,87,77,5,13,93,48,82,71,65,97,96,1,3,68,49,97,9,77,88,99,25,78,4,84,97,77,4,92,91,76,53,71,58,64,55,68,97,96,48,99,2,86,51,69,15,72,42,72,44,86,55,73,0,0,21,21,1,10,1,0,0,0,0,0,0'
    inputDirection = 1
    stepArray = []
    steps = 0
    maxSteps = 0
    hadToPop = 0
    index = 0
    previousStep = 0
    halfway = 0
    relativeIndex = 0
    outFilePath = Path("C:/Users/aarong/Advent of Code/Day13/Outfile.txt")
    #os.remove(outFilePath)
    paintArray = []
    xMax = 42
    yMax = 43
    xHalf = xMax/2
    yHalf = yMax/2
    y = int(yMax)
    x = int(xMax)
    paintArray = [[0] * y for i in range(x)]
    visited = [[0] * y for i in range(x)]
    x = int(xHalf)
    y = int(yHalf)
    if outFilePath.exists == True:
        #os.remove(outFilePath)
        print("FileRemoved!!!!!")
    else:
        print("File does not exist.")

    output = 5
    Array = []
    Array = inputList.split(",")
    for i in range(1000):
        Array.append("0")
    outputCount = 0
    cardinal = "N"
    length = len(Array)
    while length - index > 0:
        opCodeReturn = tuple
        param = 0
        FirParamMode = "0"
        SecParamMode = "0"
        ThiParamMode = "0"
        IndexIncrement = "0"
        opCodeReturn = Instruction(str(Array[index]))
        if "ERROR" in opCodeReturn:
            print(opCodeReturn)
            break
        else:
            ThiParamMode = opCodeReturn[3]
            SecParamMode = opCodeReturn[2]
            FirParamMode = opCodeReturn[1]
            opCode = opCodeReturn[0]
            #print(opCodeReturn)

            #First Index Definition
            if FirParamMode == "0":
                FirIndex = int(Array[index+1])
            elif FirParamMode == "1":
                FirIndex = index+1
            elif FirParamMode == "2":
                FirIndex = relativeIndex + int(Array[index + 1])
            else:
                print("ERROR in First Param.")
                break

            #Secondary Index Definition
            if SecParamMode == "0":
                SecIndex = int(Array[index+2])
            elif SecParamMode == "1":
                SecIndex = index+2
            elif SecParamMode == "2":
                SecIndex = relativeIndex + int(Array[index + 2])
            else:
                print("ERROR in Second Param.")
                break

            #Third Index Definition
            if ThiParamMode == "0":
                ThiIndex = int(Array[index + 3])
            elif ThiParamMode == "1":
                ThiIndex = index+3
                ThiParamLocation = "Immediate Mode"
            elif ThiParamMode == "2":
                ThiIndex = relativeIndex + int(Array[index + 3])
            else:
                print("ERROR in Third Param.")
                break
            if "1" in opCode:
                #print("OP CODE 1")
                #print(opCode)
                #printstr = "Index: " + str(index) + " Setting Element in slot " + str(ThiIndex) + " equal to " + str(Array[FirIndex]) + " + " + str(Array[SecIndex])
                #print(printstr)
                Array[ThiIndex] = Op1(Array[FirIndex], Array[SecIndex])
                index += 4
            elif "2" in opCode:
                #print("OP CODE 2")
                #print(opCode)
                #printstr = "Index: " + str(index) + " Setting Element in slot " + str(ThiIndex) + " equal to " + str(Array[FirIndex]) + " * " + str(Array[SecIndex])
                #print(printstr)
                Array[ThiIndex] = Op2(Array[FirIndex], Array[SecIndex])
                index += 4
            elif "3" in opCode:
                #if cardinal == "N": 1
                #elif cardinal == "S": 2
                #elif cardinal == "W": 3
                #elif cardinal == "E": 4
                # 1 is wall
                # 2 is hall
                
                if output == 0:
                    if paintArray[x][y-1] == 0:
                        inputDirection = 1
                        hadToPop = 0
                    elif paintArray[x+1][y] == 0:
                        inputDirection = 4
                        hadToPop = 0
                    elif paintArray[x][y+1] == 0:
                        inputDirection = 2
                        hadToPop = 0
                    elif paintArray[x-1][y] == 0:
                        inputDirection = 3
                        hadToPop = 0
                    else:
                        previousDirection = stepArray.pop()
                        hadToPop = 1
                        if previousDirection == 1:
                            inputDirection = 2
                        elif previousDirection == 2:
                            inputDirection = 1
                        elif previousDirection == 3:
                            inputDirection = 4
                        elif previousDirection == 4:
                            inputDirection = 3
                        steps = steps - 1
#                    if paintArray[x-1][y] != 0 and paintArray[x+1][y] != 0 and paintArray[x][y-1] != 0 and paintArray[x][y+1] != 0:
#                        if paintArray[x][y-1] == 1:
#                            inputDirection = 1

#                        elif paintArray[x+1][y] == 1:
#                            inputDirection = 4
#                        elif paintArray[x][y+1] == 1:
#                            inputDirection = 2
#                        elif paintArray[x-1][y] == 1:
#                            inputDirection = 3
                    Array[FirIndex] = inputDirection
                elif output == 1:
                    if paintArray[x][y-1] == 0:
                        inputDirection = 1
                        hadToPop = 0
                    elif paintArray[x+1][y] == 0:
                        hadToPop = 0
                        inputDirection = 4
                    elif paintArray[x][y+1] == 0:
                        hadToPop = 0
                        inputDirection = 2
                    elif paintArray[x-1][y] == 0:
                        hadToPop = 0
                        inputDirection = 3
                    else:
                        previousDirection = stepArray.pop()
                        hadToPop = 1
                        if previousDirection == 1:
                            inputDirection = 2
                        elif previousDirection == 2:
                            inputDirection = 1
                        elif previousDirection == 3:
                            inputDirection = 4
                        elif previousDirection == 4:
                            inputDirection = 3
                        steps = steps - 1
#                    if paintArray[x-1][y] != 0 and paintArray[x+1][y] != 0 and paintArray[x][y-1] != 0 and paintArray[x][y+1] != 0:
#                        if paintArray[x][y-1] == 1 and previousStep == 1:
#                            inputDirection = 1
#                        elif paintArray[x+1][y] == 1 and previousStep == 4:
#                            inputDirection = 4
#                        elif paintArray[x][y+1] == 1 and previousStep == 2:
#                            inputDirection = 2
#                        elif paintArray[x-1][y] == 1 and previousStep == 3:
#                            inputDirection = 3
                    Array[FirIndex] = inputDirection          
                elif output == 2:
                    if paintArray[x][y-1] == 0:
                        inputDirection = 1
                        hadToPop = 0
                    elif paintArray[x+1][y] == 0:
                        hadToPop = 0
                        inputDirection = 4
                    elif paintArray[x][y+1] == 0:
                        hadToPop = 0
                        inputDirection = 2
                    elif paintArray[x-1][y] == 0:
                        hadToPop = 0
                        inputDirection = 3
                    else:
                        previousDirection = stepArray.pop()
                        hadToPop = 1
                        if previousDirection == 1:
                            inputDirection = 2
                        elif previousDirection == 2:
                            inputDirection = 1
                        elif previousDirection == 3:
                            inputDirection = 4
                        elif previousDirection == 4:
                            inputDirection = 3
                        steps = steps - 1
                elif output == 5:
                    Array[FirIndex] = inputDirection
                index += 2
            elif "4" in opCode:
                #print("OP CODE 4")
                #print(opCode)
                #First output is color second output is direction.
                #Color outputs 1 = white. 0=Black
                #Direction 0 = Left. 1 = Right
                drone = 3
                #print(str(Array[FirIndex]))
                if Array[FirIndex] == 0:
                    if inputDirection == 1:
                        paintArray[x][y-1] = 2
                        if paintArray[x][y] == 4:
                            paintArray[x][y] = 4
                        else:
                            paintArray[x][y] = drone
                    elif inputDirection == 2:
                        paintArray[x][y+1] = 2
                        if paintArray[x][y] == 4:
                            paintArray[x][y] = 4
                        else:
                            paintArray[x][y] = drone
                    elif inputDirection == 3:
                        paintArray[x-1][y] = 2
                        if paintArray[x][y] == 4:
                            paintArray[x][y] = 4
                        else:
                            paintArray[x][y] = drone
                    elif inputDirection == 4:
                        paintArray[x+1][y] = 2
                        if paintArray[x][y] == 4:
                            paintArray[x][y] = 4
                        else:
                            paintArray[x][y] = drone

                elif Array[FirIndex] == 1:
                    if hadToPop == 0:
                        stepArray.append(inputDirection)                    
                    if inputDirection == 1:
                        if paintArray[x][y] == 4:
                            paintArray[x][y] = 4
                        else:
                            paintArray[x][y] = 1
                        y = y - 1
                        if paintArray[x][y] == 1:
                            pass
                        else:
                            steps = steps + 1
                        paintArray[x][y] = drone
                        previousStep = 1
                    elif inputDirection == 2:
                        if paintArray[x][y] == 4:
                            paintArray[x][y] = 4
                        else:
                            paintArray[x][y] = 1
                        y = y + 1
                        if paintArray[x][y] == 1:
                            pass
                        else:
                            steps = steps + 1
                        paintArray[x][y] = drone
                        previousStep = 2
                    elif inputDirection == 3:
                        if paintArray[x][y] == 4:
                            paintArray[x][y] = 4
                        else:
                            paintArray[x][y] = 1
                        x = x -1
                        if paintArray[x][y] == 1:
                            pass
                        else:
                            steps = steps + 1
                        paintArray[x][y] = drone
                        previousStep = 3
                    elif inputDirection == 4:
                        if paintArray[x][y] == 4:
                            paintArray[x][y] = 4
                        else:
                            paintArray[x][y] = 1
                        x = x + 1
                        if paintArray[x][y] == 1:
                            pass
                        else:
                            steps = steps + 1
                            if maxSteps < steps:
                                maxSteps = steps
                        paintArray[x][y] = drone
                        previousStep = 4
                elif Array[FirIndex] == 2:
                    halfway = 1
                    paintArray = [[0] * yMax for i in range(xMax)]
                    visited = [[0] * yMax for i in range(xMax)]
                    paintArray[x][y] = drone
                    inputDirection = 1
                    stepArray = []
                Painting(paintArray,yMax,xMax,steps)
                print(maxSteps)
                #print(steps)
                output = Array[FirIndex]
                outputCount += 1
                print(inputDirection)
                if halfway == 1:
                    inputDirection = input()
                #print(stepArray)
                #print(Array[FirIndex])
                #print(inputDirection)
                #print(x)
                #print(y)
                #print(printstr)
                
                index += 2
            elif "5" in opCode:
                #print("OP CODE 5")
                #print(opCode)
                newIndex = Op5(Array[FirIndex], Array[SecIndex], index)
                printstr = "Index: " + str(index) + " - Op 5 Setting index to " + str(newIndex) + "\r\nFirst Paramater " + str(FirIndex) + ", " + str(Array[FirIndex]) + "\r\nSecond Paramater " + str(SecIndex) + ", " + str(Array[SecIndex]) + "\r\nIf first param is non-zero jump to second."
                #print(printstr)
                index = newIndex
                #print(index)
                #print("")
            elif "6" in opCode:
                #print("OP CODE 6")
                #print(opCode)
                newIndex = Op6(Array[FirIndex], Array[SecIndex], index)
                printstr = "Index: " + str(index) + " - Op 6 Setting index to " + str(newIndex) + "\r\nFirst Paramater " + str(FirIndex) + ", " + str(Array[FirIndex]) + "\r\nSecond Paramater " + str(SecIndex) + ", " + str(Array[SecIndex]) +"\r\nIf first param is zero jump to second."
                #print(printstr)
                index = newIndex
                #print(index)
                #print("")
            elif "7" in opCode:
                #print("OP CODE 7")
                #print(opCode)
                Array[ThiIndex] = Op7(Array[FirIndex], Array[SecIndex])
                index += 4
            elif "8" in opCode:
                #print("OP CODE 8")
                #print(opCode)
                Array[ThiIndex] = Op8(Array[FirIndex], Array[SecIndex])
                index += 4
            elif "99" in opCode:
                #print("OP CODE 99")
                #print("249 is too low, 9971 is too high, and 4532 is wrong, 5438.")
                #print(paintedCount)
                #print(c)
                #print(opCode)
                printstr = "I have taken: " + str(steps)
                print(printstr)
                break
            elif "9" in opCode:
                #print("OP CODE 9")
                relativeIndex = relativeIndex + int(Array[FirIndex])
                #print(opCode)
                index += 2   
            else:
                print("ERROR IN OP CODE")
                break
    count = 0
    x = 0
    y = 0
    f=open(outFilePath, "a+")
    while y < yMax:
        x = 0 
        printstr = ""
        while x < xMax:
            printstr +=str(paintArray[x][y])
            x += 1
        f.write(str(printstr))
        f.write("\n")
        y += 1
    f.close
    y = 0
    x = 0
    while y < yMax:
        x = 0
        while x < xMax:
            count = count + int(paintOnceArray[x][y])
            x += 1
        y += 1
    print(count)
def Instruction (instruction):
    if len(instruction) == 1:
        return instruction, "0", "0", "0"
    elif len(instruction) == 2:
        return instruction, "0", "0", "0"
    elif len(instruction) == 3:
        return instruction[1:3] , str(instruction[0]), "0", "0"
    elif len(instruction) == 4:
        return instruction[2:4], str(instruction[1]), str(instruction[0]), "0"
    elif len(instruction) == 5:
        return instruction[3:5], str(instruction[2]), str(instruction[1]), str(instruction[0])
    else:
        return "ERROR IN OP CODE PARSING"


def Op1 (one, two):
    three = int(one) + int(two)
    return three

def Op2 (one, two):
    three = int(one) * int(two)
    return three

def Op5 (one, two, index):
    #print(one)
    #print(two)
    if int(one) != 0:
        indexIncrement = int(two)
        return indexIncrement
    else:
        return index + 3

def Op6 (one, two, index):
    if int(one) == 0:
        return int(two)
    else:
        return index + 3

def Op7 (one, two):
    if int(one) < int(two):
        return 1
    else:
        return 0

def Op8 (one, two):
    if int(one) == int(two):
        return 1
    else:
        return 0

def Painting(boardArray, yMax,xMax, steps):
    y = 0
    x = 0
    printstr = ""
    os.system('cls')
    while y < yMax:
        x = 0
        while x < xMax:
            if boardArray[x][y] == 1:
                printstr = printstr + "."
            elif boardArray[x][y] == 0:
                printstr = printstr + "?"
            elif boardArray[x][y] == 2:
                #print("HERE")
                printstr = printstr + "#"
            elif boardArray[x][y] == 3:
                printstr = printstr + "D"
            elif boardArray[x][y] == 4:
                printstr = printstr + "X"
            x = x + 1
        printstr = printstr + "\r\n"
        y = y + 1
    print(printstr)
    printstr = "I have taken: " + str(steps)
    print(printstr)


main()