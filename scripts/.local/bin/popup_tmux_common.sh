#!/bin/bash

if [[ "$(tmux display-message -p -F '#{session_name}')" == *popup ]]; then
	tmux detach-client
else
	tmux popup -E -w 80% -h 80% "tmux -u attach -t popup || tmux -u new -s popup -c $HOME"
fi
