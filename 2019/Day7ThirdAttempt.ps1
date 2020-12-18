$fileIn = '3,8,1001,8,10,8,105,1,0,0,21,38,55,80,97,118,199,280,361,442,99999,3,9,101,2,9,9,1002,9,5,9,1001,9,4,9,4,9,99,3,9,101,5,9,9,102,2,9,9,1001,9,5,9,4,9,99,3,9,1001,9,4,9,102,5,9,9,101,4,9,9,102,4,9,9,1001,9,4,9,4,9,99,3,9,1001,9,3,9,1002,9,2,9,101,3,9,9,4,9,99,3,9,101,5,9,9,1002,9,2,9,101,3,9,9,1002,9,5,9,4,9,99,3,9,1002,9,2,9,4,9,3,9,101,1,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,1,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,1002,9,2,9,4,9,99,3,9,102,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,1,9,9,4,9,3,9,101,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,102,2,9,9,4,9,99,3,9,102,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,101,1,9,9,4,9,3,9,101,2,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,102,2,9,9,4,9,99,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,1001,9,1,9,4,9,3,9,101,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,101,2,9,9,4,9,3,9,1001,9,1,9,4,9,99,3,9,102,2,9,9,4,9,3,9,101,1,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,1,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,1001,9,2,9,4,9,3,9,1001,9,1,9,4,9,3,9,102,2,9,9,4,9,99'
#Get 26
#26-4
#Get 27
#27*2=27
#26+27=27
#Output 27
$nextInput = 0
$index = 0
$outFilePath = "C:\Users\aarong\Advent of Code\Day7\Outfile.txt"
$finalOutFilePath = "C:\Users\aarong\Advent of Code\Day7\FinalOutfile.txt"
rm $outFilePath
rm $finalOutFilePath
#Eventual $break = 0
$numOfAmps = 5
$AmpCounter = 0
$nextInput = 0
$1st = 5
$2nd = 5
$3rd = 5
$4th = 5
$5th = 5
$nextInput = 0
$break = 0
$subBreak = 0
###First Digit
while ($1st -lt 10)
{
    $2nd = 5
    while ($2nd -lt 10)
    {
        $3rd = 5
        while ($3rd -lt 10)
        {
            $4th = 5
            while ($4th -lt 10)
            {
                $5th = 5

                while ($5th -lt 10)
                {
                    
                    if (($1st -eq $2nd -or $1st -eq $3rd -or $1st -eq $4th -or $1st -eq $5th) -or ($2nd -eq $3rd -or $2nd -eq $4th -or $2nd -eq $5th)-or($3rd -eq $4th -or $3rd -eq $5th)-or($4th-eq$5th))
                    {
                    }
                    else
                    {
                        #Building The Main Array each time.
                        [Int64[]]$Convert = $fileIn.Split(",")
                        $1stArray = New-Object 'Int64[]' 1500
                        $2ndArray = New-Object 'Int64[]' 1500
                        $3rdArray = New-Object 'Int64[]' 1500
                        $4thArray = New-Object 'Int64[]' 1500
                        $5thArray = New-Object 'Int64[]' 1500
                        $loadingLength = $Convert.Length
                        $c = 0
                        $loopCount = 0
                        
                        while($c -lt $loadingLength)
                        {
                            $1stArray[$c] = $Convert[$c]
                            $2ndArray[$c] = $Convert[$c]
                            $3rdArray[$c] = $Convert[$c]
                            $4thArray[$c] = $Convert[$c]
                            $5thArray[$c] = $Convert[$c]
                            $c++
                        }
                        $length = $Convert.Length
                        $nextInput = 0
                        $AmpCounter = 0
                        $break = 0
                        $index = 0
                        $1stIndex = $index
                        $2ndIndex = $index
                        $3rdIndex = $index
                        $4thIndex = $index
                        $5thIndex = $index
                        [System.Collections.ArrayList]$outputs = New-Object System.Collections.ArrayList
                        $1stInput = 1
                        while($break -eq 0)
                        {

                            #$AmpCounter
                            $InputCount = 0
                            $waitingOnInput = 0
                            #region Setting up the Amp Arrays
                            if($AmpCounter % 5 -eq 0)
                            {
                                $Array = $1stArray
                                $index = $1stIndex
                                $line = "Setting the working Array to First Array. Index is $index"
                            }
                            elseif($AmpCounter % 5 -eq 1)
                            {
                                $Array = $2ndArray
                                $index = $2ndIndex
                                $line = "Setting the working Array to Second Array. Index is $index"
                            }
                            elseif($AmpCounter % 5 -eq 2)
                            {
                                $Array = $3rdArray
                                $index = $3rdIndex
                                $line = "Setting the working Array to Third Array. Index is $index"
                            }
                            elseif($AmpCounter % 5 -eq 3)
                            {
                                $Array = $4thArray
                                $index = $4thIndex
                                $line = "Setting the working Array to Fourth Array. Index is $index"
                            }
                            elseif($AmpCounter % 5 -eq 4)
                            {
                                $Array = $5thArray
                                $index = $5thIndex
                                $line = "Setting the working Array to Fifth Array. Index is $index"
                            }
                            #out-file -InputObject $line -FilePath $OutFilePath -Append
                            #endregion
                            $rem = $length - $index
                            while ($rem -gt 0)
                            {
                                #$index
                                $opCode = 0
                                $3rdParam = 0
                                $2ndParam = 0
                                $1stParam = 0

                                ###Setting Paramaters and Op Code
                                #Write-Host This is the index $index
    
                                #region Parsing out the opCodes
                                if ($Array[$index].toString().Length -eq 1)
                                {
                                    $opCode = $Array[$index].ToString()
                                }
                                elseif ($Array[$index].toString().Length -eq 2)
                                {
                                    $opCode = $Array[$index].ToString()
                                }
                                elseif ($Array[$index].toString().Length -eq 3)
                                {
                                    $opCode = $Array[$index].toString().substring($Array[$index].toString().Length-2,2)
                                    $1stParam = [string]$Array[$index].toString().substring(0,1)
                                }
                                elseif ($Array[$index].toString().Length -eq 4)
                                {
                                    $opCode = [string]$Array[$index].toString().substring($Array[$index].toString().Length-2,2)
                                    $2ndParam = [string]$Array[$index].toString().substring(0,1)
                                    $1stParam = [string]$Array[$index].toString().substring(1,1)
                                }
                                elseif ($Array[$index].toString().Length -eq 5)
                                {
                                    $opCode = [string]$Array[$index].substring($Array[$index].toString().Length-2,2)
                                    $3rdParam = [string]$Array[$index].toString().substring(0,1)
                                    $2ndParam = [string]$Array[$index].toString().substring(1,1)
                                    $1stParam = [string]$Array[$index].toString().substring(2,1)
                                }
                                else
                                {
                                    Write-Host "Error"
                                }
                                #endregion

                                #region Parsing out the Params for future Operations
                                ###Passing values into correct places
                                ###Setting Left Most Paramater Value Here Named Param1
                                if($3rdParam -eq 1)
                                {
                                    $3rdParam = $Array[$index+3]
                                }
                                elseif($3rdParam -eq 0)
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

                                $line = "`r`n`r`n`r`nNewLoop`r`nList of Paramaters`r`nOpCode: $opCode"
                                #out-file -InputObject $line -FilePath $OutFilePath -Append
                                ##Setting Next Paramater Value Here Named Param3
                                if($1stParam -eq 1)
                                {
                                    $1stParam = $Array[$index+1]
                                }
                                else
                                {
                                    $1stParam = $Array[$array[$index+1]]
                                }
                                #endregion

                                #region opCode
                                ###Old Code
                                ###### OP Code 1
                                if ([int]$opCode -eq 1)
                                {
                                    $Array[$3rdParam] = $1stParam + $2ndParam
                                    $index = $index + 4
                                    $line = "1stParam`:$1stParam `r`n2ndParam: $2ndParam`r`n3rdParam: $3rdParam `r`nYou ran Op Code 1 and made the element in slot $3rdParam`:"+$Array[$3rdParam]+"`r`nhere is the new Array `r`n"+$Array+"`r`nNew Index: $index"
                                    #out-file -InputObject $line -FilePath $OutFilePath -Append
                                }

                                ###### Op Code 2
                                elseif ([int]$opCode -eq 2)
                                {
                                    #$line = "BROKEN"
                                    ##out-file -InputObject $line -FilePath $OutFilePath -Append
                                    $Array[$3rdParam] = $1stParam * $2ndParam
                                    $index = $index + 4
                                    $line = "1stParam`:$1stParam `r`n2ndParam: $2ndParam`r`n3rdParam: $3rdParam `r`nYou ran Op Code 2 and made the element in slot $3rdParam`:"+$Array[$3rdParam]+"`r`nhere is the new Array `r`n"+$Array+"`r`nNew Index: $index"
                                    #out-file -InputObject $line -FilePath $OutFilePath -Append
                                }

                                ###### Op Code 3
                                elseif ([int]$opCode -eq 3)
                                {
                                    if($waitingOnInput -eq 0)
                                    {
                                        if($ampCounter -eq 5)
                                        {
                                        $1stInput = 0
                                        }
                                        #Write-Host HERE $1stInput
                                        ###Giving the input for the first question
                                        if($1stInput -eq 1)
                                        {
                                            $line = "Here is the original Array:`r`n"+$Array
                                            #out-file -InputObject $line -FilePath $OutFilePath -Append
                                            $phaseSetting = $AmpCounter % 5
                                            if($phaseSetting -eq 0)
                                                                    {
                                            $1stParam = $Array[$index+1]
                                            $Array[$1stParam] = $1st
                                            $index = $index + 2
                                            $1stInput = 0
                                            $line = "1stParam`: $1stParam`r`nAmp Count: $AmpCounter`r`nPhase Setting: $1st`r`nYou ran Op Code 3. Your input was $1st. This makes the value in slot $1stParam`: $1st`r`nhere is the new Array `r`n"+$Array+"`r`nNew Index: $index"
                                        }
                                            elseif($phaseSetting -eq 1)
                                                                    {
                                            $1stParam = $Array[$index+1]
                                            $Array[$1stParam] = $2nd
                                            $index = $index + 2
                                            $1stInput = 0
                                            $line = "1stParam`: $1stParam`r`nAmp Count: $AmpCounter`r`nPhase Setting: $2nd`r`nYou ran Op Code 3. Your input was $1st. This makes the value in slot $1stParam`: $2nd`r`nhere is the new Array `r`n"+$Array+"`r`nNew Index: $index"
                                        }
                                            elseif($phaseSetting -eq 2)
                                                                    {
                                            $1stParam = $Array[$index+1]
                                            $Array[$1stParam] = $3rd
                                            $index = $index + 2
                                            $1stInput = 0
                                            $line = "1stParam`: $1stParam`r`nAmp Count: $AmpCounter`r`nPhase Setting: $3rd`r`nYou ran Op Code 3. Your input was $1st. This makes the value in slot $1stParam`: $3rd`r`nhere is the new Array `r`n"+$Array+"`r`nNew Index: $index"
                                        }
                                            elseif($phaseSetting -eq 3)
                                                                    {
                                            $1stParam = $Array[$index+1]
                                            $Array[$1stParam] = $4th
                                            $index = $index + 2
                                            $1stInput = 0
                                            $line = "1stParam`: $1stParam`r`nAmp Count: $AmpCounter`r`nPhase Setting: $4th`r`nYou ran Op Code 3. Your input was $1st. This makes the value in slot $1stParam`: $4th`r`nhere is the new Array `r`n"+$Array+"`r`nNew Index: $index"
                                        }
                                            elseif($phaseSetting -eq 4)
                                                                    {
                                            $1stParam = $Array[$index+1]
                                            $Array[$1stParam] = $5th
                                            $index = $index + 2
                                            $1stInput = 0
                                            $line = "1stParam`: $1stParam`r`nAmp Count: $AmpCounter`r`nPhase Setting: $5th`r`nYou ran Op Code 3. Your input was $1st. This makes the value in slot $1stParam`: $5th`r`nhere is the new Array `r`n"+$Array+"`r`nNew Index: $index"
                                        }
                                        }
                                        else
                                        {
                                        if($outputs.Count -eq 0)
                                        {
                                            $1stParam = $Array[$index+1]
                                            $Array[$1stParam] = 0
                                            $index = $index + 2
                                            $line = "Output Count:"+$outputs.count+"`r`1stParam`: $1stParam`r`nAmp Count: $AmpCounter`r`nThis is the second inputPT1.`r`nYou ran Op Code 3. Your input was 0. This makes the value in slot $1stParam`: 0`r`nhere is the new Array `r`n"+$Array+"`r`nNew Index: $index"
                                        }
                                        else
                                        {
                                            $1stParam = $Array[$index+1]
                                            $Array[$1stParam] = $outputs[$nextInputIndex]
                                            $index = $index + 2
                                            $line = "Output Count:"+$outputs.count+"`r`n1stParam`: $1stParam`r`nAmp Count: $AmpCounter`r`nThis is the second inputPT2.`r`nYou ran Op Code 3. Your input was "+$outputs[$nextInputIndex]+" found at $outputs[$nextInputIndex]. This makes the value in slot $1stParam`: "+$outputs[$nextInputIndex]+"`r`nhere is the new Array `r`n"+$Array+"`r`nNew Index: $index"
                                        }
                                    }
                                    }
                                    elseif($waitingOnInput -eq 1)
                                    {
                                        
                                        $phaseSetting = $AmpCounter % 5
                                        if($phaseSetting -eq 0)
                                        {
                                            $1stIndex = $index
                                            #$1stIndex
                                            if($AmpCounter -lt 5)
                                            {
                                                $1stInput = 1
                                            }
                                            else
                                            {
                                                $1stInput = 0
                                            }
                                            
                                        }
                                        elseif($phaseSetting -eq 1)
                                        {
                                            $2ndIndex = $index
                                            #$2ndIndex
                                            if($AmpCounter -lt 5)
                                            {
                                                $1stInput = 1
                                            }
                                            else
                                            {
                                                $1stInput = 0
                                            }
                                            
                                        }
                                        elseif($phaseSetting -eq 2)
                                        {
                                            $3rdIndex = $index
                                            #$3rdIndex
                                            if($AmpCounter -lt 5)
                                            {
                                                $1stInput = 1
                                            }
                                            else
                                            {
                                                $1stInput = 0
                                            }
                                        }
                                        elseif($phaseSetting -eq 3)
                                        {
                                            $4thIndex = $index
                                            #$4thIndex
                                            if($AmpCounter -lt 5)
                                            {
                                                $1stInput = 1
                                            }
                                            else
                                            {
                                                $1stInput = 0
                                            }
                                        }
                                        elseif($phaseSetting -eq 4)
                                        {
                                            $5thIndex = $index
                                            #$5thIndex
                                            if($AmpCounter -lt 5)
                                            {
                                                $1stInput = 1
                                            }
                                            else
                                            {
                                                $1stInput = 0
                                            }
                                        }
                                        $AmpCounter++
                                        #out-file -InputObject $line -FilePath $OutFilePath -Append
                                        break
                                    }
                                    
                                    #out-file -InputObject $line -FilePath $OutFilePath -Append
                                }

                                ###### Op Code 4
                                elseif ([int]$opCode -eq 4)
                                {
                                    
                                    $line = "1stParam`:$1stParam `r`nYou ran Op Code 4 Here is your new output $1stParam`r`nNew Index: $index"
                                    #out-file -InputObject $line -FilePath $OutFilePath -Append
                                    $nextInputIndex = $outputs.Add("$1stParam")
                                    if($AmpCounter % 5 -eq 0)
                                    {
                                        $1stArray = $Array
                                        $line = "Setting First Array to the working Array"
                                    }
                                    elseif($AmpCounter % 5 -eq 1)
                                    {
                                        $2ndArray = $Array
                                        $line = "Setting Second Array to the working Array"
                                    }
                                    elseif($AmpCounter % 5 -eq 2)
                                    {
                                        $3rdArray = $Array
                                        $line = "Setting Third Array to the working Array"                                        
                                    }
                                    elseif($AmpCounter % 5 -eq 3)
                                    {
                                        $4thArray = $Array
                                        $line = "Setting Fourth Array to the working Array"
                                    }
                                    elseif($AmpCounter % 5 -eq 4)
                                    {
                                        $5thArray = $Array
                                        $line = "Setting Fifth Array to the working Array"
                                    }
                                    $index = $index + 2
                                    #endregion
                                    $Line = "AmpCounter: $AmpCounter"
                                    #out-file -InputObject $line -FilePath $OutFilePath -Append
                                    $waitingOnInput = 1
                                }

                                ###### Op Code 5
                                elseif ([int]$opCode -eq 5)
                                {
                                    if($1stParam -ne 0)
                                    {
                                        $index = $2ndParam
                                        $line = "1stParam: $1stParam `r`n2ndParam: $2ndParam `r`nYou ran Op Code 5. This evaluated to true.`r`nNew Index: $index"
                                        #out-file -InputObject $line -FilePath $OutFilePath -Append
                                    }
                                    else
                                    { 
                                        $index = $index+3
                                        $line = "1stParam: $1stParam `r`n2ndParam: $2ndParam `r`nYou ran Op Code 5. This evaluated to false.`r`nNew Index: $index"
                                        #out-file -InputObject $line -FilePath $OutFilePath -Append
                                    }
                                }

                                ###### Op Code 6
                                elseif ([int]$opCode -eq 6)
                                {
                                    if($1stParam -eq 0)
                                    {
                                        $index = $2ndParam
                                        $line = "1stParam: $1stParam `r`n2ndParam: $2ndParam `r`nYou ran Op Code 6. This evaluated to true.`r`nNew Index: $index"
                                        #out-file -InputObject $line -FilePath $OutFilePath -Append
                                    }
                                    else
                                    {
                                        $index = $index+3
                                        $line = "1stParam: $1stParam `r`n2ndParam: $2ndParam `r`nYou ran Op Code 6. This evaluated to false.`r`nNew Index: $index"
                                        #out-file -InputObject $line -FilePath $OutFilePath -Append
                                    }
                                }

                                ###### Op Code 7
                                elseif ([int]$opCode -eq 7)
                                {
                                    if($1stParam -lt $2ndParam)
                                    {
                                        $Array[$3rdParam] = 1
                                        $line = "1stParam: $1stParam `r`n2ndParam: $2ndParam `r`nYou ran Op Code 7. This evaluated to true. This makes cell $3rdParam`:$Array[$3rdParam]`r`n Here is the new Array`r`n$Array `r`nNew Index: $index"
                                        #out-file -InputObject $line -FilePath $OutFilePath -Append
                                    }
                                    else
                                    {
                                        $Array[$3rdParam] = 0
                                        $line = "1stParam: $1stParam `r`n2ndParam: $2ndParam `r`nYou ran Op Code 7. This evaluated to false. This makes cell $3rdParam`:$Array[$3rdParam]`r`n Here is the new Array`r`n$Array `r`nNew Index: $index"
                                        #out-file -InputObject $line -FilePath $OutFilePath -Append
                                    }
                                    $index = $index + 4
                                }

                                ###### Op Code 8
                                elseif ([int]$opCode -eq 8)
                                {
                                    if($1stParam -eq $2ndParam)
                                    {
                                        $Array[$3rdParam] = 1
                                        $line = "1stParam: $1stParam `r`n2ndParam: $2ndParam `r`nYou ran Op Code 8. This evaluated to true. This makes cell $3rdParam`:$Array[$3rdParam]`r`n Here is the new Array`r`n$Array `r`nNew Index: $index"
                                        #out-file -InputObject $line -FilePath $OutFilePath -Append
                                    }
                                    else
                                    {
                                        $Array[$3rdParam] = 0
                                        $line = "1stParam: $1stParam `r`n2ndParam: $2ndParam `r`nYou ran Op Code 8. This evaluated to false. This makes cell $3rdParam`:$Array[$3rdParam]`r`n Here is the new Array`r`n$Array `r`nNew Index: $index"
                                        #out-file -InputObject $line -FilePath $OutFilePath -Append
                                    }
                                    $index = $index + 4
                                }

                                ###### Op Code 99
                                elseif ([int]$opCode -eq 99)
                                {
                                    $AmpCounter++
                                    if($AmpCounter % 5 -eq 0)
                                    {
                                        $break = 1
                                    }
                                    #Write-Host "BREAK"
                                    break
                                }
                                #endregion
                            }
                        }

                         
                        $c = $outputs.Count - 1
                        $line = "Amps of $1st$2nd$3rd$4th$5th Output $c`: "+$outputs[$c]
                        #out-file -InputObject $line -FilePath $OutFilePath -Append
                        out-file -InputObject $line -FilePath $finalOutFilePath -Append
                        
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