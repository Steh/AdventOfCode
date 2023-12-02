file = open("input", "r")
result = 0

for line in file:
    # split to extract game number
    temp_split = line.split(':')
    game = temp_split[0]
    game_number = int((game.split(' '))[1])

    # split the rounds
    rounds = temp_split[1].split(';')

    #print(game)
    # loop throught new
    red_min_counter = 0
    blue_min_counter = 0
    green_min_counter = 0

    for round in rounds:
        colors = round.split(',')

        for color in colors:
            if color.__contains__('red'):
                number_red = int(((color.strip()).split(' '))[0])

                if number_red > red_min_counter:
                    red_min_counter = number_red
            
            if color.__contains__('green'):
                number_green = int(((color.strip()).split(' '))[0])

                if number_green > green_min_counter:
                    green_min_counter = number_green
            
            if color.__contains__('blue'):
                number_blue = int(((color.strip()).split(' '))[0])

                if number_blue > blue_min_counter:
                    blue_min_counter = number_blue
    # END for round in rounds:

    round_result = red_min_counter * green_min_counter * blue_min_counter

    result += round_result

# END for line in file:

print(result)