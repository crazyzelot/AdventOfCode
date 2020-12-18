$outFilePath = "C:\Users\aarong\Advent of Code\Day12\Outfile.txt"
rm $outFilePath

#Both have format of X,Y,Z
#<x=14, y=4, z=5>
#<x=12, y=10, z=8>
#<x=1, y=7, z=-10>
#<x=16, y=-5, z=3>
#Init
$PreviousIoPositions = "14,4,5"
$PreviousEuropaPositions = "12,10,8"
$PreviousGanymedePositions = "1,7,-10"
$PreviousCallistoPositions = "16,-5,3"
$IoInitial = $PreviousIoPositions
$EuropaInitial = $PreviousEuropaPositions
$GanymedeInitial = $PreviousGanymedePositions
$CallistoInitial  = $PreviousCallistoPositions

$PreviousIoVelocitys = "0,0,0"
$PreviousEuropaVelocitys = "0,0,0"
$PreviousGanymedeVelocitys = "0,0,0"
$PreviousCallistoVelocitys = "0,0,0"
$NextIoVelocitys = $PreviousIoVelocitys
$NextEuropaVelocitys = $PreviousEuropaVelocitys
$NextGanymedeVelocitys = $PreviousGanymedeVelocitys
$NextCallistoVelocitys = $PreviousCallistoVelocitys


