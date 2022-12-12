## https://adventofcode.com/2022/day/46
#The first time a marker appears is after the seventh character arrives. Once it does, the last four characters received are jpqm, which are all different. In this case, your subroutine should report the value 7, because the first start-of-packet marker is complete after 7 characters have been processed.


$ErrorActionPreference = 'Stop'
$mypath = $MyInvocation.MyCommand.Path
$Script_base_path = Split-Path $mypath -Parent

$file =  Get-Content ($Script_base_path + "\input")
$start_string = 0
[int]$endOfFile_count = $file.Length 

for($i=1;$i -lt $endOfFile_count -2;$i++){

    $tempString = $file.Substring($start_string,4)

    $found = $false
    $tempStringArray = $tempString.ToCharArray()

    $uniqueChar = $tempStringArray | select -Unique

    if($uniqueChar.count -like 4){
        $tempString
        #$start_string + 5
        $i +3
        EXIT
    }
    

    $start_string += 1
}
