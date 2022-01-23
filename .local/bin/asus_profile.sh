#! /bin/sh

asusctl profile -n
notify-send "Current Profile" "$(asusctl profile -p)" --icon="/home/jay/.config/dunst/fan.png"
