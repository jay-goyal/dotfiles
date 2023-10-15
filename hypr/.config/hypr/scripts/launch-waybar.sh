#!/bin/sh

CONFIG_FILES="$HOME/.config/waybar/config $HOME/.config/waybar/style.css $HOME/.config/waybar/default-modules.json $HOME/.config/waybar/themes/tokyonight.css $HOME/.config/waybar/themes/catppuccin_mocha.css"

trap "killall waybar" EXIT

while true; do
    waybar &
    inotifywait -e create,modify $CONFIG_FILES
    killall waybar
done
