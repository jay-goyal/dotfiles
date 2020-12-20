#!/bin/bash

declare options=("Sublime
Emacs
VSCode")

choice=$(echo -e "${options[@]}" | dmenu -p 'Which Text Editor Would You Like To Use?: ')

case "$choice" in
  Sublime)
    subl
  ;;
  Emacs)
    emacs
  ;;
  VSCode)
    code
  ;;
  *)
    exit 1
  ;;
esac
