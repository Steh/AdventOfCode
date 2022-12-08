## https://adventofcode.com/2022/day/2
# A for Rock
# B for Paper
# C for Scissors

# X means you need to lose, 
# Y means you need to end the round in a draw 
# Z means you need to win
$mypath = $MyInvocation.MyCommand.Path
$Script_base_path = Split-Path $mypath -Parent

$file =  $Script_base_path + "\input"
$score = 0

foreach($line in Get-Content $file) {
    $player1 = $line.Substring(0,1)
    $player2 = $line.Substring(2,1)

    ### PART1
    ###

    # ROCK
    if($player1 -eq 'A'){

        switch($player2){
            "X"{
                # lose: ROCK - SCISSOR
                $score += 3
                $score += 0
            }
            "Y"{
                # draw: ROCK - ROCK
                $score += 1
                $score += 3
            }
            "Z"{
                # win: ROCK - Paper
                $score += 2
                $score += 6
                }
        } # END SWITCH
    } # end if

    # PAPER
    if($player1 -eq 'B'){

        switch($player2){
            "X"{
                # lose: PAPER - ROCK
                $score += 1
                $score += 0
            }
            "Y"{
                # draw: PAPER - PAPER
                $score += 2
                $score += 3
            }
            "Z"{
                # win: ROCK - SCISSOR
                $score += 3
                $score += 6
                }
        } # END SWITCH
    } # end if

    #Scissors
    if($player1 -eq 'C'){

        switch($player2){
            "X"{
                # lose: Scissors - PAPER
                $score += 2
                $score += 0
            }
            "Y"{
                # draw: Scissors - Scissors
                $score += 3
                $score += 3
            }
            "Z"{
                # win: Scissors - ROCK
                $score += 1
                $score += 6
                }
        } # END SWITCH
    } # end if
}
$score