import os
from pathlib import Path


def main ():
    outStr = ""
    inputList = '2,330,331,332,109,3438,1102,1182,1,16,1101,1449,0,24,101,0,0,570,1006,570,36,101,0,571,0,1001,570,-1,570,1001,24,1,24,1105,1,18,1008,571,0,571,1001,16,1,16,1008,16,1449,570,1006,570,14,21101,58,0,0,1106,0,786,1006,332,62,99,21102,333,1,1,21102,73,1,0,1106,0,579,1101,0,0,572,1101,0,0,573,3,574,101,1,573,573,1007,574,65,570,1005,570,151,107,67,574,570,1005,570,151,1001,574,-64,574,1002,574,-1,574,1001,572,1,572,1007,572,11,570,1006,570,165,101,1182,572,127,101,0,574,0,3,574,101,1,573,573,1008,574,10,570,1005,570,189,1008,574,44,570,1006,570,158,1105,1,81,21101,0,340,1,1106,0,177,21101,0,477,1,1105,1,177,21101,0,514,1,21102,1,176,0,1105,1,579,99,21102,1,184,0,1106,0,579,4,574,104,10,99,1007,573,22,570,1006,570,165,101,0,572,1182,21101,0,375,1,21102,211,1,0,1106,0,579,21101,1182,11,1,21102,222,1,0,1106,0,979,21102,1,388,1,21102,233,1,0,1105,1,579,21101,1182,22,1,21101,244,0,0,1105,1,979,21102,401,1,1,21102,255,1,0,1105,1,579,21101,1182,33,1,21102,1,266,0,1105,1,979,21102,1,414,1,21101,277,0,0,1106,0,579,3,575,1008,575,89,570,1008,575,121,575,1,575,570,575,3,574,1008,574,10,570,1006,570,291,104,10,21101,1182,0,1,21102,1,313,0,1106,0,622,1005,575,327,1101,1,0,575,21102,327,1,0,1105,1,786,4,438,99,0,1,1,6,77,97,105,110,58,10,33,10,69,120,112,101,99,116,101,100,32,102,117,110,99,116,105,111,110,32,110,97,109,101,32,98,117,116,32,103,111,116,58,32,0,12,70,117,110,99,116,105,111,110,32,65,58,10,12,70,117,110,99,116,105,111,110,32,66,58,10,12,70,117,110,99,116,105,111,110,32,67,58,10,23,67,111,110,116,105,110,117,111,117,115,32,118,105,100,101,111,32,102,101,101,100,63,10,0,37,10,69,120,112,101,99,116,101,100,32,82,44,32,76,44,32,111,114,32,100,105,115,116,97,110,99,101,32,98,117,116,32,103,111,116,58,32,36,10,69,120,112,101,99,116,101,100,32,99,111,109,109,97,32,111,114,32,110,101,119,108,105,110,101,32,98,117,116,32,103,111,116,58,32,43,10,68,101,102,105,110,105,116,105,111,110,115,32,109,97,121,32,98,101,32,97,116,32,109,111,115,116,32,50,48,32,99,104,97,114,97,99,116,101,114,115,33,10,94,62,118,60,0,1,0,-1,-1,0,1,0,0,0,0,0,0,1,12,16,0,109,4,1202,-3,1,586,21001,0,0,-1,22101,1,-3,-3,21101,0,0,-2,2208,-2,-1,570,1005,570,617,2201,-3,-2,609,4,0,21201,-2,1,-2,1106,0,597,109,-4,2106,0,0,109,5,1201,-4,0,630,20102,1,0,-2,22101,1,-4,-4,21102,1,0,-3,2208,-3,-2,570,1005,570,781,2201,-4,-3,653,20101,0,0,-1,1208,-1,-4,570,1005,570,709,1208,-1,-5,570,1005,570,734,1207,-1,0,570,1005,570,759,1206,-1,774,1001,578,562,684,1,0,576,576,1001,578,566,692,1,0,577,577,21102,702,1,0,1106,0,786,21201,-1,-1,-1,1106,0,676,1001,578,1,578,1008,578,4,570,1006,570,724,1001,578,-4,578,21102,1,731,0,1105,1,786,1106,0,774,1001,578,-1,578,1008,578,-1,570,1006,570,749,1001,578,4,578,21102,756,1,0,1106,0,786,1106,0,774,21202,-1,-11,1,22101,1182,1,1,21102,1,774,0,1106,0,622,21201,-3,1,-3,1105,1,640,109,-5,2105,1,0,109,7,1005,575,802,20101,0,576,-6,20101,0,577,-5,1106,0,814,21101,0,0,-1,21102,0,1,-5,21102,0,1,-6,20208,-6,576,-2,208,-5,577,570,22002,570,-2,-2,21202,-5,51,-3,22201,-6,-3,-3,22101,1449,-3,-3,1202,-3,1,843,1005,0,863,21202,-2,42,-4,22101,46,-4,-4,1206,-2,924,21102,1,1,-1,1105,1,924,1205,-2,873,21101,0,35,-4,1106,0,924,1202,-3,1,878,1008,0,1,570,1006,570,916,1001,374,1,374,1201,-3,0,895,1102,2,1,0,2102,1,-3,902,1001,438,0,438,2202,-6,-5,570,1,570,374,570,1,570,438,438,1001,578,558,922,20102,1,0,-4,1006,575,959,204,-4,22101,1,-6,-6,1208,-6,51,570,1006,570,814,104,10,22101,1,-5,-5,1208,-5,39,570,1006,570,810,104,10,1206,-1,974,99,1206,-1,974,1101,1,0,575,21101,973,0,0,1106,0,786,99,109,-7,2106,0,0,109,6,21102,1,0,-4,21102,1,0,-3,203,-2,22101,1,-3,-3,21208,-2,82,-1,1205,-1,1030,21208,-2,76,-1,1205,-1,1037,21207,-2,48,-1,1205,-1,1124,22107,57,-2,-1,1205,-1,1124,21201,-2,-48,-2,1105,1,1041,21101,-4,0,-2,1106,0,1041,21102,-5,1,-2,21201,-4,1,-4,21207,-4,11,-1,1206,-1,1138,2201,-5,-4,1059,1202,-2,1,0,203,-2,22101,1,-3,-3,21207,-2,48,-1,1205,-1,1107,22107,57,-2,-1,1205,-1,1107,21201,-2,-48,-2,2201,-5,-4,1090,20102,10,0,-1,22201,-2,-1,-2,2201,-5,-4,1103,2101,0,-2,0,1106,0,1060,21208,-2,10,-1,1205,-1,1162,21208,-2,44,-1,1206,-1,1131,1106,0,989,21102,439,1,1,1105,1,1150,21101,0,477,1,1106,0,1150,21102,514,1,1,21102,1,1149,0,1105,1,579,99,21102,1,1157,0,1106,0,579,204,-2,104,10,99,21207,-3,22,-1,1206,-1,1138,1201,-5,0,1176,2102,1,-4,0,109,-6,2105,1,0,38,7,44,1,5,1,44,1,5,1,44,1,5,1,44,1,5,1,44,1,5,1,44,1,5,1,44,1,5,1,20,9,9,7,5,1,28,1,9,1,11,1,28,1,9,1,9,9,22,1,9,1,9,1,1,1,5,1,22,1,9,1,5,7,5,1,22,1,9,1,5,1,3,1,7,1,22,13,3,1,3,1,7,1,32,1,1,1,3,1,3,1,7,14,19,9,1,1,7,2,33,1,3,1,1,1,1,1,7,2,17,7,9,1,3,5,1,8,17,1,5,1,9,1,5,1,3,1,6,1,15,5,3,1,9,7,3,1,6,1,15,1,1,1,1,1,3,1,19,1,6,9,7,1,1,9,17,1,14,1,7,1,3,1,3,1,1,1,17,1,14,1,7,1,3,1,3,13,7,1,14,1,7,1,3,1,5,1,9,1,7,1,14,1,5,7,5,1,9,1,7,1,14,1,5,1,1,1,9,1,9,1,7,1,14,9,9,1,9,1,7,1,20,1,11,1,9,1,7,1,20,1,5,7,9,9,20,1,5,1,44,1,5,1,44,1,5,1,44,1,5,1,44,1,5,1,44,1,5,1,44,1,5,1,44,7,30'
    nextInput = 0
    index = 0
    val = 0
    relativeIndex = 0
    c = 0
    paintedCount = 0
    outFilePath = Path("C:/Users/aarong/Advent of Code/Day17/Outfile.txt")
    paintArray = []
    xMax = 43
    yMax = 25
    xHalf = xMax/2
    yHalf = yMax/2
    y = int(yMax)
    x = int(xMax)
    paintArray = [[0] * y for i in range(x)]
    paintOnceArray = [[0] * y for i in range(x)]
    x = int(xHalf)
    y = int(yHalf)
    if outFilePath.exists:
        #os.remove(outFilePath)
        print("FileRemoved!!!!!")
    else:
        print("File does not exist.")

    outputs = []
    Array = []
    Array = inputList.split(",")
    for i in range(10000):
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
                print("OP CODE 3")
                inputMain = "65,44,66,44,65,44,66,44,67,44,67,44,66,44,65,44,66,44,67,10"
                inputA = ",76,44,56,44,52,44,76,44,54,44,76,44,56,44,82,44,54,10"
                inputB = ",76,44,56,44,76,44,56,44,82,44,52,44,82,44,54,44,82,44,54,10"
                inputC = ",76,44,56,44,52,44,82,44,54,44,76,44,56,10"
                inputF = ",110,10"
                inputMain = inputMain + inputA + inputB + inputC + inputF
                inputMain = inputMain.split(",")
                #print(opCode)
                #Input from a two dimensional array.
                #I need to input the color of the square I am going into.
                print(inputMain[val])
                Array[FirIndex] = str(inputMain[int(val)])
                val += 1
                index += 2
            elif "4" in opCode:
                #print("OP CODE 4")
                #print(opCode)
                #First output is color second output is direction.
                #Color outputs 1 = white. 0=Black
                #Direction 0 = Left. 1 = Right

                #if str(Array[FirIndex]) == "35":
                #    outStr = outStr + str(chr(Array[FirIndex]))
                #elif str(Array[FirIndex]) == "46":
                #    outStr = outStr + "."
                if Array[FirIndex] == "10":
                    print(outStr)
                    outStr = ""
                #elif Array[FirIndex] == 94:
                #    outStr = outStr + "^"
                #elif Array[FirIndex] == "77":
                #    outStr = outStr + "M"
                #elif Array[FirIndex] == "97":
                #    outStr = outStr + "a"
                #elif Array[FirIndex] == "105":
                #    outStr = outStr + "i"
                #elif Array[FirIndex] == "110":
                #    outStr = outStr + "n"
                #elif Array[FirIndex] == "58":
                #    outStr = outStr + ":"
                else:
                    #print("Error")
                    #print(str(Array[FirIndex]))
                    finalAnswer = Array[FirIndex]
                    outStr = outStr + str(chr(int(Array[FirIndex])))
                #outputCount += 1
                
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
                print("OP CODE 99")
                #print("249 is too low, 9971 is too high, and 4532 is wrong, 5438.")
                #print(paintedCount)
                #print(c)
                #print(opCode)
                print(outStr)
                print(finalAnswer)
                break
            elif "9" in opCode:
                #print("OP CODE 9")
                relativeIndex = relativeIndex + int(Array[FirIndex])
                #print(opCode)
                index += 2   
            else:
                print("ERROR IN OP CODE")
                break

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