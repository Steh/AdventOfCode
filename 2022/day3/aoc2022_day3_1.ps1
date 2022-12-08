## https://adventofcode.com/2022/day/3
$mypath = $MyInvocation.MyCommand.Path
$Script_base_path = Split-Path $mypath -Parent

$file =  $Script_base_path + "\input"
$score = 0

# array for letter value
$alphabet = "0abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

foreach($line in Get-Content $file) {
    $line_count_half = $line.Length / 2

    # creat substrings
    $line_part_a = $line.Substring(0, $line_count_half)
    $line_part_b = $line.Substring($line_count_half)
    
    # loop through each char
    foreach($char_a in [char[]]$line_part_a){
        
        # test if character is in part b
        if($line_part_b.contains($char_a)){
            #"True: " + $char_a + " " + $line_part_b

            # stops foreach
            $score += ($alphabet.IndexOf($char_a))
            break
        } # if($char_a in $line_part_b){
    } # foreach($char_a in [char[]]$line_part_a){
}
$score