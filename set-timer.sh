#!/bin/bash

sudo apt install cowsay -y
clear
echo "Hello $(whoami) ,"
sleep 2
cowsay You wanna set timers ?!
# Function to display the countdown
function countdown {
	local remaining=$1
	while [ $remaining -gt 0 ]; do
		printf "\r%02d:%02d:%02d" $((remaining / 3600)) $(((remaining / 60) % 60)) $((remaining % 60))
		sleep 1
		((remaining--))
	done
	echo -e "\nTime's up!"
}

# Function to validate input as integer
function validate_input {
	if ! [[ "$1" =~ ^[0-9]+$ ]]; then
		echo "Error: Input must be a positive integer"
		exit 1
	fi
}

# Function to prompt user for input
function prompt_for_duration {
	read -p "Enter the duration in seconds: " duration
	validate_input $duration
}

# Main script starts here
if [ $# -eq 1 ]; then
	# Validate input if provided as command line argument
	validate_input $1
	duration=$1
else
	# Prompt user for input
	prompt_for_duration
fi

# Start the countdown
countdown $duration
sleep 1
echo "Thanks for using ! (follow for more : https://github.com/sudeepbogati7)"
