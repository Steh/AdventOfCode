## https://adventofcode.com/2022/day/7
# Filesize
$ErrorActionPreference = 'Stop'
$mypath = $MyInvocation.MyCommand.Path
$Script_base_path = Split-Path $mypath -Parent

$file =  Get-Content ($Script_base_path + "\input")

$pre_line = ''
foreach($line in $file){
    
    if($line -like "$ cd .."){
        $pre_line = $pre_line.Substring(0,$pre_line.Length -4)

    } elseif($line -like "$ cd *"){
        $pre_line += '    '

    } elseif ($line -notlike '$ ls') {
        $split_line = $line.Split(' ')
        $visual_tree = $pre_line + "" + $split_line[1] + ' - ' + $split_line[0]
    }

}