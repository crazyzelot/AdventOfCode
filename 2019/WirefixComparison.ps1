$pointsOnWire1 = Get-Content "C:\Users\aarong\Advent of Code\Day3\PointsOnWire1.txt" -raw
$pointsOnWire1Lines = Get-Content "C:\Users\aarong\Advent of Code\Day3\PointsOnWire1.txt"
$pointsOnWire2 = Get-Content "C:\Users\aarong\Advent of Code\Day3\PointsOnWire2.txt"
$count = 0
$pointsOnWire2.Length
Write-Host "Entering Loop"
foreach ($point in $pointsOnWire2)
{
    if ($pointsOnWire1 -like "*`r`n$point`r`n*")
    {
        $points = $point.Split(" ")
        $total = [math]::abs([int]$points[0])+[math]::abs([int]$points[1])
        out-file -InputObject "$point $total" -FilePath "C:\Users\aarong\Advent of Code\Day3\Totals.txt" -Append
        $c = 0
        foreach ($temp in $pointsOnWire1Lines)
        {
            if ($temp -eq $point)
            {

                $steps = [int]$count+[int]$c
                out-file -InputObject "$steps" -FilePath "C:\Users\aarong\Advent of Code\Day3\Totals.txt" -Append
                break
            }
            $c++
        }
    }
    $count++
    if ($count % 100 -eq 0)
    {
        Write-Host "We are on "$count "of" $pointsOnWire2.Length
    }
}

