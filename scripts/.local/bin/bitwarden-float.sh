#!/bin/sh

# Get the address of the Bitwarden window
address=$(hyprctl clients -j | jq '.[] | select(.title | contains("Bitwarden")) | .address')

# Check if the window is floating
is_floating=$(hyprctl clients -j | jq '.[] | select(.title | contains("Bitwarden")) | .floating')
class=$(hyprctl clients -j | jq '.[] | select(.title | contains("Bitwarden")) | .class')
# If the window is not floating, make it float
if [[ "$is_floating" == "false" && "$class" == "firefox" ]]; then
	command="hyprctl --quiet --batch dispatch setfloating address:\"$address\""
	eval "$command"
fi

# Get the current size and position of the window
winX=$(hyprctl clients -j | jq '.[] | select(.title | contains("Bitwarden")) | .size[0]')
winY=$(hyprctl clients -j | jq '.[] | select(.title | contains("Bitwarden")) | .size[1]')
atX=$(hyprctl clients -j | jq '.[] | select(.title | contains("Bitwarden")) | .at[0]')
atY=$(hyprctl clients -j | jq '.[] | select(.title | contains("Bitwarden")) | .at[1]')

# Calculate the desired size and position
target_width=350
target_height=600

# you need to enter your display resolution to center the window (mine was 1980x1080)
target_x=$((1920 / 2 - target_width / 2))
target_y=$((1080 / 2 - target_height / 2))

# Calculate the difference between the current and desired size and position
diff_width=$((target_width - winX))
diff_height=$((target_height - winY))
diff_x=$((target_x - atX))
diff_y=$((target_y - atY)) 

# Resize and move the window
command="hyprctl dispatch togglefloating -- address:\"$address\""
eval "$command"
command="hyprctl dispatch resizewindowpixel -- \"$diff_width\" \"$diff_height\",address:\"$address\""
eval "$command"
command="hyprctl dispatch movewindowpixel -- \"$diff_x\" \"$diff_y\",address:\"$address\""
eval "$command"
