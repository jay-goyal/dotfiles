#!/bin/bash

# Define commands for each action
POWEROFF="systemctl poweroff"
REBOOT="systemctl reboot"
LOCK="hyprlock"
LOGOUT="hyprctl dispatch exit"

# Rofi command with -show-icons and existing theme
ROFI_CMD="rofi -dmenu -i -p 'Power Menu' -show-icons"

# Note: Assuming your theme is applied via ~/.config/rofi/config.rasi or -theme option
# If you use a custom theme path, add: -theme ~/.config/rofi/your_theme.rasi to $ROFI_OPTS

# Options with icon names (using standard icon names for -show-icons)
OPTIONS=(
    "Power Off\0icon\x1fxfsm-shutdown"
    "Reboot\0icon\x1fxfsm-reboot"
    "Lock\0icon\x1fxfsm-lock"
    "Logout\0icon\x1fxfsm-logout"
)

# Join options into a single string with newlines
OPTIONS_STR=$(printf "%s\n" "${OPTIONS[@]}")

# Show rofi menu and capture selection
SELECTED=$(echo -e "$OPTIONS_STR" | $ROFI_CMD)

# Execute the selected action
case "$SELECTED" in
    "Power Off:poweroff")
        $POWEROFF
        ;;
    "Reboot:reboot")
        $REBOOT
        ;;
    "Lock:lock")
        $LOCK
        ;;
    "Logout:logout")
        $LOGOUT
        ;;
esac
