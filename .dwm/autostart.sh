killall emacs
killall polybar
picom &
$HOME/.config/polybar/launch-dwm.sh &
nm-applet &
feh --randomize --bg-fill ~/wallpapers/* &
thunar --daemon &
emacs --daemon &
lxsession &