#Looping Counter
$time = 0
$isTrue = 0
#in each step 1st change velicoty by applying gravity, then 2nd change position based on velocity, 3rd Update time
while($isTrue -eq 0)
{
    #$time
    #Setting temp Pos to current time
    $IoPos = $PreviousIoPositions.Split(",")
    $EuropaPos = $PreviousEuropaPositions.Split(",")
    $GanymedePos = $PreviousGanymedePositions.Split(",")
    $CallistoPos = $PreviousCallistoPositions.Split(",")
    #Setting temp Vel to current time
    $IoVel = $PreviousIoVelocitys.Split(",")
    $EuropaVel = $PreviousEuropaVelocitys.Split(",")
    $GanymedeVel = $PreviousGanymedeVelocitys.Split(",")
    $CallistoVel = $PreviousCallistoVelocitys.Split(",")
    [int]$IoPos[0] = [int]$IoPos[0]
    [int]$IoPos[1] = [int]$IoPos[1]
    [int]$IoPos[2] = [int]$IoPos[2]
    [int]$europaPos[0] = [int]$europaPos[0]
    [int]$europaPos[1] = [int]$europaPos[1]
    [int]$europaPos[2] = [int]$europaPos[2]
    [int]$GanymedePos[0] = [int]$GanymedePos[0]
    [int]$GanymedePos[1] = [int]$GanymedePos[1]
    [int]$GanymedePos[2] = [int]$GanymedePos[2]
    [int]$CallistoPos[0] = [int]$CallistoPos[0]
    [int]$CallistoPos[1] = [int]$CallistoPos[1]
    [int]$CallistoPos[2] = [int]$CallistoPos[2]

    #region X Velocity Change
        #Io to Europa
        if([int]$IoPos[0] -lt [int]$europaPos[0])
        {
            $IoVel[0] = [int]$IoVel[0] + 1
            $EuropaVel[0] = [int]$EuropaVel[0] - 1
        }
        elseif([int]$IoPos[0] -gt [int]$europaPos[0])
        {
            $IoVel[0] = [int]$IoVel[0] - 1
            $EuropaVel[0] = [int]$EuropaVel[0] + 1
        }
        elseif([int]$IoPos[0] -eq [int]$europaPos[0])
        {
        }
        else
        {           
            Write-Host "Error"
        }

        #Io to Ganymede
        if([int]$IoPos[0] -lt [int]$GanymedePos[0])
        {
            $IoVel[0] = [int]$IoVel[0] + 1
            $GanymedeVel[0] = [int]$GanymedeVel[0] - 1
        }
        elseif([int]$IoPos[0] -gt [int]$GanymedePos[0])
        {
            $IoVel[0] = [int]$IoVel[0] - 1
            $GanymedeVel[0] = [int]$GanymedeVel[0] + 1
        }
        elseif([int]$IoPos[0] -eq [int]$GanymedePos[0])
        {
        }
        else
        {
            Write-Host "Error"
        }

        #Io to Calisto
        if([int]$IoPos[0] -lt [int]$CallistoPos[0])
        {
            $IoVel[0] = [int]$IoVel[0] + 1
            $CallistoVel[0] = [int]$CallistoVel[0] - 1
        }
        elseif([int]$IoPos[0] -gt [int]$CallistoPos[0])
        {
            $IoVel[0] = [int]$IoVel[0] - 1
            $CallistoVel[0] = [int]$CallistoVel[0] + 1
        }
        elseif([int]$IoPos[0] -eq [int]$CallistoPos[0])
        {
        }
        else
        {
            Write-Host "Error"
        }

        #Europa to Ganymede
        if([int]$EuropaPos[0] -lt [int]$GanymedePos[0])
        {
            $EuropaVel[0] = [int]$EuropaVel[0] + 1
            $GanymedeVel[0] = [int]$GanymedeVel[0] - 1
        }
        elseif([int]$EuropaPos[0] -gt [int]$GanymedePos[0])
        {
            $EuropaVel[0] = [int]$EuropaVel[0] - 1
            $GanymedeVel[0] = [int]$GanymedeVel[0] + 1
        }
        elseif([int]$EuropaPos[0] -eq [int]$GanymedePos[0])
        {
        }
        else
        {
            Write-Host "Error"
        }

        #Europa to Callisto
        if([int]$EuropaPos[0] -lt [int]$CallistoPos[0])
        {
            $EuropaVel[0] = [int]$EuropaVel[0] + 1
            $CallistoVel[0] = [int]$CallistoVel[0] - 1
        }
        elseif([int]$EuropaPos[0] -gt [int]$CallistoPos[0])
        {
            $EuropaVel[0] = [int]$EuropaVel[0] - 1
            $CallistoVel[0] = [int]$CallistoVel[0] + 1
        }
        elseif([int]$EuropaPos[0] -eq [int]$CallistoPos[0])
        {
        }
        else
        {
            Write-Host "Error"
        }

        #Ganymede to Callisto
        if([int]$GanymedePos[0] -lt [int]$CallistoPos[0])
        {
            $GanymedeVel[0] = [int]$GanymedeVel[0] + 1
            $CallistoVel[0] = [int]$CallistoVel[0] - 1
        }
        elseif([int]$GanymedePos[0] -gt [int]$CallistoPos[0])
        {
            $GanymedeVel[0] = [int]$GanymedeVel[0] - 1
            $CallistoVel[0] = [int]$CallistoVel[0] + 1
        }
        elseif([int]$GanymedePos[0] -eq [int]$CallistoPos[0])
        {
        }
        else
        {
            Write-Host "Error 1"
        }
    #endregion
    
    #region Y Velocity Change
        #Io to Europa
        if([int]$IoPos[1] -lt [int]$europaPos[1])
        {
            #Write-Host Increasing Io Vel Y because $IoPos[1] is less than $EuropaPos[1]
            $IoVel[1] = [int]$IoVel[1] + 1
            $EuropaVel[1] = [int]$EuropaVel[1] - 1
        }
        elseif([int]$IoPos[1] -gt [int]$europaPos[1])
        {
            $IoVel[1] = [int]$IoVel[1] - 1
            $EuropaVel[1] = [int]$EuropaVel[1] + 1
        }
        elseif([int]$IoPos[1] -eq [int]$europaPos[1])
        {
        }
        else
        {           
            Write-Host "Error"
        }

        #Io to Ganymede
        if([int]$IoPos[1] -lt [int]$GanymedePos[1])
        {
            $IoVel[1] = [int]$IoVel[1] + 1
            $GanymedeVel[1] = [int]$GanymedeVel[1] - 1
        }
        elseif([int]$IoPos[1] -gt [int]$GanymedePos[1])
        {
            $IoVel[1] = [int]$IoVel[1] - 1
            $GanymedeVel[1] = [int]$GanymedeVel[1] + 1
        }
        elseif([int]$IoPos[1] -eq [int]$GanymedePos[1])
        {
        }
        else
        {
            Write-Host "Error"
        }

        #Io to Calisto
        if([int]$IoPos[1] -lt [int]$CallistoPos[1])
        {
            $IoVel[1] = [int]$IoVel[1] + 1
            $CallistoVel[1] = [int]$CallistoVel[1] - 1
        }
        elseif([int]$IoPos[1] -gt [int]$CallistoPos[1])
        {
            $IoVel[1] = [int]$IoVel[1] - 1
            $CallistoVel[1] = [int]$CallistoVel[1] + 1
        }
        elseif([int]$IoPos[1] -eq [int]$CallistoPos[1])
        {
        }
        else
        {
            Write-Host "Error"
        }

        #Europa to Ganymede
        if([int]$EuropaPos[1] -lt [int]$GanymedePos[1])
        {
            $EuropaVel[1] = [int]$EuropaVel[1] + 1
            $GanymedeVel[1] = [int]$GanymedeVel[1] - 1
        }
        elseif([int]$EuropaPos[1] -gt [int]$GanymedePos[1])
        {
            $EuropaVel[1] = [int]$EuropaVel[1] - 1
            $GanymedeVel[1] = [int]$GanymedeVel[1] + 1
        }
        elseif([int]$EuropaPos[1] -eq [int]$GanymedePos[1])
        {
        }
        else
        {
            Write-Host "Error"
        }

        #Europa to Callisto
        if([int]$EuropaPos[1] -lt [int]$CallistoPos[1])
        {
            $EuropaVel[1] = [int]$EuropaVel[1] + 1
            $CallistoVel[1] = [int]$CallistoVel[1] - 1
        }
        elseif([int]$EuropaPos[1] -gt [int]$CallistoPos[1])
        {
            $EuropaVel[1] = [int]$EuropaVel[1] - 1
            $CallistoVel[1] = [int]$CallistoVel[1] + 1
        }
        elseif([int]$EuropaPos[1] -eq [int]$CallistoPos[1])
        {
        }
        else
        {
            Write-Host "Error"
        }

        #Ganymede to Callisto
        if([int]$GanymedePos[1] -lt [int]$CallistoPos[1])
        {
            $GanymedeVel[1] = [int]$GanymedeVel[1] + 1
            $CallistoVel[1] = [int]$CallistoVel[1] - 1
        }
        elseif([int]$GanymedePos[1] -gt [int]$CallistoPos[1])
        {
            $GanymedeVel[1] = [int]$GanymedeVel[1] - 1
            $CallistoVel[1] = [int]$CallistoVel[1] + 1
        }
        elseif([int]$GanymedePos[1] -eq [int]$CallistoPos[1])
        {
        }
        else
        {
            Write-Host "Error 1"
        }
    #endregion

    #region Z Velocity changes
        #Io to Europa
        if([int]$IoPos[2] -lt [int]$europaPos[2])
        {
            $IoVel[2] = [int]$IoVel[2] + 1
            $EuropaVel[2] = [int]$EuropaVel[2] - 1
        }
        elseif([int]$IoPos[2] -gt [int]$europaPos[2])
        {
            $IoVel[2] = [int]$IoVel[2] - 1
            $EuropaVel[2] = [int]$EuropaVel[2] + 1
        }
        elseif([int]$IoPos[2] -eq [int]$europaPos[2])
        {
        }
        else
        {           
            Write-Host "Error"
        }

        #Io to Ganymede
        if([int]$IoPos[2] -lt [int]$GanymedePos[2])
        {
            $IoVel[2] = [int]$IoVel[2] + 1
            $GanymedeVel[2] = [int]$GanymedeVel[2] - 1
        }
        elseif([int]$IoPos[2] -gt [int]$GanymedePos[2])
        {
            $IoVel[2] = [int]$IoVel[2] - 1
            $GanymedeVel[2] = [int]$GanymedeVel[2] + 1
        }
        elseif([int]$IoPos[2] -eq [int]$GanymedePos[2])
        {
        }
        else
        {
            Write-Host "Error"
        }

        #Io to Calisto
        if([int]$IoPos[2] -lt [int]$CallistoPos[2])
        {
            $IoVel[2] = [int]$IoVel[2] + 1
            $CallistoVel[2] = [int]$CallistoVel[2] - 1
        }
        elseif([int]$IoPos[2] -gt [int]$CallistoPos[2])
        {
            $IoVel[2] = [int]$IoVel[2] - 1
            $CallistoVel[2] = [int]$CallistoVel[2] + 1
        }
        elseif([int]$IoPos[2] -eq [int]$CallistoPos[2])
        {
        }
        else
        {
            Write-Host "Error"
        }

        #Europa to Ganymede
        if([int]$EuropaPos[2] -lt [int]$GanymedePos[2])
        {
            $EuropaVel[2] = [int]$EuropaVel[2] + 1
            $GanymedeVel[2] = [int]$GanymedeVel[2] - 1
        }
        elseif([int]$EuropaPos[2] -gt [int]$GanymedePos[2])
        {
            $EuropaVel[2] = [int]$EuropaVel[2] - 1
            $GanymedeVel[2] = [int]$GanymedeVel[2] + 1
        }
        elseif([int]$EuropaPos[2] -eq [int]$GanymedePos[2])
        {
        }
        else
        {
            Write-Host "Error"
        }

        #Europa to Callisto
        if([int]$EuropaPos[2] -lt [int]$CallistoPos[2])
        {
            $EuropaVel[2] = [int]$EuropaVel[2] + 1
            $CallistoVel[2] = [int]$CallistoVel[2] - 1
        }
        elseif([int]$EuropaPos[2] -gt [int]$CallistoPos[2])
        {
            $EuropaVel[2] = [int]$EuropaVel[2] - 1
            $CallistoVel[2] = [int]$CallistoVel[2] + 1
        }
        elseif([int]$EuropaPos[2] -eq [int]$CallistoPos[2])
        {
        }
        else
        {
            Write-Host "Error"
        }

        #Ganymede to Callisto
        if([int]$GanymedePos[2] -lt [int]$CallistoPos[2])
        {
            $GanymedeVel[2] = [int]$GanymedeVel[2] + 1
            $CallistoVel[2] = [int]$CallistoVel[2] - 1
        }
        elseif([int]$GanymedePos[2] -gt [int]$CallistoPos[2])
        {
            $GanymedeVel[2] = [int]$GanymedeVel[2] - 1
            $CallistoVel[2] = [int]$CallistoVel[2] + 1
        }
        elseif([int]$GanymedePos[2] -eq [int]$CallistoPos[2])
        {
        }
        else
        {
            Write-Host "Error 1"
        }
    #endregion
    
    $IoPos[0] = [int]$IoPos[0] + $IoVel[0]
    $IoPos[1] = [int]$IoPos[1] + $IoVel[1]
    $IoPos[2] = [int]$IoPos[2] + $IoVel[2]

    $EuropaPos[0] = [int]$EuropaPos[0] + $EuropaVel[0]
    $EuropaPos[1] = [int]$EuropaPos[1] + $EuropaVel[1]
    $EuropaPos[2] = [int]$EuropaPos[2] + $EuropaVel[2]
    
    $GanymedePos[0] = [int]$GanymedePos[0] + $GanymedeVel[0]
    $GanymedePos[1] = [int]$GanymedePos[1] + $GanymedeVel[1]
    $GanymedePos[2] = [int]$GanymedePos[2] + $GanymedeVel[2]
    
    $CallistoPos[0] = [int]$CallistoPos[0] + $CallistoVel[0]
    $CallistoPos[1] = [int]$CallistoPos[1] + $CallistoVel[1]
    $CallistoPos[2] = [int]$CallistoPos[2] + $CallistoVel[2]


    $time++
    
    
    $PreviousIoVelocitys = $IoVel[0]+","+$IoVel[1]+","+$IoVel[2]
    $PreviousEuropaVelocitys = $EuropaVel[0]+","+$EuropaVel[1]+","+$EuropaVel[2]
    $PreviousGanymedeVelocitys = $GanymedeVel[0]+","+$GanymedeVel[1]+","+$GanymedeVel[2]
    $PreviousCallistoVelocitys = $CallistoVel[0]+","+$CallistoVel[1]+","+$CallistoVel[2] 

    $PreviousIoPositions = $IoPos[0]+","+$IoPos[1]+","+$IoPos[2]
    $PreviousEuropaPositions = $EuropaPos[0]+","+$EuropaPos[1]+","+$EuropaPos[2]
    $PreviousGanymedePositions =$GanymedePos[0]+","+$GanymedePos[1]+","+$GanymedePos[2]
    $PreviousCallistoPositions =$CallistoPos[0]+","+$CallistoPos[1]+","+$CallistoPos[2]
    if($time%1000 -eq 0)
    {
        Write-Host "`r`nRun $time"
    }
    if($IoInitial -eq $PreviousIoPositions -and $EuropaInitial -eq $PreviousEuropaPositions -and $GanymedeInitial -eq $PreviousGanymedePositions -and $CallistoInitial -eq $PreviousCallistoPositions)
    {
        $isTrue = 1
        $time++
        $time
    }
    #$EuropaPositions[$time]
    #$GanymedePositions[$time]
    #$CallistoPositions[$time] 
}

