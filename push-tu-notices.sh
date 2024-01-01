#! /bin/bash


URL="https://www.tuiost.edu.np/notice"
DATA="/home/sudeep/Documents/linux/tu-notices.txt"
check_for_notices() {
	touch "$DATA"
	current_data = $(curl -s "$URL")
	previous_data = $( cat "$DATA")

	if [ "$current_data" != "$previous_data" ]; then
		echo "New notices found !"
	fi

	echo "$current_data" > "$previous_data"
}
