## https://adventofcode.com/2022/day/4
$mypath = $MyInvocation.MyCommand.Path
$Script_base_path = Split-Path $mypath -Parent

$file =  $Script_base_path + "\input"
$count = 0

foreach($line in Get-Content $file) {
    $split_line = $line.Split(",")
    
    $value_pair1 = $split_line[0]
    $value_pair2 = $split_line[1]

    if($value_pair1 -eq $value_pair2){
        $count += 1
        continue
    }

    [int]$value_pair1_a = $value_pair1.Split('-')[0]
    [int]$value_pair1_b = $value_pair1.Split('-')[1]

    [int]$value_pair2_a = $value_pair2.Split('-')[0]
    [int]$value_pair2_b = $value_pair2.Split('-')[1]

    # check if Pair1 is fully in Pair2
    if(($value_pair1_a -ge $value_pair2_a) -And ($value_pair1_b -le $value_pair2_b)){
        $count +=1
        Write-Host "    $($line)"
        continue
    } elseif (($value_pair2_a -ge $value_pair1_a) -And ($value_pair2_b -le $value_pair1_b)) {
        $count +=1
        Write-Host "    $($line)"
        continue
    }
    Write-Host "$($line)"
}
$count