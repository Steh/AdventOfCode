$mypath = $MyInvocation.MyCommand.Path
$Script_base_path = Split-Path $mypath -Parent

$file =  $Script_base_path + '\input.txt'
$value = 0
$counter = 1
$highest = 0
$output = @()

foreach($line in Get-Content $file) {
    if($line -match "\d+"){
        $value += $line
    } else {
        
        $counter += 1

        if($value -gt $highest){
            $highest = $value
            $counter.ToString() + ": " + $value.ToString()
        }
        $output += $value
        $value=0
    }
}
$result = 0

$output | sort  | select -Last 3 | foreach{ $result += $PSItem}
$result