$PreviousIoPositions
$PreviousEuropaPositions
$PreviousGanymedePositions
$PreviousCallistoPositions
<#
$EnergyIo1st = $IoPositions[$time].Split(",")
$EnergyEuropa1st = $EuropaPositions[$time].Split(",")
$EnergyGanymede1st = $GanymedePositions[$time].Split(",")
$EnergyCallisto1st = $CallistoPositions[$time].Split(",")
$IoPotential = [MATH]::ABS([int]$EnergyIo1st[0]) + [MATH]::ABS([int]$EnergyIo1st[1]) + [MATH]::ABS([int]$EnergyIo1st[2])
$EuropaPotential = [MATH]::ABS([int]$EnergyEuropa1st[0]) + [MATH]::ABS([int] $EnergyEuropa1st[1]) + [MATH]::ABS([int] $EnergyEuropa1st[2])
$GanymedePotential = [MATH]::ABS([int]$EnergyGanymede1st[0]) + [MATH]::ABS([int] $EnergyGanymede1st[1]) + [MATH]::ABS([int] $EnergyGanymede1st[2])
$CallistoPotential = [MATH]::ABS([int]$EnergyCallisto1st[0]) + [MATH]::ABS([int] $EnergyCallisto1st[1]) + [MATH]::ABS([int] $EnergyCallisto1st[2])


