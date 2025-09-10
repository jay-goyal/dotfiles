#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
	selected=$1
else
	selected=$(fd ".*" ~/projects --min-depth 1 --max-depth 2 --type d | fzf)
fi

if [[ -z "$selected" ]]; then
	exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)
zoxide add "$selected"

if [[ ! -z $(tmuxifier ls | grep -w "$selected_name") ]]; then
	tmuxifier load-session "$selected_name"
	exit 0
fi

if [[ -z "$TMUX" ]] && [[ -z "$tmux_running" ]]; then
	tmux -u new-session -s "$selected_name" -c "$selected"
	exit 0
fi

if ! tmux -u has-session -t="$selected_name" 2>/dev/null; then
	tmux -u new-session -ds "$selected_name" -c "$selected"
fi

if [[ -z "$TMUX" ]]; then
	tmux -u attach -t "$selected_name"
else
	tmux -u switch-client -t "$selected_name"
fi
