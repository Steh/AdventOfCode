
#condition variables
red_condition = 12 
green_condition = 13 
blue_condition = 14

# counter for possible games and sum of round number
possible_games = 0
possible_games_sum = 0

# read input
file = open("input", "r")

# loop through lines
for line in file:
    # split to extract game number
    temp_split = line.split(':')
    game = temp_split[0]
    game_number = int((game.split(' '))[1])

    # split the rounds
    rounds = temp_split[1].split(';')

    # game possible boolean
    possible_game= 1

    #print(game)
    # loop throught new
    for round in rounds:
        # round possible boolean
        possible_round = 1
        colors = round.split(',')

        # loop color
        # if cube count for one color is higher than the condition game is not possible
        for color in colors:
            
            if color.__contains__('red'):
                number_red = int(((color.strip()).split(' '))[0])

                if number_red > red_condition:
                    possible_round = 0
                    continue
            
            if color.__contains__('green'):
                number_green = int(((color.strip()).split(' '))[0])

                if number_green > green_condition:
                    possible_round = 0
                    continue
            
            if color.__contains__('blue'):
                number_blue = int(((color.strip()).split(' '))[0])

                if number_blue > blue_condition:
                    possible_round = 0
                    continue
        
        # if round is not possible set game is not possible
        if possible_round == 0:
            possible_game = 0
    
    # if game is possible add vales to the counters
    if possible_game == 1:
        possible_games += 1
        possible_games_sum += game_number

    # END for round in rounds:
# END for line in file:

print(possible_games)
print(possible_games_sum)