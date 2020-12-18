$AsteroidFieldInput = ""
$AsteroidFieldInput = Get-Content "C:\Users\aarong\Advent of Code\Day10\InputFile.txt"
$AsteroidFieldArray = @()
$outFilePath = "C:\Users\aarong\Advent of Code\Day10\Outfile.txt"
$yLength = $AsteroidFieldInput.Length
$totalsHash = @{}
$max = 0
#Write-Host $AsteroidField
$y=0
$c = 0
foreach($line in $AsteroidFieldInput)
{
    $xLength = $line.Length
    $x=0
    while($x -lt $xLength)
    {
        if($line[$x] -eq "#")
        {
            $input = "$x,$y"
            $AsteroidFieldArray = $AsteroidFieldArray + $input
        }
        #Write-Host $line[$x]
        $x++
    }
    $y++
}
$y = 0
$line = ""
$Length = $AsteroidFieldArray.Length
foreach($x in $AsteroidFieldArray)
{
    $TotalSights = 0
    ###Delete next two after testing
    if($x -like "2,19")
    {
        #$line = "Origin is: $x"
        $xCord = $x.split(",")
        $yCord = $yLength - $xCord[1]
        $xCord = $xCord[0]
        $TotalSights = 0
        #Write-Host $line
        foreach($Asteroid in $AsteroidFieldArray)
        {
            ###Use to spot check asteroids
            if($Asteroid -like "*,*")
            {
                #$Asteroid
                if($Asteroid -eq $x)
                {
                    #$line = "The Asteroid: $Asteroid is the origin `r`n"
                    #Write-Host $line
                }
                else
                {
                    #Write-Host "Now Checking $Asteroid"
                    #$line = "The Asteroid: $Asteroid is not the origin"
                    #Write-Host $line
                    $blocked = 0
                    $potentiallyUnblocked = 0
                    $AsteroidCord = $Asteroid.Split(",")
                    $xAsteroid = $AsteroidCord[0]
                    $yAsteroid = $yLength - $AsteroidCord[1]
                    $xDif = $xCord - $xAsteroid
                    $yDif = $yCord - $yAsteroid
                    $yAsteroidRel = 0
                    $xAsteroidRel = 0
                    $AsteroidQuadrant = 0
                    $verticalLine = 0
                    $horizontalLine = 0
                    #region Close Asteroids
                    if(($xDif -le 1 -and $xDif -ge -1) -and ($yDif -le 1 -and $yDif -ge -1))
                    {
                        #$line = "Line of Site on $Asteroid"
                        #Write-Host $line
                        $totalSights++
                    }
                    #endregion

                    else
                    {

                    #region horizontal
                    if($yDif -eq 0)
                    {
                        #Write-Host Verticle Line
                        $verticalLine = 0
                        $horizontalLine = 1
                        #$line = "Asteroid: $Asteroid is on a horizontal line with Origin: $x"
                        #Write-Host $line
                    }
                    #endregion

                    #region verticle
                    elseif($xDif -eq 0)
                    {
                        #Write-Host Horizontal Line
                        $horizontalLine = 0
                        $verticalLine = 1
                        #$line = "Asteroid: $Asteroid is on a vertical line with Origin: $x"
                        #Write-Host $line
                    }
                    #endregion
                        
                    #region gathering information on relation to origin
                    #Y Relation First
                    if($yAsteroid -lt $yCord)
                    {
                        $yAsteroidRel = -1
                    }
                    elseif($yAsteroid -gt $yCord)
                    {
                        $yAsteroidRel = 1
                    }
                    #X Relation Second
                    if($xAsteroid -lt $xCord)
                    {
                        $xAsteroidRel = -1
                    }
                    elseif($xAsteroid -gt $xCord)
                    {
                        $xAsteroidRel = 1
                    }
                    #endregion
                        
                    #region selecting quadrant around origin
                    if($xAsteroidRel -eq -1 -and $yAsteroidRel -eq 1)
                    {
                        $AsteroidQuadrant = 1
                    }
                    elseif($xAsteroidRel -eq 1 -and $yAsteroidRel -eq 1)
                    {
                        $AsteroidQuadrant = 2
                    }
                    elseif($xAsteroidRel -eq 1 -and $yAsteroidRel -eq -1)
                    {
                        $AsteroidQuadrant = 3
                    }
                    elseif($xAsteroidRel -eq -1 -and $yAsteroidRel -eq -1)
                    {
                        $AsteroidQuadrant = 4
                    }
                    #endregion
                        
                    #region creating slope formula
                    if($verticalLine -eq 0 -and $horizontalLine -eq 0)
                    {
                        #$yDif
                        #$xDif
                        $m = $yDif/$xDif
                        $b = $yAsteroid-($m*$xAsteroid)
                        $horizontalLine = 0
                        $verticalLine = 0
                        #$line = "Paramaters:`r`nyDif: $yDif`r`nxDif: $xDif`r`nxCord: $xCord`r`nyCord: $yCord"
                        #Write-Host $line
                        #$line = "Asteroid: $Asteroid is on a line with the formula of y=$m`x+$b with the Origin: $Origin"
                        #Write-Host $line
                    }
                    #endregion

                    #Now checking each asteroid
                    foreach($BlockingAsteroid in $AsteroidFieldArray)
                    {
                            
                        $BlockingAsteroidCord = $BlockingAsteroid.Split(",")
                        $xBlocking = $BlockingAsteroidCord[0]
                        $yBlocking = $yLength - $BlockingAsteroidCord[1]
                        $blockingVerticalLine = 0
                        $blockingHorizontalLine = 0
                        $xDifBlocking = $xCord - $xBlocking
                        $yDifBlocking = $yCord - $yBlocking
                        $xBlockingRel = 0
                        $yBlockingRel = 0
                        $BlockingQuadrant = 0

                        #region dif horizontal
                        if($yDifBlocking -eq 0)
                        {
                            #Write-Host Verticle Line
                            $blockingHorizontalLine = 1
                            $blockingVerticalLine = 0
                        }
                        #endregion

                        #region dif verticle
                        elseif($xDifBlocking -eq 0)
                        {
                            #Write-Host Verticle Line $BlockingAsteroid
                            $blockingVerticalLine = 1
                            $blockingHorizontalLine = 0
                        }
                        #endregion

                        #region gathering information on relation to origin
                        #Y Relation First
                        if($yBlocking -lt $yCord)
                        {
                            $yBlockingRel = -1
                        }
                        elseif($yBlocking -gt $yCord)
                        {
                            $yBlockingRel = 1
                        }
                        #X Relation Second
                        if($xBlocking -lt $xCord)
                        {
                            $xBlockingRel = -1
                        }
                        elseif($xBlocking -gt $xCord)
                        {
                            $xBlockingRel = 1
                        }
                        #endregion

                        #region selecting quadrant around origin
                        if($xBlockingRel -eq -1 -and $yBlockingRel -eq 1)
                        {
                            $BlockingQuadrant = 1
                        }
                        elseif($xBlockingRel -eq 1 -and $yBlockingRel -eq 1)
                        {
                            $BlockingQuadrant = 2
                        }
                        elseif($xBlockingRel -eq 1 -and $yBlockingRel -eq -1)
                        {
                            $BlockingQuadrant = 3
                        }
                        elseif($xBlockingRel -eq -1 -and $yBlockingRel -eq -1)
                        {
                            $BlockingQuadrant = 4
                        }
                        #endregion
                            
                        #Write-Host "What Needs Checked $blockingHorizontalLine $blockingVerticalLine $horizontalLine $verticalLine"
                        #region first checks
                        if($BlockingAsteroid -eq $Asteroid)
                        {
                        
                        }

                        elseif($BlockingAsteroid -eq $x)
                        {

                        }
                        #endregion

                        #keep this an ElseIF
                        #verticle
                        elseif($VerticalLine -eq 1 -and $blockingVerticalLine -eq 1)
                        {
                            $AsteroidDistance = ($xCord - [Math]::Abs($xAsteroid)) + ($yCord - [Math]::Abs($yAsteroid))
                            $BlockingDistance = ($xCord - [Math]::Abs($xBlocking)) + ($yCord - [Math]::Abs($yBlocking))
                            #Write-Host HERE $AsteroidDistance     

                            #region Checking Verticle Visibility
                            #Write-Host B $yBlockingRel
                            #Write-Host R $yAsteroidRel
                            if($yBlockingRel -eq 1)
                            {
                                if($yAsteroidRel -eq -1)
                                {
                                    #$line = "Asteroid: $Asteroid`r`nBlockingAsteroid:$BlockingAsteroid`r`nAsteroidDistance: $AsteroidDistance`r`nBlocking Distance: $BlockingDistance`r`nMarking Potentially Unblocked to 1.`r`nSince $BlockingDistance is greater than $AsteroidDistance"
                                    #Write-Host $line
                                    $potentiallyUnblocked = 1
                                }
                                else
                                {
                                    #$line = "Asteroid: $Asteroid`r`nBlockingAsteroid:$BlockingAsteroid`r`nAsteroidDistance: $AsteroidDistance`r`nBlocking Distance: $BlockingDistance`r`nMarking Blocked to 1.`r`nSince $BlockingDistance is less than $AsteroidDistance"
                                    #Write-Host $line
                                    if($yBlocking -lt $yAsteroid)
                                    {
                                        $blocked = 1
                                    }
                                    else
                                    {
                                        $potentiallyUnblocked = 1
                                    }
                                }
                            }
                            elseif($yBlockingRel -eq -1)
                            {
                                if($yAsteroidRel -eq 1)
                                {
                                    #$line = "Asteroid: $Asteroid`r`nBlockingAsteroid:$BlockingAsteroid`r`nAsteroidDistance: $AsteroidDistance`r`nBlocking Distance: $BlockingDistance`r`nMarking Potentially Unblocked to 1.`r`nSince $BlockingDistance is greater than $AsteroidDistance"
                                    #Write-Host $line
                                    $potentiallyUnblocked = 1
                                }
                                else
                                {
                                    #$line = "Asteroid: $Asteroid`r`nBlockingAsteroid:$BlockingAsteroid`r`nAsteroidDistance: $AsteroidDistance`r`nBlocking Distance: $BlockingDistance`r`nMarking Blocked to 1.`r`nSince $BlockingDistance is less than $AsteroidDistance"
                                    #Write-Host $line
                                    if($yBlocking -gt $yAsteroid)
                                    {
                                        $blocked = 1
                                    }
                                    else
                                    {
                                        $potentiallyUnblocked = 1
                                    }
                                }
                            }
                            else
                            {
                                #$line = "Asteroid: $Asteroid`r`nBlockingAsteroid:$BlockingAsteroid`r`nAsteroidDistance: $AsteroidDistance`r`nBlocking Distance: $BlockingDistance`r`nMarking Potentially Unblocked to 1.`r`nSince $BlockingDistance is greater than $AsteroidDistance"
                                #Write-Host $line
                                $potentiallyUnblocked = 1
                            }
                            #endregion
                        }

                        #horizontal
                        elseif($horizontalLine -eq 1 -and $blockingHorizontalLine -eq 1)
                        {                                                                                                                                                                                                                                                
                            #Write-Host Checking
                            $AsteroidDistance = ($xCord - [Math]::Abs($xAsteroid)) + ($yCord - [Math]::Abs($yAsteroid))
                            $BlockingDistance = ($xCord - [Math]::Abs($xBlocking)) + ($yCord - [Math]::Abs($yBlocking))
                            #region Checking Verticle Visibility
                            #Write-Host B $yBlockingRel
                            #Write-Host R $yAsteroidRel
                            if($xBlockingRel -eq 1)
                            {
                                if($xAsteroidRel -eq -1)
                                {
                                    #$line = "Asteroid: $Asteroid`r`nBlockingAsteroid:$BlockingAsteroid`r`nAsteroidDistance: $AsteroidDistance`r`nBlocking Distance: $BlockingDistance`r`nMarking Potentially Unblocked to 1.`r`nSince $BlockingDistance is greater than $AsteroidDistance"
                                    #Write-Host $line
                                    $potentiallyUnblocked = 1
                                }
                                else
                                {
                                    #$line = "Asteroid: $Asteroid`r`nBlockingAsteroid:$BlockingAsteroid`r`nAsteroidDistance: $AsteroidDistance`r`nBlocking Distance: $BlockingDistance`r`nMarking Blocked to 1.`r`nSince $BlockingDistance is less than $AsteroidDistance"
                                    #Write-Host $line
                                    #Write-Host Caught 1
                                    if($xBlocking -lt $xAsteroid)
                                    {
                                        $blocked = 1
                                    }
                                    else
                                    {
                                        $potentiallyUnblocked = 1
                                    }
                                }
                            }
                            elseif($xBlockingRel -eq -1)
                            {
                                if($xAsteroidRel -eq 1)
                                {
                                    #$line = "Asteroid: $Asteroid`r`nBlockingAsteroid:$BlockingAsteroid`r`nAsteroidDistance: $AsteroidDistance`r`nBlocking Distance: $BlockingDistance`r`nMarking Potentially Unblocked to 1.`r`nSince $BlockingDistance is greater than $AsteroidDistance"
                                    #Write-Host $line
                                    $potentiallyUnblocked = 1
                                }
                                else
                                {
                                    #$line = "Asteroid: $Asteroid`r`nBlockingAsteroid:$BlockingAsteroid`r`nAsteroidDistance: $AsteroidDistance`r`nBlocking Distance: $BlockingDistance`r`nMarking Blocked to 1.`r`nSince $BlockingDistance is less than $AsteroidDistance"
                                    #Write-Host $line
                                    if($xBlocking -gt $xAsteroid)
                                    {
                                        $blocked = 1
                                    }
                                    else
                                    {
                                        $potentiallyUnblocked = 1
                                    }
                                }
                            }
                            else
                            {
                                #$line = "Asteroid: $Asteroid`r`nBlockingAsteroid:$BlockingAsteroid`r`nAsteroidDistance: $AsteroidDistance`r`nBlocking Distance: $BlockingDistance`r`nMarking Potentially Unblocked to 1.`r`nSince $BlockingDistance is greater than $AsteroidDistance"
                                #Write-Host $line
                                Write-host Good
                                $potentiallyUnblocked = 1
                            }
                        #endregion
                        }
                        
                        elseif($blockingHorizontalLine -eq 0 -and $blockingVerticalLine -eq 0 -and $horizontalLine -eq 0 -and $verticalLine -eq 0)
                        {
                            #Write-Host "Checking $BlockingAsteroid for slope."
                            $mBlocking = $yDifBlocking/$xDifBlocking
                            $bBlocking = $yBlocking-($mBlocking*$xBlocking)
                            $AsteroidDistance = ($xCord - [Math]::Abs($xAsteroid)) + ($yCord - [Math]::Abs($yAsteroid))
                            $BlockingDistance = ($xCord - [Math]::Abs($xBlocking)) + ($yCord - [Math]::Abs($yBlocking))
                            if($blocked -eq 1)
                            {
                                #Write-Host "You got blocked"
                            }
                            if($mBlocking -eq $m -and $bBlocking -eq $b -and $BlockingQuadrant -eq $AsteroidQuadrant)
                            {
                                    #Write-Host "The Asteroid: $Asteroid is on the same line as $blockingAsteroid"
                                    if($AsteroidQuadrant -eq 1)
                                    {
                                        if($xBlocking -gt $xAsteroid -and $yBlocking -lt $yAsteroid)
                                        {
                                            #Write-Host "You got blocked 1 by $blockingAsteroid"
                                            $blocked = 1
                                        }
                                        else
                                        {
                                            $potentiallyUnblocked = 1
                                        }
                                    }
                                    elseif($AsteroidQuadrant -eq 2)
                                    {
                                        if($xBlocking -lt $xAsteroid -and $yBlocking -lt $yAsteroid)
                                        {
                                            #Write-Host "You got blocked 2 by $blockingAsteroid"
                                            $blocked = 1
                                        }
                                        else
                                        {
                                            $potentiallyUnblocked = 1
                                        }
                                    }
                                    elseif($AsteroidQuadrant -eq 3)
                                    {
                                        if($xBlocking -lt $xAsteroid -and $yBlocking -gt $yAsteroid)
                                        {
                                            #$yDifBlocking
                                            #$xDifBlocking
                                            #Write-Host "Asteroid: $Asteroid`r`nGot blocked 3 by $blockingAsteroid`r`nAsteroid Slope: $m`r`nBlocking: $mBlocking"
                                            $blocked = 1
                                        
                                        }
                                        else
                                        {
                                            $potentiallyUnblocked = 1
                                        }
                                    }
                                    elseif($AsteroidQuadrant -eq 4)
                                    {
                                        if($xBlocking -gt $xAsteroid -and $yBlocking -gt $yAsteroid)
                                        {
                                            #Write-Host "You got blocked 4 by $blockingAsteroid"
                                            $blocked = 1
                                        }
                                        else
                                        {
                                            $potentiallyUnblocked = 1
                                        }
                                    }
                                }
                            else
                            {
                                $potentiallyUnblocked = 1
                            }

                        }
                    }
                    #$Asteroid
                    #$blocked
                    #$potentiallyUnblocked
                    if($blocked -eq 0 -and $potentiallyUnblocked -eq 1)
                    {
                        Write-Host "Line Of Site" on $Asteroid
                        $TotalSights++
                    }
                    elseif($blocked -eq 1)
                    {
                        Write-Host "No Line of Site on "$Asteroid
                    }
                    else
                    {
                        if($verticalLine -eq 1 -or $horizontalLine -eq 1)
                        {
                            Write-Host "Line Of Site" on $Asteroid
                            $TotalSights++
                        }
                        else
                        {
                            #Write-Host "Now that is weird"
                        }
                    }
                    #Write-Host "`r`n"
                    }

                }
               ###Delete this 
        
            ###Delete next one after testing. 
            }
        }
        $potentialMax = $TotalSights
        if ($max -lt $potentialMax)
        {
            $max = $potentialMax
            $maxOrigin = $x
        }
    }
#Write-Host Loop $c
#Write-Host "$TotalSights for Origin: $Origin"
$c++
}
Write-Host "$max for Origin: $maxOrigin"
#$AsteroidFieldArray
#$totalHash