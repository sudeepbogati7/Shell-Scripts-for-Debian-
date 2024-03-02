#!/bin/bash
#!/bin/bash

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

# Main script starts here
if [ $# -ne 1 ]; then
	echo "Usage: $0 <duration in seconds>"
	exit 1
fi

# Validate input
validate_input $1

# Start the countdown
countdown $1
