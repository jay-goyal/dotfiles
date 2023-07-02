#!/bin/sh

swayidle -w timeout 300 "$HOME/.config/hypr/scripts/lock.sh" \
    before-sleep "$HOME/.config/hypr/scripts/lock.sh"
