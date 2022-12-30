#! /bin/sh
monitor=$1
wallpaper_folder="$HOME/wallpapers"
wallpaper_count=$(ls -l $wallpaper_folder | wc -l)
wallpaper="$((1 + $RANDOM % $wallpaper_count)).jpg"
echo "$wallpaper"
hyprctl hyprpaper wallpaper "$monitor,$wallpaper_folder/$wallpaper"
