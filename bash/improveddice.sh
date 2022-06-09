#!/bin/bash
#
# this script rolls a pair of six-sided dice and displays both the rolls
#

# Task 1:
#  put the number of sides in a variable which is used as the range for the random number
#  put the bias, or minimum value for the generated number in another variable
#  roll the dice using the variables for the range and bias i.e. RANDOM % range + bias

#NOTE: As i understand i don't need to mention rane and bias because it was already comes with 
#die1=$(( RANDOM % 6 + 1 )) but i don't understand that i have to make  changes or not so just for 
#safety purpose i am making changes in  task 1. otherwise range = 6 and bias = 1 already listed.

range=6
bias=1

# Task 2:
#  generate the sum of the dice
#  generate the average of the dice

#  display a summary of what was rolled, and what the results of your arithmetic were

# Tell the user we have started processing
echo "Rolling..."
# roll the dice and save the results
#die1=$(( RANDOM % 6 + 1))
die1=$(( RANDOM % range + bias ))
#die2=$(( RANDOM % 6 + 1 ))
die2=$(( RANDOM % range + bias ))
# display the results
echo "Rolled $die1, $die2"


#Task 2: 1- Sum of Dice1 random Number and Dice2 random number
sum=$(( die1 + die2))
#Display the  sum result
echo "Sum of Dice1 and Dice2 is, $die1 + $die2 = $sum"

#Task 2: 2- Average of the dice(sum)
ave=$(( sum / 2 ))
#Display the Average of dice's sum
echo "And the Average is, $ave"

