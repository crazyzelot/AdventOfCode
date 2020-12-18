import math 
#Read in the input variable
def main():
    asteroids = []
    
    maxSightings = 0
    f= open("Day10\Part2Input.txt", "r")
    printstr = ""
    for line in f:
        asteroids.append(line)
        #print(line)
    f.close

    origin = "20,20"
    origin = origin.split(",")
    xOrigin = int(origin[0])
    yOrigin = int(origin[1])
    print(len(asteroids))
    removed = 0
    x = 0
    
    #Verticle UP
    for asteroid in asteroids:
        removal = asteroid
        asteroid = asteroid.split(",")
        xAsteroid = int(asteroid[0])
        yAsteroid = int(asteroid[1])
        AsteroidDegree = float(asteroid[2])
        AsteroidQuadrant = int(asteroid[3])
        horizontal = int(asteroid[4])
        #if xAsteroid == 11 and yAsteroid == 12:
            #print(horizontal)
            #print(yAsteroid)
            #print(yOrigin)
        if horizontal == 1 and yAsteroid < yOrigin:
            printstr = str(xAsteroid) + ", " + str(yAsteroid) + ", " + str(AsteroidDegree) +", " + str(AsteroidQuadrant) + ", " + str(horizontal)
            print(printstr)
            asteroids.remove(removal)
            x += 1

    notDone = 1
    #Quad 2 checking
    while notDone == 1:
        notDone = 0
        for asteroid in asteroids:
            removal = asteroid
            asteroid = asteroid.split(",")
            xAsteroid = int(asteroid[0])
            yAsteroid = int(asteroid[1])
            AsteroidDegree = float(asteroid[2])
            AsteroidQuadrant = int(asteroid[3])
            horizontal = int(asteroid[4])
            if AsteroidQuadrant == 3:
                NotNext = 0
                PotentialNext = 0  
                for angles in asteroids:
                    angles = angles.split(",")
                    comparisonDegree = float(angles[2])
                    comparisonQuadrant = int(angles[3])
                    if comparisonQuadrant == 3:
                        if AsteroidDegree > comparisonDegree:
                            PotentialNext = 1
                        elif AsteroidDegree < comparisonDegree:
                            NotNext = 1
                    else:
                        PotentialNext = 1
                if NotNext == 1:
                    pass
                elif PotentialNext == 1:
                    printstr = str(xAsteroid) + ", " + str(yAsteroid) + ", " + str(AsteroidDegree) +", " + str(AsteroidQuadrant) + ", " + str(horizontal)
                    print(printstr)
                    asteroids.remove(removal)
                    notDone = 1
                    x += 1

    #Horizontal right
    for asteroid in asteroids:
        removal = asteroid
        asteroid = asteroid.split(",")
        xAsteroid = int(asteroid[0])
        yAsteroid = int(asteroid[1])
        AsteroidDegree = float(asteroid[2])
        AsteroidQuadrant = int(asteroid[3])
        horizontal = int(asteroid[4])
        #print(horizontal)
        if horizontal == -1 and xAsteroid > xOrigin:
            printstr = str(xAsteroid) + ", " + str(yAsteroid) + ", " + str(AsteroidDegree) +", " + str(AsteroidQuadrant) + ", " + str(horizontal)
            print(printstr)
            asteroids.remove(removal)
            x += 1
    
    #Quad 3 checking
    notDone = 1
    while notDone == 1:
        notDone = 0
        for asteroid in asteroids:
            removal = asteroid
            asteroid = asteroid.split(",")
            xAsteroid = int(asteroid[0])
            yAsteroid = int(asteroid[1])
            AsteroidDegree = float(asteroid[2])
            AsteroidQuadrant = int(asteroid[3])
            horizontal = int(asteroid[4])
            if AsteroidQuadrant == 2:
                NotNext = 0
                PotentialNext = 0  
                for angles in asteroids:
                    angles = angles.split(",")
                    comparisonDegree = float(angles[2])
                    comparisonQuadrant = int(angles[3])
                    if comparisonQuadrant == 2:
                        if AsteroidDegree < comparisonDegree:
                            PotentialNext = 1
                        elif AsteroidDegree > comparisonDegree:
                            NotNext = 1
                    else:
                        PotentialNext = 1
                if NotNext == 1:
                    pass
                elif PotentialNext == 1:
                    printstr = str(xAsteroid) + ", " + str(yAsteroid) + ", " + str(AsteroidDegree) +", " + str(AsteroidQuadrant) + ", " + str(horizontal)
                    print(printstr)
                    asteroids.remove(removal)
                    notDone = 1
                    x += 1
        
    #Verticle Down
    for asteroid in asteroids:
        removal = asteroid
        asteroid = asteroid.split(",")
        xAsteroid = int(asteroid[0])
        yAsteroid = int(asteroid[1])
        AsteroidDegree = float(asteroid[2])
        AsteroidQuadrant = int(asteroid[3])
        horizontal = int(asteroid[4])
        #print(horizontal)
        if horizontal == 1 and yAsteroid > yOrigin:
            printstr = str(xAsteroid) + ", " + str(yAsteroid) + ", " + str(AsteroidDegree) +", " + str(AsteroidQuadrant) + ", " + str(horizontal)
            print(printstr)
            asteroids.remove(removal)
            x += 1

    #Quad 4 checking
    notDone = 1
    while notDone == 1:
        notDone = 0
        for asteroid in asteroids:
            removal = asteroid
            asteroid = asteroid.split(",")
            xAsteroid = int(asteroid[0])
            yAsteroid = int(asteroid[1])
            AsteroidDegree = float(asteroid[2])
            AsteroidQuadrant = int(asteroid[3])
            horizontal = int(asteroid[4])
            if AsteroidQuadrant == 1:
                NotNext = 0
                PotentialNext = 0  
                for angles in asteroids:
                    angles = angles.split(",")
                    comparisonDegree = float(angles[2])
                    comparisonQuadrant = int(angles[3])
                    if comparisonQuadrant == 1:
                        if AsteroidDegree > comparisonDegree:
                            PotentialNext = 1
                        elif AsteroidDegree < comparisonDegree:
                            NotNext = 1
                    else:
                        PotentialNext = 1
                if NotNext == 1:
                    pass
                elif PotentialNext == 1:
                    printstr = str(xAsteroid) + ", " + str(yAsteroid) + ", " + str(AsteroidDegree) +", " + str(AsteroidQuadrant) + ", " + str(horizontal)
                    print(printstr)
                    asteroids.remove(removal)
                    notDone = 1
                    x += 1

    #Horizontal Left
    for asteroid in asteroids:
        removal = asteroid
        asteroid = asteroid.split(",")
        xAsteroid = int(asteroid[0])
        yAsteroid = int(asteroid[1])
        AsteroidDegree = float(asteroid[2])
        AsteroidQuadrant = int(asteroid[3])
        horizontal = int(asteroid[4])
        #print(horizontal)
        if horizontal == -1 and xAsteroid < xOrigin:
            printstr = str(xAsteroid) + ", " + str(yAsteroid) + ", " + str(AsteroidDegree) +", " + str(AsteroidQuadrant) + ", " + str(horizontal)
            print(printstr)
            asteroids.remove(removal)
            x += 1

    #Quad 1 checking
    notDone = 1
    while notDone == 1:
        notDone = 0
        for asteroid in asteroids:
            removal = asteroid
            asteroid = asteroid.split(",")
            if x < 200:
                xAsteroid = int(asteroid[0])
                yAsteroid = int(asteroid[1])
                AsteroidDegree = float(asteroid[2])
                AsteroidQuadrant = int(asteroid[3])
                horizontal = int(asteroid[4])
                if AsteroidQuadrant == 4:
                    NotNext = 0
                    PotentialNext = 0  
                    for angles in asteroids:
                        angles = angles.split(",")
                        comparisonDegree = float(angles[2])
                        comparisonQuadrant = int(angles[3])
                        if comparisonQuadrant == 4:
                            if AsteroidDegree > comparisonDegree:
                                PotentialNext = 1
                            elif AsteroidDegree < comparisonDegree:
                                NotNext = 1
                        else:
                            PotentialNext = 1
                    if len(asteroids) == 1:
                        PotentialNext = 1
                    if NotNext == 1:
                        pass
                    elif PotentialNext == 1:
                        printstr = str(xAsteroid) + ", " + str(yAsteroid) + ", " + str(AsteroidDegree) +", " + str(AsteroidQuadrant) + ", " + str(horizontal)
                        print(printstr)
                        asteroids.remove(removal)
                        notDone = 1
                        x += 1

    print(len(asteroids))
    print(asteroids)



                
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