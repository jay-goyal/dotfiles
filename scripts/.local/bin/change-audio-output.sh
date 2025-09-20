#!/bin/bash

# Rofi modi script for switching audio sinks
# Usage: Add this script to rofi with: rofi -modi "audio:./audio-sink-switcher.sh" -show audio

# Get the script name for rofi
SCRIPT_NAME=$(basename "$0")

# Function to get available sinks with friendly names
get_sinks() {
	pactl list short sinks | while read -r line; do
		sink_id=$(echo "$line" | cut -f1)
		sink_name=$(echo "$line" | cut -f2)

		# Try to get a more friendly description
		description=$(pactl list sinks | grep -A 10 "Name: $sink_name" | grep "Description:" | cut -d':' -f2 | sed 's/^ *//')

		if [ -n "$description" ]; then
			echo "$sink_id:$sink_name:$description"
		else
			echo "$sink_id:$sink_name:$sink_name"
		fi
	done
}

# Function to get current default sink
get_current_sink() {
	pactl get-default-sink
}

# Function to format sink list for rofi
format_sinks() {
	current_sink=$(get_current_sink)
	get_sinks | while IFS=':' read -r sink_id sink_name description; do
		if [ "$sink_name" = "$current_sink" ]; then
			echo "● $description ($sink_name)"
		else
			echo "  $description ($sink_name)"
		fi
	done
}

# Function to extract sink name from formatted string
extract_sink_name() {
	echo "$1" | sed 's/.*(\(.*\)).*/\1/'
}

# Main logic based on rofi modi protocol
if [ -z "$@" ]; then
	# Initial call - return list of sinks
	format_sinks
elif [ -n "$1" ]; then
	# User selected a sink - switch to it
	selected_sink=$(extract_sink_name "$1")

	# Set the new default sink
	pactl set-default-sink "$selected_sink"

	# Move all existing sink inputs to the new sink
	pactl list short sink-inputs | cut -f1 | while read -r input; do
		pactl move-sink-input "$input" "$selected_sink" 2>/dev/null
	done

	# Send notification (if notify-send is available)
	if command -v notify-send >/dev/null 2>&1; then
		sink_description=$(pactl list sinks | grep -A 10 "Name: $selected_sink" | grep "Description:" | cut -d':' -f2 | sed 's/^ *//')
		notify-send "Audio Sink Changed" "Default sink set to: $sink_description"
	fi

	# Exit rofi
	exit 0
fi
