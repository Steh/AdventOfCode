# 1. get the first and the last digit from every line 
# 2. combine all lines
import re

file = open("input.txt", "r")

output = 0

# loop through each line
for line in file:
    temp = ''
    line_out = ''

    # loop through each char
    for char in line:
        
        # if char is number add to output list
        if char.isnumeric():
            temp = temp + char
    
    # add first and last number to output
    output = output + int(temp[0]+temp[-1])

print(output)