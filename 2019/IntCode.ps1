$fileIn = Get-Content 'C:\users\aarong\Advent of Code\Day2\Input.txt'
$array = $fileIn.Split(',')
$length = $array.Length
$index = 0
while ($length - $index -gt 0)
{
    if ($Array[$index] -eq 1)
    {
        $Array[$array[$index+3]] = [int]$Array[$array[$index+1]] + [int]$Array[$array[$index+2]]
    }
    elseif ($Array[$index] -eq 2)
    {
        $Array[$array[$index+3]] = [int]$Array[$array[$index+1]] * [int]$Array[$array[$index+2]]
    }
    elseif ($Array[$index] -eq 99)
    {
        $total = [int]$array[0] - 19690720
        $total
        break
    }
    $index = $index + 4
}
