import os
from pathlib import Path


def main ():
    inputList = '1102,34463338,34463338,63,1007,63,34463338,63,1005,63,53,1102,1,3,1000,109,988,209,12,9,1000,209,6,209,3,203,0,1008,1000,1,63,1005,63,65,1008,1000,2,63,1005,63,904,1008,1000,0,63,1005,63,58,4,25,104,0,99,4,0,104,0,99,4,17,104,0,99,0,0,1102,31,1,1009,1101,35,0,1006,1102,1,23,1002,1101,0,32,1013,1101,0,37,1003,1101,0,620,1029,1101,0,28,1011,1102,22,1,1016,1102,1,0,1020,1102,1,34,1007,1102,1,417,1026,1102,1,25,1000,1101,27,0,1010,1102,580,1,1025,1102,1,629,1028,1101,20,0,1004,1102,899,1,1022,1101,26,0,1001,1102,410,1,1027,1102,39,1,1018,1101,0,30,1008,1101,0,38,1014,1101,1,0,1021,1102,29,1,1017,1101,0,36,1012,1101,585,0,1024,1101,0,21,1005,1101,0,892,1023,1102,1,33,1019,1101,24,0,1015,109,17,1206,3,195,4,187,1105,1,199,1001,64,1,64,1002,64,2,64,109,-7,2108,30,-2,63,1005,63,217,4,205,1105,1,221,1001,64,1,64,1002,64,2,64,109,6,1206,5,233,1106,0,239,4,227,1001,64,1,64,1002,64,2,64,109,-16,1202,9,1,63,1008,63,34,63,1005,63,259,1105,1,265,4,245,1001,64,1,64,1002,64,2,64,109,8,1207,-2,34,63,1005,63,285,1001,64,1,64,1105,1,287,4,271,1002,64,2,64,109,-4,1207,-3,27,63,1005,63,305,4,293,1105,1,309,1001,64,1,64,1002,64,2,64,109,-1,21107,40,41,9,1005,1012,331,4,315,1001,64,1,64,1105,1,331,1002,64,2,64,109,5,2107,19,-4,63,1005,63,349,4,337,1106,0,353,1001,64,1,64,1002,64,2,64,109,1,1208,-5,20,63,1005,63,371,4,359,1105,1,375,1001,64,1,64,1002,64,2,64,109,-2,21101,41,0,9,1008,1016,41,63,1005,63,397,4,381,1106,0,401,1001,64,1,64,1002,64,2,64,109,25,2106,0,-5,1001,64,1,64,1105,1,419,4,407,1002,64,2,64,109,-30,2102,1,0,63,1008,63,26,63,1005,63,439,1106,0,445,4,425,1001,64,1,64,1002,64,2,64,109,2,2108,32,4,63,1005,63,465,1001,64,1,64,1105,1,467,4,451,1002,64,2,64,109,-11,1201,10,0,63,1008,63,34,63,1005,63,491,1001,64,1,64,1106,0,493,4,473,1002,64,2,64,109,27,21102,42,1,-1,1008,1019,42,63,1005,63,515,4,499,1105,1,519,1001,64,1,64,1002,64,2,64,109,-6,1201,-7,0,63,1008,63,34,63,1005,63,545,4,525,1001,64,1,64,1106,0,545,1002,64,2,64,109,-15,1202,3,1,63,1008,63,23,63,1005,63,567,4,551,1105,1,571,1001,64,1,64,1002,64,2,64,109,33,2105,1,-8,4,577,1106,0,589,1001,64,1,64,1002,64,2,64,109,-19,1208,-4,34,63,1005,63,605,1105,1,611,4,595,1001,64,1,64,1002,64,2,64,109,7,2106,0,8,4,617,1001,64,1,64,1106,0,629,1002,64,2,64,109,-8,1205,9,647,4,635,1001,64,1,64,1106,0,647,1002,64,2,64,109,-12,2107,38,3,63,1005,63,667,1001,64,1,64,1106,0,669,4,653,1002,64,2,64,109,-3,2102,1,10,63,1008,63,34,63,1005,63,695,4,675,1001,64,1,64,1105,1,695,1002,64,2,64,109,14,21108,43,45,4,1005,1015,711,1105,1,717,4,701,1001,64,1,64,1002,64,2,64,109,13,1205,-4,733,1001,64,1,64,1105,1,735,4,723,1002,64,2,64,109,-30,2101,0,9,63,1008,63,37,63,1005,63,761,4,741,1001,64,1,64,1106,0,761,1002,64,2,64,109,17,21102,44,1,1,1008,1012,45,63,1005,63,785,1001,64,1,64,1106,0,787,4,767,1002,64,2,64,109,5,2101,0,-9,63,1008,63,35,63,1005,63,811,1001,64,1,64,1106,0,813,4,793,1002,64,2,64,109,2,21107,45,44,-5,1005,1013,833,1001,64,1,64,1106,0,835,4,819,1002,64,2,64,109,-2,21101,46,0,-6,1008,1010,44,63,1005,63,855,1106,0,861,4,841,1001,64,1,64,1002,64,2,64,109,2,21108,47,47,-8,1005,1010,883,4,867,1001,64,1,64,1106,0,883,1002,64,2,64,109,2,2105,1,3,1001,64,1,64,1106,0,901,4,889,4,64,99,21102,27,1,1,21102,1,915,0,1105,1,922,21201,1,28815,1,204,1,99,109,3,1207,-2,3,63,1005,63,964,21201,-2,-1,1,21102,1,942,0,1105,1,922,21202,1,1,-1,21201,-2,-3,1,21101,0,957,0,1105,1,922,22201,1,-1,-2,1106,0,968,21202,-2,1,-2,109,-3,2106,0,0'
    nextInput = 0
    index = 0
    relativeIndex = 0
    outFilePath = Path("C:/Users/aarong/Advent of Code/Day11/Outfile.txt")
    if outFilePath.exists == True:
        os.remove(outFilePath)
        print("FileRemoved!!!!!")
    else:
        print("File does not exist.")

    outputs = []
    Array = []
    Array = inputList.split(",")
    for i in range(1000):
        Array.append("0")
    #x = 0
    #y = 0
    #c = 0
    loopCount = 0
    #cardinal = "N"
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
                print("OP CODE 1")
                #print(opCode)
                printstr = "Index: " + str(index) + " Setting Element in slot " + str(ThiIndex) + " equal to " + str(Array[FirIndex]) + " + " + str(Array[SecIndex])
                print(printstr)
                Array[ThiIndex] = Op1(Array[FirIndex], Array[SecIndex])
                index += 4
            elif "2" in opCode:
                print("OP CODE 2")
                #print(opCode)
                printstr = "Index: " + str(index) + " Setting Element in slot " + str(ThiIndex) + " equal to " + str(Array[FirIndex]) + " * " + str(Array[SecIndex])
                print(printstr)
                Array[ThiIndex] = Op2(Array[FirIndex], Array[SecIndex])
                index += 4
            elif "3" in opCode:
                print("OP CODE 3")
                #print(opCode)
                Array[FirIndex] = 2
                index += 2
            elif "4" in opCode:
                print("OP CODE 4")
                #print(opCode)
                print("OUTPUT")
                print(Array[FirIndex])
                index += 2
            elif "5" in opCode:
                print("OP CODE 5")
                #print(opCode)
                newIndex = Op5(Array[FirIndex], Array[SecIndex], index)
                printstr = "Index: " + str(index) + " - Op 5 Setting index to " + str(newIndex) + "\r\nFirst Paramater " + str(FirIndex) + ", " + str(Array[FirIndex]) + "\r\nSecond Paramater " + str(SecIndex) + ", " + str(Array[SecIndex]) + "\r\nIf first param is non-zero jump to second."
                print(printstr)
                index = newIndex
                print(index)
                print("")
            elif "6" in opCode:
                print("OP CODE 6")
                #print(opCode)
                newIndex = Op6(Array[FirIndex], Array[SecIndex], index)
                printstr = "Index: " + str(index) + " - Op 6 Setting index to " + str(newIndex) + "\r\nFirst Paramater " + str(FirIndex) + ", " + str(Array[FirIndex]) + "\r\nSecond Paramater " + str(SecIndex) + ", " + str(Array[SecIndex]) +"\r\nIf first param is zero jump to second."
                print(printstr)
                index = newIndex
                print(index)
                print("")
            elif "7" in opCode:
                print("OP CODE 7")
                #print(opCode)
                Array[ThiIndex] = Op7(Array[FirIndex], Array[SecIndex])
                index += 4
            elif "8" in opCode:
                print("OP CODE 8")
                #print(opCode)
                Array[ThiIndex] = Op8(Array[FirIndex], Array[SecIndex])
                index += 4
            elif "99" in opCode:
                print("OP CODE 99")
                #print(opCode)
                break
            elif "9" in opCode:
                print("OP CODE 9")
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
    print(one)
    print(two)
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