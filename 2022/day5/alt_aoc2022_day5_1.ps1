## https://adventofcode.com/2022/day/4
$mypath = $MyInvocation.MyCommand.Path
$Script_base_path = Split-Path $mypath -Parent

$file =  Get-Content ($Script_base_path + "\input")
$line_counter = 1

# Build Array
foreach($line in $file){
    if ($line -like " 1*") {
        $row_counter = ($line.Trim() -split '[\D]+')
        break
    }
    $line_counter++
}

# building output arrays
$output_array = @($row_counter)

# Filling the Values to the Arrays
$array_counter= 0

for($i = $line_counter -2; $i -ge 0;$i--){

    #$output_array[$array_counter] = @()

    for ($x = 0; $x -lt $row_counter[-1]; $x++) {
        $temp_value = $file[$i].Substring($x*4,3)

        if($temp_value -match "[A-Za-z]"){
            #"output_array[$x] = $temp_value"
            #$output_array[$array_counter][$x] = @()
            $output_array[$x] += $temp_value
        }
    } 

    $array_counter++
}


#get instructions
$start_line = $line_counter + 2

$working_array = $output_array

#for($i = $start_line; $i -le $file.Length; $i++){
for($i = $start_line; $i -le 12; $i++){
    ## get instructions
    $instructions = $file[$i]
    
    [int]$char_count =           $instructions | Select-String '(\d+)' -AllMatches | ForEach-Object {$_.Matches[0].Groups[1].Value}
    [int]$source_array_number =  ($instructions | Select-String '(\d+)' -AllMatches | ForEach-Object {$_.Matches[1].Groups[1].Value}) -1
    [int]$target_array_number =  ($instructions | Select-String '(\d+)' -AllMatches | ForEach-Object {$_.Matches[2].Groups[1].Value}) -1

    if($source_array_number -gt 0){
        ## execute

        ### get string
        $string_length = $working_array[$source_array_number].Length
        if($string_length -gt 0){
            #$working_array[$source_array_number]
            #$string_length
            #$instructions
            #$char_count
            
            $instructions
            $substring = $working_array[$source_array_number].Substring($string_length - ($char_count*3),($char_count*3))
            
            # replacing
            $working_array[$source_array_number] = $working_array[$source_array_number ].Substring(0,($string_length - ($char_count*3)))
            $working_array[$target_array_number] = $working_array[$target_array_number] + $substring
        }
    }    
}
$output_array
$working_array