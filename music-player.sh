#!/bin/bash
echo "------------------------------------------------------------------"
echo "Installing dependencies ..........."
echo "------------------------------------------------------------------"
sleep 3
cowsay Hey , Do you wanna get relax with music ......? Okey, I will be playing some musics of your choice
sleep 3

echo "------------------------------------------------------------------"
echo "Lets install the required packages first ............."
sleep 3
echo "-------------------------------------------------------------------"
echo "Installing mpv package which helps to play tracks through your terminal ... !"
echo "-------------------------------------------------------------------"
sleep 3
sudo apt install mpv -y
echo "-------------------------------------------------------------------"
echo "Installing socat ......."
echo "-------------------------------------------------------------------"
sleep 2
sudo apt install socat -y

sleep 2
echo "-------------------------------------------------------------------"
echo "Everything is set ..... you are good to go now.....!!"
echo "--------------------------------------------------------------------"
sleep 3

# Define the directory containing your music files
MUSIC_DIR="$HOME/Music"
# Function to list available tracks
list_tracks() {
	echo "Available tracks:"
	ls "$MUSIC_DIR"
}

# Function to play a track
play_track() {
	local track="$1"
	mpv "$MUSIC_DIR/$track"
}

# Main loop
while true; do
	echo "-------------------------"
	echo "1. List tracks"
	echo "2. Play track"
	echo "3. Pause/Resume"
	echo "4. Skip track"
	echo "5. Shuffle tracks"
	echo "6. Quit"
	echo "-------------------------"
	read -p "Enter your choice: " choice

	case $choice in
	1)
		list_tracks
		;;
	2)
		list_tracks
		read -p "Enter the name of the track to play: " track
		play_track "$track"
		;;
	3)
		echo "Pause/Resume"
		echo '{"command": ["cycle", "pause"]}' | socat - /tmp/mpvsocket
		;;
	4)
		echo "Skipping track"
		echo '{"command": ["playlist-next"]}' | socat - /tmp/mpvsocket
		;;
	5)
		echo "Shuffling tracks"
		echo '{"command": ["playlist-shuffle"]}' | socat - /tmp/mpvsocket
		;;
	6)
		echo "Exiting..."
		exit 0
		;;
	*)
		echo "Invalid choice. Please enter a number from 1 to 6."
		;;
	esac
done
