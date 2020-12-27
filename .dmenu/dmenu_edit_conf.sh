#!/bin/bash

declare options=("st
alacritty
qtile
qtile_autostart
dmenu
fish
doom_init
doom_config
doom_packages
neovim")

choice=$(echo -e "${options[@]}" | dmenu -p 'Which Config File Do You Want To Edit: ')

case "$choice" in
  st)
    choice="$HOME/Repos/super-st/config.h"
  ;;
  alacritty)
    choice="$HOME/.alacritty.yml"
  ;;
  qtile)
    choice="$HOME/.config/qtile/config.py"
  ;;
  qtile_autostart)
    choice="$HOME/.config/qtile/autostart.sh"
  ;;
  dmenu)
    choice="$HOME/Repos/super-dmenu/config.h"
  ;;
  fish)
    choice="$HOME/.config/fish/config.fish"
  ;;
  doom_init)
    choice="$HOME/.doom.d/init.el"
  ;;
  doom_packages)
    choice="$HOME/.doom.d/packages.el"
  ;;
  doom_config)
    choice="$HOME/.doom.d/config.el"
  ;;
  neovim)
    choice="$HOME/.config/nvim/init.vim"
  ;;
  *)
    exit 1
  ;;
esac

atom "$choice"
