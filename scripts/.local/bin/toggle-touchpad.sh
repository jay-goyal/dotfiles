#!/usr/bin/env bash

# Set device to be toggled
export HYPRLAND_DEVICE="$(hyprctl devices | grep touchpad | sed 's/[[:space:]]//g')"
export HYPRLAND_VARIABLE="device[${HYPRLAND_DEVICE}]:enabled"

if [ -z "$XDG_RUNTIME_DIR" ]; then
  export XDG_RUNTIME_DIR=/run/user/$(id -u)
fi

# Check if device is currently enabled
export STATUS_FILE="$XDG_RUNTIME_DIR/touchpad.status"

# Try to get the touchpad status from status file.
if [ -f "$STATUS_FILE" ]; then
  export TOUCHPAD_ENABLED="$(cat "$STATUS_FILE")"
fi

# Toggle the touchpad
if [ "$TOUCHPAD_ENABLED" != "false" ]; then
  # The touchpad is known to be, or assumed to be, enabled (not disabled).
  export PREVIOUS_STATUS="true"
  export TOUCHPAD_ENABLED="false"
  # Try to disable the touchpad. If it fails, set the new status to enabled.
  hyprctl --batch -r -- keyword "$HYPRLAND_VARIABLE" $TOUCHPAD_ENABLED || export TOUCHPAD_ENABLED="true"
else
  # The touchpad is known to be disabled.
  export PREVIOUS_STATUS="false"
  export TOUCHPAD_ENABLED="true"
  # Try to enable the touchpad. If it fails, set the new status to disabled.
  hyprctl --batch -r -- keyword "$HYPRLAND_VARIABLE" $TOUCHPAD_ENABLED || export TOUCHPAD_ENABLED="false"
fi

# Write the new touchpad status into the status file.
echo "$TOUCHPAD_ENABLED" > "$STATUS_FILE"

# Generate the notification message.
export NOTIFMSG="Touchpad "

if [ "$TOUCHPAD_ENABLED" == "$PREVIOUS_STATUS" ]; then
  export NOTIFMSG+="could not be "
  # Touchpad could not be...
fi

if [ "$PREVIOUS_STATUS" == "true" ]; then
  export NOTIFMSG+="disabled."
  # Touchpad (could not be) disabled.
else
  export NOTIFMSG+="enabled."
  # Touchpad (could not be) enabled.
fi

notify-send -u normal "$NOTIFMSG"
