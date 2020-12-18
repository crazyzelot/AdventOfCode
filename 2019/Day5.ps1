$fileIn = '3,225,1,225,6,6,1100,1,238,225,104,0,1101,40,71,224,1001,224,-111,224,4,224,1002,223,8,223,101,7,224,224,1,224,223,223,1102,66,6,225,1102,22,54,225,1,65,35,224,1001,224,-86,224,4,224,102,8,223,223,101,6,224,224,1,224,223,223,1102,20,80,225,101,92,148,224,101,-162,224,224,4,224,1002,223,8,223,101,5,224,224,1,224,223,223,1102,63,60,225,1101,32,48,225,2,173,95,224,1001,224,-448,224,4,224,102,8,223,223,1001,224,4,224,1,224,223,223,1001,91,16,224,101,-79,224,224,4,224,1002,223,8,223,101,3,224,224,1,224,223,223,1101,13,29,225,1101,71,70,225,1002,39,56,224,1001,224,-1232,224,4,224,102,8,223,223,101,4,224,224,1,223,224,223,1101,14,59,225,102,38,143,224,1001,224,-494,224,4,224,102,8,223,223,101,3,224,224,1,224,223,223,1102,30,28,224,1001,224,-840,224,4,224,1002,223,8,223,101,4,224,224,1,223,224,223,4,223,99,0,0,0,677,0,0,0,0,0,0,0,0,0,0,0,1105,0,99999,1105,227,247,1105,1,99999,1005,227,99999,1005,0,256,1105,1,99999,1106,227,99999,1106,0,265,1105,1,99999,1006,0,99999,1006,227,274,1105,1,99999,1105,1,280,1105,1,99999,1,225,225,225,1101,294,0,0,105,1,0,1105,1,99999,1106,0,300,1105,1,99999,1,225,225,225,1101,314,0,0,106,0,0,1105,1,99999,107,677,226,224,1002,223,2,223,1005,224,329,1001,223,1,223,8,226,226,224,102,2,223,223,1006,224,344,101,1,223,223,7,226,677,224,1002,223,2,223,1005,224,359,101,1,223,223,1007,677,226,224,1002,223,2,223,1005,224,374,1001,223,1,223,1007,677,677,224,1002,223,2,223,1006,224,389,101,1,223,223,1008,226,226,224,1002,223,2,223,1005,224,404,1001,223,1,223,108,677,226,224,1002,223,2,223,1006,224,419,1001,223,1,223,1108,677,226,224,102,2,223,223,1006,224,434,1001,223,1,223,108,226,226,224,1002,223,2,223,1005,224,449,101,1,223,223,7,677,677,224,1002,223,2,223,1006,224,464,1001,223,1,223,8,226,677,224,1002,223,2,223,1005,224,479,1001,223,1,223,107,226,226,224,102,2,223,223,1006,224,494,101,1,223,223,1007,226,226,224,1002,223,2,223,1005,224,509,1001,223,1,223,1107,226,677,224,102,2,223,223,1005,224,524,1001,223,1,223,108,677,677,224,1002,223,2,223,1005,224,539,101,1,223,223,1107,677,226,224,102,2,223,223,1005,224,554,1001,223,1,223,107,677,677,224,1002,223,2,223,1005,224,569,101,1,223,223,8,677,226,224,102,2,223,223,1005,224,584,1001,223,1,223,7,677,226,224,102,2,223,223,1006,224,599,101,1,223,223,1008,677,677,224,1002,223,2,223,1005,224,614,101,1,223,223,1008,677,226,224,102,2,223,223,1006,224,629,1001,223,1,223,1108,677,677,224,102,2,223,223,1006,224,644,101,1,223,223,1108,226,677,224,1002,223,2,223,1005,224,659,1001,223,1,223,1107,226,226,224,102,2,223,223,1006,224,674,1001,223,1,223,4,223,99,226'
$nextInput = 0

[Int64[]]$Array = $fileIn.Split(",")
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
        Write-Host "Output"
        Write-Host $1stParam
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
        Write-Host "Only Input"
        $1stParam = $Array[$index+1]
        $Array[$1stParam] = 5
        $index = $index + 2
    }
    elseif ([int]$opCode -eq 99)
    {
        Write-Host "BREAK"
        break
    }
}
