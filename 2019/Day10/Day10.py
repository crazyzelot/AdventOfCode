import math 
#Read in the input variable
def main():
    asteroids = []
    y= 0
    x= 0
    maxSightings = 0
    printstr = ""
    f= open("Day10\InputFile.txt", "r")
    for line in f:
        x = 0
        for char in line:
            printstr = ""
            if char == '#':
                printstr= str(x)+","+str(y)
                asteroids.append(printstr)
                #print(asteroids)
            elif char =='.':
                printstr1= str(x)+","+str(y)
                #print(printstr1)
            x = x + 1
        y= y + 1
    f.close
    done = 1
    blockingAsteroids = asteroids
    #print(asteroids)
    #for aster in asteroids:
    #'20', '20' is the correct origin
    origin = "20,20"
    origin = origin.split(",")
    if done == 1:
        totalSightings = 0
        Sightings = []
        xOrigin = int(origin[0])
        yOrigin = int(origin[1])
        print(len(asteroids))
        for asteroid in asteroids:
            asteroid = asteroid.split(",")
            degree = 0.0
            AsteroidDistance = 0
            Horizontal = 0
            blocked = 0
            if blocked == 0:
                PotentialGood = 1
                if done == 1:
                    #translates to Origin = 0,0
                    xAsteroid = int(asteroid[0]) - xOrigin
                    yAsteroid = int(asteroid[1]) - yOrigin
                    AsteroidQuadrant = quadrant(xAsteroid, yAsteroid)
                    if origin == asteroid:pass
                    AsteroidDistance = distance(xOrigin,yOrigin,xAsteroid,yAsteroid)
                    Horizontal = horizontalOrVert(xAsteroid,yAsteroid)
                    if Horizontal != 0:pass
                    else:
                        degree = angle(xAsteroid, yAsteroid)
                        printstr = "The angle of the Asteroid: " + str(asteroid) + " is " + str(degree) + "compaired to Origin: "+ str(origin)
                        #print (printstr)
                    if origin != asteroid:
                        for blocking in blockingAsteroids:
                            blocking = blocking.split(",")
                            BlockingDegree = 0.0
                            BlockingDistance = 0
                            BlockingHorizontal = 0
                            xBlocking = int(blocking[0]) - xOrigin
                            yBlocking = int(blocking[1]) - yOrigin
                            if origin == blocking:pass
                            BlockingDistance = distance(xOrigin,yOrigin,xBlocking,yBlocking)
                            BlockingHorizontal = horizontalOrVert(xBlocking,yBlocking)
                            if BlockingHorizontal == 0:
                                BlockingDegree = angle(xBlocking, yBlocking)
                                printstr = "The angle of the Blocking Asteroid: " + str(blocking) + " is " + str(BlockingDegree) + "compaired to Origin: "+ str(origin)
                                #print (printstr)
                                BlockingQuadrant = quadrant(xBlocking, yBlocking)
                                
                            if asteroid == blocking:
                                pass
                            elif origin == blocking:
                                pass
                            elif Horizontal == 1 and BlockingHorizontal == 1:
                                if yBlocking < 0:
                                    if yAsteroid < 0:
                                        if BlockingDistance > AsteroidDistance:
                                            PotentialGood = 1
                                        else:
                                            blocked = 1
                                            
                                else:
                                    if yAsteroid > 0:
                                        if BlockingDistance < AsteroidDistance:
                                            PotentialGood = 1
                                        else:
                                            blocked = 1
                                            

                            elif Horizontal == -1 and BlockingHorizontal == -1:
                                if xBlocking < 0:
                                    if xAsteroid < 0:
                                        if BlockingDistance > AsteroidDistance:
                                            PotentialGood = 1
                                        else:
                                            blocked = 1
                                            
                                else:
                                    if xAsteroid > 0:
                                        if BlockingDistance < AsteroidDistance:
                                            PotentialGood = 1
                                        else:
                                            blocked = 1
                                    
                            elif Horizontal == 1 and BlockingHorizontal == -1:
                                pass
                            elif Horizontal == -1 and BlockingHorizontal == 1:
                                pass
                            else:
                                if degree == BlockingDegree:
                                    if AsteroidQuadrant == BlockingQuadrant:
                                        if BlockingDistance < AsteroidDistance:
                                            blocked = 1
                                            
                                        else:
                                            PotentialGood = 1
                                            #stringstr = str(origin) + "\r\n " + str(asteroid) + "  " + str(AsteroidQuadrant) + "  " + str(degree) + " " + str(yAsteroid) + "  " + str(xAsteroid) + "\r\n" + str(blocking) + "  " + str(BlockingQuadrant) + "  " + str(BlockingDegree) +  "  " + str(xBlocking) + "  " +str(yBlocking)
                                            #print(stringstr)
                                    else:
                                        PotentialGood = 1
                                        #stringstr = str(origin) + " the Asteroid " + str(asteroid) + " and the blocking Asteroid " + str(blocking) + " are all on the same line.`r`nThe line is of the degrees " + str(degree) +  " and blockingLine degrees " + str(BlockingDegree)
                                        #print(stringstr)
                                else:
                                    PotentialGood = 1
                                    #print("STILL ON TO SOMETHING")
                        if blocked == 1:
                            pass
                        elif PotentialGood == 1:
                            printstr = str(asteroid) + "," + str(degree) + "," + str(AsteroidQuadrant) + "," + str(Horizontal)
                            Sightings.append(printstr)
                            totalSightings += 1
        stringstr = "Origin " + str(origin) + " is able to see " + str(totalSightings) + " Asteroids."
        print(stringstr)
        print(Sightings)
        if maxSightings < totalSightings:
            maxSightings = totalSightings
            maxOrig = origin

    print("Max is")
    stringstr = "Origin " + str(maxOrig) + " is able to see the most asteroids at " + str(maxSightings)
    print(stringstr)

                
def angle (xCord, yCord):
    tan = xCord/yCord
    angle = math.atan(float(tan))
    degree = math.degrees(angle)
    return degree

def distance (xOr, yOr, xDi, yDi):
    d = math.sqrt(((xDi - xOr)**2)+((xOr-yDi)**2))
    return d

def horizontalOrVert (xCord, yCord):
    if xCord == 0:
        return 1
    elif yCord == 0:
        return -1
    else:
        return 0

def quadrant (xCord, yCord):
    if xCord < 0:
        xQuad = 0
    else:
        xQuad = 1
    if yCord <0:
        yQuad = 0
    else:
        yQuad = 1
    if xQuad == 0 and yQuad == 1:
        return 1
    elif xQuad == 1 and yQuad == 1:
        return 2
    elif xQuad == 1 and yQuad == 0:
        return 3
    elif xQuad == 0 and yQuad == 0:
        return 4

main()