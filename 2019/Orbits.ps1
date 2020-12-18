$orbits = Get-Content -Path 'C:\users\aarong\Advent of Code\Day6\Orbits.txt'
$planet = @()
$unique = @()
$sat = @()
foreach ($orbit in $orbits)
{
    $orbitArray = $orbit.split(")")
    $planet = $planet + $orbitArray[0]
    $sat = $sat + $orbitArray[1]
}

foreach ($p in $planet)
{
    if ($unique -ccontains $p)
    {
        
    }
    else
    {
        $unique = $unique + $p
    }
}
foreach ($s in $sat)
{
    if ($unique -ccontains $s)
    {
        
    }
    else
    {
        $unique = $unique + $s
    }
}
$orbitCount = New-Object 'int[]' $unique.Length

foreach ($s in $sat)
{
    if ($unique -ccontains $s)
    {
        $index = [array]::indexOf($unique,$s)
        $orbitCount[$index] = [int]$orbitCount[$index] + 1
    }
}


###########Part 1 loop
#$thMax= $planet.Length
#$c = 0
#while ($c -lt $thMax)
#{
#    foreach($s in $sat)
#    {
#       $satIndex = [array]::indexOf($sat,$s)
#        $p = $planet[$satIndex]
#        $satOrbitCountIndex = [array]::indexOf($unique,$s)
#        $planetOrbitCountIndex = [array]::indexOf($unique,$p)
#       $orbitCount[$satOrbitCountIndex] = $orbitCount[$planetOrbitCountIndex] + 1
#    }
#   $c++
#    $c
#}
#$c=0
#$total = 0
#$orbitCount.Length
#foreach ($count in $orbitCount)
#{
#    Write-Host $unique[$c], $orbitCount[$c]
#    $total = $total + $count
#    $c++
#}
#$total
###########End of Part 1 loop

###########Start of Part 2 loop
$foundMiddle = $false
$youPath = @()
$sanPath = @()
$youHops = @()
$sanHops = @()
$youIndex = [array]::indexOf($sat,'YOU')
$sanIndex = [array]::indexOf($sat,'SAN')
$hops = 0
do 
{
    $youPl = $planet[$youIndex]
    $youPath = $youPath + $youPl
    $sanPl = $planet[$sanIndex]
    $sanPath = $sanPath + $sanPl
    if ($youPath -ccontains $sanPl)
    {
        Write-Host Found San PL
        $foundMiddle = $true
        $index = [array]::indexOf($youPath,$sanPl)
        $youCount = $youHops[$index]
        $youPath[$index]
        $index = [array]::indexOf($sanPath,$sanPl)
        $sanCount = $sanHops[$index]
        $total = $sanCount + $youCount
        $sanPath[$index]

        $total
    }
    elseif ($sanPath -ccontains $youPl)
    {
        Write-Host Found You PL
        $foundMiddle = $true
        $index = [array]::indexOf($youPath,$youPl)
        $youCount = $youHops[$index-1]
        $youPath[$index]
        Write-Host Index, $index You Count $youCount
        $index = [array]::indexOf($sanPath,$youPl)
        $sanCount = $sanHops[$index-1]#Removing Santa from the hops I am not trying to orbit santa but co orbit with him.
        $sanPath[$index]
        Write-Host Index, $index You Count $sanCount
        $total = $sanCount + $youCount
        Write-Host Total: $total
    }
    elseif ($youPl -eq 'COM')
    {
        $sanIndex = [array]::indexOf($sat,$sanPl)
        $hops = $hops + 1
        $sanHops = $sanHops + $hops
        
    }
    elseif ($sanPl -eq 'COM')
    {
       $youIndex = [array]::indexOf($sat,$youPl)
       $hops = $hops + 1
       $youHops = $youHops + $hops
    }
    else
    {
       $youIndex = [array]::indexOf($sat,$youPl)
       $sanIndex = [array]::indexOf($sat,$sanPl)
       $hops = $hops + 1
       $youHops = $youHops + $hops
       $sanHops = $sanHops + $hops
    }
} Until ($foundMiddle)
Write-Host BREAK
#THIS Works to increment the next hop by 1 Now to figure out how to increment through.
#$index = [array]::indexOf($orbitCount,0)
#$satIndex = [array]::indexOf($planet,$unique[$index])
#$sat[$satIndex]
#$uniqueIndex = [array]::indexOf($unique,$sat[$satIndex])
#$orbitCount[$uniqueIndex] = $orbitCount[$index] + 1
#$orbitCount[$uniqueIndex]