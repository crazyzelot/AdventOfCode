$fileIn = Get-Content 'C:\users\aarong\Advent of Code\Day1\ModuleMass.txt'
$grandTotalFuel = 0

foreach ($mass in $fileIn)
{
    $totalFuel = 0  
    while ($mass -gt 0)
    {
        $step1 = [math]::Floor($mass/3)
        $fuel = $step1 - 2
        $mass = $fuel
        if ($fuel -le 0)
        {
        }
        else
        {
            $totalFuel = $totalFuel + $fuel
            #$totalFuel
        }
    }
    $GrandTotalFuel = $GrandTotalFuel + $totalFuel
    $GrandTotalFuel
}