$EnergyIo2nd = $IoVelocitys[$time].Split(",")
$EnergyEuropa2nd = $EuropaVelocitys[$time].Split(",")
$EnergyGanymede2nd = $GanymedeVelocitys[$time].Split(",")
$EnergyCallisto2nd = $CallistoVelocitys[$time].Split(",")
$IoKenetic = [MATH]::ABS([int]$EnergyIo2nd[0]) + [MATH]::ABS([int]$EnergyIo2nd[1]) + [MATH]::ABS([int]$EnergyIo2nd[2])
$EuropaKenetic = [MATH]::ABS([int]$EnergyEuropa2nd[0]) + [MATH]::ABS([int] $EnergyEuropa2nd[1]) + [MATH]::ABS([int] $EnergyEuropa2nd[2])
$GanymedeKenetic = [MATH]::ABS([int]$EnergyGanymede2nd[0]) + [MATH]::ABS([int] $EnergyGanymede2nd[1]) + [MATH]::ABS([int] $EnergyGanymede2nd[2])
$CallistoKenetic = [MATH]::ABS([int]$EnergyCallisto2nd[0]) + [MATH]::ABS([int] $EnergyCallisto2nd[1]) + [MATH]::ABS([int] $EnergyCallisto2nd[2])
$Sum1 = $IoPotential*$IoKenetic
$Sum2 = $EuropaPotential*    $EuropaKenetic
$Sum3 = $GanymedePotential*  $GanymedeKenetic
$Sum4 = $CallistoPotential*  $CallistoKenetic
$total = $Sum1 + $sum2 + $sum3 + $sum4
$total
#>


