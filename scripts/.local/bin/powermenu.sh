#!/bin/sh

# Options with icon names (using standard icon names for -show-icons)
OPTIONS=(
    "Power Off\0icon\x1fxfsm-shutdown"
    "Reboot\0icon\x1fxfsm-reboot"
    "Hibernate\0icon\x1fsystem-suspend-hibernate"
    "Lock\0icon\x1fxfsm-lock"
    "Logout\0icon\x1fxfsm-logout"
)

# Join options into a single string with newlines
OPTIONS_STR=$(printf "%s\n" "${OPTIONS[@]}")

# Show rofi menu and capture selection
SELECTED=$(echo -e "$OPTIONS_STR" | rofi -dmenu -i -p " " -show-icons)

# Execute the selected action
case "$SELECTED" in
    "Power Off")
        systemctl poweroff
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Hibernate")
        $HOME/.local/bin/hibernate.sh
        ;;
    "Lock")
        hyprlock
        ;;
    "Logout")
        hyprctl dispatch exit
        ;;
esac
