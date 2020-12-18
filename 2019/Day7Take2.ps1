$fileIn = '3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0'
$numOfAmps = 5
$AmpCounter = 0
$nextInput = 0
$outputFilePath = 'C:\Users\aarong\Advent of Code\Day7\Output.txt'
rm $outputFilePath
$1st = 0
$2nd = 0
$3rd = 0
$4th = 0
$5th = 0
###First Digit
while ($1st -lt 5)
{
    $2nd = 0
    while ($2nd -lt 5)
    {
        $3rd = 0
        while ($3rd -lt 5)
        {
            $4th = 0
            while ($4th -lt 5)
            {
                $5th = 0

                while ($5th -lt 5)
                {
                    
                    if (($1st -eq $2nd -or $1st -eq $3rd -or $1st -eq $4th -or $1st -eq $5th) -or ($2nd -eq $3rd -or $2nd -eq $4th -or $2nd -eq $5th)-or($3rd -eq $4th -or $3rd -eq $5th)-or($4th-eq$5th))
                    {
                    }
                    else
                    {
                        $ampCounter = 0
                        while ($ampCounter -lt 5)
                        {
                            $array = $fileIn.Split(',')
                            $length = $array.Length
                            $index = 0
                            $inputCount = 0
                            #Eventual $break = 0
                            while ($length - $index -gt 0)
                            {
                                $opCode = 0
                                $3rdParam = 0
                                $2ndParam = 0
                                $1stParam = 0
                                ###Setting Paramaters and Op Code
                                $index = [int]$index
                                #Write-Host This is the index $index
                                if ($Array[$index].Length -eq 1)
                                {
                                    $opCode = $Array[$index]
                                }
                                elseif ($Array[$index].Length -eq 2)
                                {
                                    $opCode = $Array[$index]
                                }
                                elseif ($Array[$index].Length -eq 3)
                                {
                                    $opCode = [string]$Array[$index].substring($Array[$index].Length-2,2)
                                    $1stParam = [string]$Array[$index].substring(0,1)
                                }
                                elseif ($Array[$index].Length -eq 4)
                                {
                                    $opCode = [string]$Array[$index].substring($Array[$index].Length-2,2)
                                    $2ndParam = [string]$Array[$index].substring(0,1)
                                    $1stParam = [string]$Array[$index].substring(1,1)
                                }
                                    elseif ($Array[$index].Length -eq 5)
                                {
                                    $opCode = [string]$Array[$index].substring($Array[$index].Length-2,2)
                                    $3rdParam = [string]$Array[$index].substring(0,1)
                                    $2ndParam = [string]$Array[$index].substring(1,1)
                                    $1stParam = [string]$Array[$index].substring(2,1)
                                }
                                ###Passing values into correct places
                                ###Setting Left Most Paramater Value Here Named Param1
                                if($3rdParam -eq 1)
                                {
                                    $3rdParam = $Array[$index+3]
                                }
                                else
                                {
                                    $3rdParam = $Array[$index+3]
                                }

                                ###Setting Next Paramater Value Here Named Param2
                                if($2ndParam -eq 1)
                                {
                                    $2ndParam = $Array[$index+2]
                                }
                                else
                                {
                                    $2ndParam = $Array[$array[$index+2]]
                                }

                                ##Setting Next Paramater Value Here Named Param3
                                if($1stParam -eq 1)
                                {
                                    $1stParam = $Array[$index+1]
                                }
                                else
                                {
                                    $1stParam = $Array[$array[$index+1]]
                                }
                                #Write-Host $AmpCounter
                                ###Old Code
                                if ([int]$opCode -eq 1)
                                {
                                    $Array[$Array[$index+3]] = [int]$1stParam + [int]$2ndParam
                                    $index = $index + 4
                                }
                                elseif ([int]$opCode -eq 2)
                                {
                                    $Array[$3rdParam] = [int]$1stParam * [int]$2ndParam
                                    $index = $index + 4
                                }
                                elseif ([int]$opCode -eq 4)
                                {
                                    $nextInput = $1stParam
                                    if($AmpCounter -eq 4)
                                    {
                                        $output = ""+ $1st + $2nd +$3rd + $4th +$5th + ", " + $nextInput
                                        Out-File -FilePath $outputFilePath -InputObject $output -Append
                                    }
                                    $index = $index + 2
                                }
                                elseif ([int]$opCode -eq 5)
                                {
                                    if($1stParam -ne 0)
                                    {
                                        $index = $2ndParam
                                        #Write-Host "PASS 5"
                                    }
                                    else
                                    { 
                                       #Write-Host "Fail 5"
                                       $index = $index+3
                                    }
                                }
                                elseif ([int]$opCode -eq 6)
                                {
                                    if($1stParam -eq 0)
                                    {
                                        #Write-Host "PASS 6"
                                        $index = $2ndParam
                                    }
                                    else
                                    {
                                       #Write-Host "Fail 6"
                                       $index = $index+3
                                    }
                                }
                                elseif ([int]$opCode -eq 7)
                                {
                                    if($1stParam -lt $2ndParam)
                                    {
                                        #Write-Host "PASS 7"
                                        $Array[$3rdParam] = 1
                                    }
                                    else
                                    {
                                        #Write-Host "Fail 7"
                                        $Array[$3rdParam] = 0
                                    }
                                    $index = $index + 4
                                }
                                elseif ([int]$opCode -eq 8)
                                {
                                    if($1stParam -eq $2ndParam)
                                    {
                                        #Write-Host "PASS 8"
                                        $Array[$3rdParam] = 1
                                    }
                                    else
                                    {
                                        #Write-Host "Fail 8"
                                        $Array[$3rdParam] = 0
                                        Write-Host $3rdParam
                                    }
                                    $index = $index + 4
                                }
                                elseif ([int]$opCode -eq 3)
                                {
                                    if ($inputCount -eq 0)
                                    {
                                        if ($ampCounter % 5 -eq 0)
                                        {
                                            #Write-Host 1st Amp
                                            $1stParam = $Array[$index+1]
                                            $Array[$1stParam] = $1st
                                            $inputCount = 1
                                            $index = $index + 2    
                                        }
                                        elseif ($ampCounter % 5 -eq 1)
                                        {
                                            #Write-Host 2nd Amp
                                            $1stParam = $Array[$index+1]
                                            $Array[$1stParam] = $2nd
                                            $inputCount = 1
                                            $index = $index + 2
                                        }
                                        elseif ($ampcounter % 5 -eq 2)
                                        {
                                            #Write-Host 3rd Amp
                                            $1stParam = $Array[$index+1]
                                            $Array[$1stParam] = $3rd
                                            $inputCount = 1
                                            $index = $index + 2
                                        }
                                        elseif ($ampcounter % 5 -eq 3)
                                        {
                                            #Write-Host 4th Amp
                                            $1stParam = $Array[$index+1]
                                            $Array[$1stParam] = $4th
                                            $inputCount = 1
                                            $index = $index + 2
                                        }
                                        elseif ($ampcounter % 5 -eq 4)
                                        {
                                            #Write-Host 5th Amp
                                            $1stParam = $Array[$index+1]
                                            $Array[$1stParam] = $5th
                                            $inputCount = 1
                                            $index = $index + 2
                                        }
                                    }
                                    else
                                    {
                                        if($AmpCounter % 5 -eq 0)
                                        {
                                            #Write-Host HERE
                                            $1stParam = $Array[$index+1]
                                            $Array[$1stParam] = 0
                                            $index = $index + 2
                                            $inputCount = 1
                                        }
                                        else
                                        {
                                            #Write-Host HERE2
                                            #Write Host Only once per code
                                            $1stParam = $Array[$index+1]
                                            $Array[$1stParam] = $nextInput
                                            $index = $index + 2
                                            $inputCount = 0
                                        }
                                    }
                                }
                                elseif ([int]$opCode -eq 99)
                                {
                                    #Write-Host "BREAK"
                                    $AmpCounter++
                                    #Write-Host $AmpCounter
                                    break
                                }
                            }
                        }
                    }
                    $5th++
                }
                $4th++
            }
            $3rd++
        }
        $2nd++
    }
$1st++
}