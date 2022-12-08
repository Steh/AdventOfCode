## https://adventofcode.com/2022/day/2
# A for Rock
# B for Paper
# C for Scissors

# X for Rock 1 Point
# Y for Paper 2 Points
# Z for Scissors 3 Points

# win: 6 points
# draw: 3 points
# losing: 0 Point 
$mypath = $MyInvocation.MyCommand.Path
$Script_base_path = Split-Path $mypath -Parent

$file =  $Script_base_path + "\input"
$score = 0

foreach($line in Get-Content $file) {
    $player1 = $line.Substring(0,1)
    $player2 = $line.Substring(2,1)

    ### PART1
    ###
    if($player2 -eq 'X'){
        Write-Debug "Rock +1"
        $score += 1

        switch($player1){
            "A"{
                # ROCK <-> ROCK
                $score += 3    
            }
            "B"{
                # ROCK - PAPER
                $score += 0    
            }
            "C"{
                # ROCK - Scissors
                $score += 6
                }
        } # END SWITCH
    } # end if

    if($player2 -eq 'Y'){
        Write-Debug "PAPER +2"
        $score += 2

        switch($player1){
            "A"{
                # Paper - ROCK
                $score += 6    
            }
            "B"{
                # Paper - PAPER
                $score += 3    
            }
            "C"{
                # Paper - Scissors
                $score += 0
            }
        } # END SWITCH
    } # end if


    if($player2 -eq 'Z'){
        Write-Debug "Scissors +3"
        $score += 3

        switch($player1){
            "A"{
                # Scissors - ROCK
                $score += 0    
            }
            "B"{
                # Scissors - PAPER
                $score += 6    
            }
            "C"{
                # Scissors - Scissors
                $score += 3
            }
        } # END SWITCH
    } # end if
}
$score