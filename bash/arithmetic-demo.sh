#!/bin/bash
#
# this script demonstrates doing arithmetic

# Task 1: Remove the assignments of numbers to the first and second number variables. Use one or more read commands to get 3 numbers from the user.
# Task 2: Change the output to only show:
#    the sum of the 3 numbers with a label
#    the product of the 3 numbers with a label


#Start Task
echo "Enter Three Numbers: "
read a 
read b
read c

#Sum of numbers
sum=$(( a + b + c ))


#Product of numbers
prod=$(( a * b * c ))

#Display Results
echo "Sum of Three number is, $sum"
echo "Product of three number is, $prod"

