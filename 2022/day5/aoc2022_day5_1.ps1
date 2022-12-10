## https://adventofcode.com/2022/day/4
$ErrorActionPreference = 'Stop'
$mypath = $MyInvocation.MyCommand.Path
$Script_base_path = Split-Path $mypath -Parent

$file =  Get-Content ($Script_base_path + "\input")
$multyArr = @()
$line_counter = 1

# Build Array
foreach($line in $file){
    if($line.Contains("[")){
        #$line
        $multyArr += $line
    }
    $i++
    if($line -match 1){
        break
    }
}

# reverse readed input
[array]::Reverse($multyArr)

$strg1 = ''
$strg2 = ''
$strg3 = ''
$strg4 = ''
$strg5 = ''
$strg6 = ''
$strg7 = ''
$strg8 = ''
$strg9 = ''


foreach($line in $multyArr){
    $temp = $line -split '(.{4})' -ne ''

    $strg1 += $temp[0]
    $strg2 += $temp[1]
    $strg3 += $temp[2]
    $strg4 += $temp[3]
    $strg5 += $temp[4]
    $strg6 += $temp[5]
    $strg7 += $temp[6]
    $strg8 += $temp[7]
    $strg9 += $temp[8]
}
$array = @($strg1,$strg2,$strg3,$strg4,$strg5,$strg6,$strg7,$strg8,$strg9)
$array = $array -replace ' ',''
$array = $array -replace ']',''
$array = $array -replace '\[',''

# Array ist done!

$array
$working_array = $array

foreach ($line in $file) {
    <# $line is tfiles current item #>
    if($line -like "move*"){
        # get number of chars to move
        $charCount_to_move  = $line | Select-String '(\d+)' -AllMatches | ForEach-Object {$_.Matches[0].Groups[1].Value}

        # get number of array to 
        $source_line_number = $line | Select-String '(\d+)' -AllMatches | ForEach-Object {$_.Matches[1].Groups[1].Value}
        $target_line_number = $line | Select-String '(\d+)' -AllMatches | ForEach-Object {$_.Matches[2].Groups[1].Value}

        "inst: " +$line
        "   source: " + $working_array[$source_line_number -1]
        # getting substring and removing it
        $array_substring_start = (($working_array[$source_line_number -1].length) - $charCount_to_move)
        $substring = $working_array[$source_line_number -1].substring($array_substring_start, $charCount_to_move)
        $working_array[$source_line_number -1] = $working_array[$source_line_number -1] -replace $substring, ''
        "   source: " + $working_array[$source_line_number -1]

        # reverse the string
        $substringReverse = $substring.ToCharArray()
        [array]::Reverse($substringReverse)
        $substringReverse = -join($substringReverse)

        "   substring: " + $substringReverse        
        "   target: " + $working_array[$target_line_number -1]
        $working_array[$target_line_number -1] += $substringReverse
        "   target: " + $working_array[$target_line_number -1]
    }
}