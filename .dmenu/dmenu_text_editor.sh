#!/bin/bash

declare options=("VSCode
Atom
Emacs
Sublime")

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
  Atom)
    atom
  ;;
  *)
    exit 1
  ;;
esac
