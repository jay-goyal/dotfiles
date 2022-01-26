killall emacs
killall polybar
killall dunst
picom &
$HOME/.config/polybar/launch-dwm.sh &
nm-applet &
feh --randomize --bg-fill ~/wallpapers/* &
thunar --daemon &
lxsession &
dunst &
emacs --daemon &
#killall caa
#sleep 3 && $HOME/BITSNetAuth/bin/caa --daemon &
