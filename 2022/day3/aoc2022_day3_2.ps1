## https://adventofcode.com/2022/day/3
$mypath = $MyInvocation.MyCommand.Path
$Script_base_path = Split-Path $mypath -Parent

$file =  $Script_base_path + "\input"
$score = 0

# array for counting
$alphabet = "0abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

# Line Count
$file_content = @{}
$file_content = Get-Content $file
$line_count_in_file = ($file_content | Measure-Object -Line).Lines

for($i = 0; $i -lt ($line_count_in_file +1)) {

    # creat substrings
    $line_part_a = $file_content[$i]
    $line_part_b = $file_content[$i + 1]
    $line_part_c = $file_content[$i + 2]
    
    # loop through each char
    foreach($char_a in [char[]]$line_part_a){
        
        # test if character is in part b
        if($line_part_b.contains($char_a)){
            #"True: " + $char_a + " " + $line_part_b

                if($line_part_c.contains($char_a)){
                    $score += $alphabet.IndexOf($char_a)
                    break
                }
            }
            # stops foreach
    } # foreach($char_a in [char[]]$line_part_a){

    # add counter
    $i = $i + 3
}
$score