import os
from pathlib import Path


def main ():
    inputList = '109,424,203,1,21102,11,1,0,1106,0,282,21102,18,1,0,1106,0,259,2102,1,1,221,203,1,21102,1,31,0,1106,0,282,21101,0,38,0,1106,0,259,21001,23,0,2,22101,0,1,3,21101,1,0,1,21102,57,1,0,1106,0,303,2101,0,1,222,21002,221,1,3,20102,1,221,2,21101,259,0,1,21101,0,80,0,1105,1,225,21102,1,83,2,21101,0,91,0,1105,1,303,1202,1,1,223,20102,1,222,4,21101,259,0,3,21101,225,0,2,21102,1,225,1,21101,118,0,0,1106,0,225,21002,222,1,3,21101,179,0,2,21102,1,133,0,1105,1,303,21202,1,-1,1,22001,223,1,1,21101,0,148,0,1105,1,259,1202,1,1,223,21001,221,0,4,20101,0,222,3,21102,1,19,2,1001,132,-2,224,1002,224,2,224,1001,224,3,224,1002,132,-1,132,1,224,132,224,21001,224,1,1,21102,1,195,0,105,1,109,20207,1,223,2,21002,23,1,1,21102,-1,1,3,21102,214,1,0,1106,0,303,22101,1,1,1,204,1,99,0,0,0,0,109,5,2101,0,-4,249,21201,-3,0,1,21202,-2,1,2,22101,0,-1,3,21101,0,250,0,1106,0,225,22101,0,1,-4,109,-5,2106,0,0,109,3,22107,0,-2,-1,21202,-1,2,-1,21201,-1,-1,-1,22202,-1,-2,-2,109,-3,2106,0,0,109,3,21207,-2,0,-1,1206,-1,294,104,0,99,21202,-2,1,-2,109,-3,2105,1,0,109,5,22207,-3,-4,-1,1206,-1,346,22201,-4,-3,-4,21202,-3,-1,-1,22201,-4,-1,2,21202,2,-1,-1,22201,-4,-1,1,21201,-2,0,3,21101,343,0,0,1105,1,303,1106,0,415,22207,-2,-3,-1,1206,-1,387,22201,-3,-2,-3,21202,-2,-1,-1,22201,-3,-1,3,21202,3,-1,-1,22201,-3,-1,2,21201,-4,0,1,21101,384,0,0,1106,0,303,1105,1,415,21202,-4,-1,-4,22201,-4,-3,-4,22202,-3,-2,-2,22202,-2,-4,-4,22202,-3,-2,-3,21202,-4,-1,-2,22201,-3,-2,1,21202,1,1,-4,109,-5,2105,1,0'
    index = 0
    inputCount = 0
    outFilePath = Path("C:/Users/aarong/Advent of Code/Day17/Outfile.txt")
    tractorArray = []
    xMax = 1565 + 100
    yMax = 1052 + 100
    tractorArray = [[0] * yMax for i in range(xMax)]
    x = 1565 - 100
    y = 1052 - 100
    if outFilePath.exists:
        #os.remove(outFilePath)
        print("FileRemoved!!!!!")
    else:
        print("File does not exist.")
    
    while y < yMax:
        x = 1565 - 100
        while x < xMax:
            Array = []
            Array = inputList.split(",")
            for i in range(10000):
                Array.append("0")
            length = len(Array)
            index = 0
            relativeIndex = 0     
            while length - index > 0:
                opCodeReturn = tuple
                FirParamMode = "0"
                SecParamMode = "0"
                ThiParamMode = "0"
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
                        #print("OP CODE 3")
                        if inputCount % 2 == 0:
                            #printStr = "Getting X Input: " + str(x) + " " + str(index)
                            #print(printStr)
                            Array[FirIndex] = x
                        else: 
                            #printStr = "Getting Y Input: " + str(y) + " " + str(index)
                            #print(printStr)
                            Array[FirIndex] = y
                        inputCount = inputCount + 1
                        index += 2
                    elif "4" in opCode:
                        #print("OP CODE 4")
                        #printStr = str(x) + "," + str(y) + " has an output of " + str(Array[FirIndex])
                        #print(printStr)
                        tractorArray[x][y] = Array[FirIndex]
                        #input()
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
                        break
                    elif "9" in opCode:
                        #print("OP CODE 9")
                        relativeIndex = relativeIndex + int(Array[FirIndex])
                        #print(opCode)
                        index += 2   
                    else:
                        print("ERROR IN OP CODE")
                        break
            #inputCount = 0
            x = x + 1
        printStr = str(x) + "," + str(y)
        print(printStr)
        y = y + 1
    x = 1565 - 100
    y = 1052 - 100
    total = 0
    while y < yMax:
        x = 1565 - 100
        printStr = ""
        while x < xMax:
            printStr = printStr + str(tractorArray[x][y])
            total = total + tractorArray[x][y]
            x = x + 1
        print(printStr)
        y = y + 1
    print(total)
    #print(tractorArray)
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

def Op3 ():
    pass

def Op4 ():
    pass

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

def Op9 ():
    pass

def Op99 ():
    pass

main()