#! /bin/sh
monitor=$1
wallpaper_folder="$HOME/wallpapers/"
wallpaper_count=`expr $(ls -l $wallpaper_folder | wc -l) - 1`
echo $wallpaper_count
wallpaper="$((1 + $RANDOM % $wallpaper_count)).jpg"
echo "$wallpaper"
swaybg -m fill -o HDMI-A-1 -i "$wallpaper_folder$wallpaper" &
swaybg -m fill -o eDP-1 -i "$wallpaper_folder$wallpaper" &