#!/usr/bin/env bash
# Rofi modi for hyprshot
# Lets user choose capture mode and whether to copy or save

set -eo pipefail

run_hyprshot() {
    local SELECTION="$1"
    local MODE ACTION
    MODE=$(awk '{print $1}' <<< "$SELECTION")
    ACTION=$(awk '{print $2}' <<< "$SELECTION" | tr -d '()')

    if [[ "$ACTION" == "copy" ]]; then
        hyprshot -m "$MODE" --clipboard-only
    else
        hyprshot -m "$MODE"
    fi
}

# If no arguments, output menu entries
if [[ $# -eq 0 ]]; then
cat <<EOF
output (copy)
output (save)
window (copy)
window (save)
region (copy)
region (save)
EOF
    exit 0
fi

# Handle "run" phase from rofi
run_hyprshot "$1"
