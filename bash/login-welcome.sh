#!/bin/bash
#
# This script produces a dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Task 1: Use the variable $USER instead of the myname variable to get your name
# Task 2: Dynamically generate the value for your hostname variable using the hostname command - e.g. $(hostname)
# Task 3: Add the time and day of the week to the welcome message using the format shown below
#   Use a format like this:
#   It is weekday at HH:MM AM.
# Task 4: Set the title using the day of the week
#   e.g. On Monday it might be Optimist, Tuesday might be Realist, Wednesday might be Pessimist, etc.
#   You will need multiple tests to set a title
#   Invent your own titles, do not use the ones from this example

###############
# Variables   #
###############
title="Overlord"
USER="Meet B Patel"
hostname=$(uname -n)
d=$(date +%A)
tim=$(date +%H:%M:%p)

case $d in
	"Monday")
		echo "Momos"
		;;
	"Tuesday")
		echo "Tom"
		;;
	"Wednesday")
		echo "Wedding"
		;;
	"Thursday")
		echo "Therapy"
		;;
	"Friday")
		echo "Fun"
		;;
	"Saturday")
		echo "Weekend vibes"
		;;
	"Sunday")
		echo "weeend over"
		;;
esac 

###############
# Main        #
###############
cat <<EOF

MYNEWVAR="Welcome to planet $hostname, '$title $USER!' %/n It is $d at $tim."

EOF
