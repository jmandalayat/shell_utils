#!/bin/bash

# Function to display the cake
function display_cake() {
	echo
	echo "        🎂"
	echo "      🎂  🎂"
	echo "    🎂  🕯️  🎂"
	echo "  🎂 🎂 🎂 🎂 🎂"
	echo "🎂             🎂"
	sleep 1
	echo
	echo "🎂"
	echo "🎂"
	echo "🎂 🕯️"
	echo "🎂"
	echo "🎂 🎂 🎂 🎂"
	sleep 1
	echo
	echo
	echo "🎂 🎂 🎂 🎂"
	echo "🎂"
	echo "🎂 🎂 🕯️ 🎂"
	echo "🎂"
	echo "🎂 🎂 🎂 🎂"
	sleep 1
	echo
	echo "🎂       🎂"
	echo "  🎂   🎂"
	echo "    🕯️"
	echo "  🎂   🎂"
	echo "🎂       🎂"
	sleep 1
}

# Function to animate the candles
function animate_candles() {
	for i in {1..23}
	do

		echo -ne "   ($i) "
		j=1
		while [[ $j -le $i ]]
		do
			echo -n "🕯️"
			j=$j+1
		done
		sleep 0.3
	done
}

# Clear the screen
clear

# Infinite loop for the animation
while true
do
	animate_candles
	display_cake
	sleep 5
	clear
done
