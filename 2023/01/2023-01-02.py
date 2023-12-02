# 1. get the first and the last digit from every line 
# 2. combine all lines
import re

file = open("input.txt", "r")
output = 0

# loop through each line
for line in file:
    temp = ''
    
    #replace the writen numbers with its digits
    # if you don´t write the names back other numbers will get cut like: oneight
    line = line.replace("one", "one1one")
    line = line.replace("two", "two2two")
    line = line.replace("three", "three3three")
    line = line.replace("four", "four4four")
    line = line.replace("five", "five5five")
    line = line.replace("six", "six6six")
    line = line.replace("seven", "seven7seven")
    line = line.replace("eight", "eight8eight")
    line = line.replace("nine", "nine9nine")

    # loop through each char
    for char in line:
        # if char is number add to output list
        if char.isnumeric():
            temp += char
    
    # add first and last number to output
    output +=  int(temp[0]+temp[-1])

print(output)