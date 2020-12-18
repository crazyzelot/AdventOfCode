import os
from pathlib import Path
import fnmatch

def main ():
    #0,1,0,-1
    origInput = input("Give eight numbers.")
    phase = int(input("How many phases?"))
    multi = 0
    firstInput = ""
    while multi < 10000:
        firstInput += origInput
        multi += 1
    print("Done Multiplying")
    p = 0
    while p < phase:
        iterations = 1
        output = ""
        #print(firstInput)
        counter = 0
        for i in firstInput:
            patternBuilder = patternBuild(iterations)
            #print(len(patternBuilder))
            #print(len(firstInput))
            while len(patternBuilder) < int((len(firstInput)*2.25)):
                patternBuilder = patternBuilder + "," + patternBuilder
            patternBuilder = patternBuilder.split(",")
            c = 0
            result = 0
            #print(firstInput)
            #print(patternBuilder)
            for x in firstInput:
                #printstr = "You are multiplying " + str(patternBuilder[c+1]) + " by " + str(firstInput[c])
                #print(printstr)
                #print(len(patternBuilder))
                #print(len(firstInput))
                result = result + (int(patternBuilder[c+1]) * int(firstInput[c]))
                #printstr = "This gives you a net result of " + str(result)
                #print(printstr)
                c += 1
            result = abs((abs(int(result)) % 10))
            #print(result)
            output += str(result)
            iterations += 1
            counter += 1
        print(p)
        firstInput = output
        #print(firstInput)
        p += 1
    print(output)
    print(output[0:7])
    ofset = int(output[0:7]) + 1
    message = output[ofset:ofset+10]
    print(message)
    #32201576181190016443492260218971682877572722601899359371551495354219607692471736921100566504384043941818936525464915918379742732331575625975430644707751232286822584568182690149858279785425794077353260690659221465545974028619382257408480822488337747330301174927278185726336591815671493051361250762315628108441662331123060407460786051451221743382665103369479351228695839440762926354101291383360914159350943158232080845637909919832452977745739420827009806047191463734492835633116956718521577450375687694377191702322922356152811651199135179615397083471661005421825918999425584848063514819780342137781262985813726994196144108238013383271922378476793989037

def patternBuild(iterations):
    basePattern = "0,1,0,-1,"
    basePattern = basePattern.split(",")
    pattern = ""
    c = 0
    while c < iterations:
        if c == 0:
            pattern = str(pattern)  + str(basePattern[0])
        else:
            pattern = str(pattern) + "," + str(basePattern[0])
        c += 1
    c = 0
    while c < iterations:
        pattern = str(pattern) + "," + str(basePattern[1])
        c += 1
    c = 0
    while c < iterations:
        pattern = str(pattern) + "," + str(basePattern[2])
        c += 1
    c = 0
    while c < iterations:
        pattern = str(pattern) + "," + str(basePattern[3])
        c += 1
    return str(pattern)

main ()
