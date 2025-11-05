#!/bin/bash

if [[ "$(tmux display-message -p -F '#{session_name}')" == *popup ]]; then
	tmux detach-client
else
	# Get the current session name
	current_session=$(tmux display-message -p -F "#{session_name}")
	# Create a new session name by appending "popup" to the current session name
	popup_session="${current_session}-popup"

	# Create the popup with the new session name
	tmux popup -E -w 80% -h 80% "tmux -u attach -t $popup_session || tmux -u new -s $popup_session"
fi
