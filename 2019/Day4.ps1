$minCount = 146810
$maxCount = 612564
$count = $minCount
$grandTotal = 0
while ($count -lt $maxCount)
{
    $count = [string]$count
    $first = $count.subString(0,1)
    $second = $count.subString(1,1)
    $third = $count.subString(2,1)
    $fourth = $count.subString(3,1)
    $fifth = $count.subString(4,1)
    $sixth = $count.subString(5,1)
    if ($first -le $second -and $second -le $third -and $third -le $fourth -and $fourth -le $fifth -and $fifth -le $sixth)
    {
        if ((($first -eq $second) -and $second -ne $third) -or (($second -eq $third) -and $second -ne $first -and $third -ne $fourth) -or (($third -eq $fourth) -and $third -ne $second -and $fourth -ne $fifth) -or (($fourth -eq $fifth) -and $fourth -ne $third -and $fifth -ne $sixth) -or (($fifth -eq $sixth) -and $fifth -ne $fourth))
        {
            $count
            $grandTotal++
        }
    }
    $count = [int]$count
    $count++
}
$grandTotal

