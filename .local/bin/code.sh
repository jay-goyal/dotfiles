declare -a editors=(
"CLion"
"Rider"
"Emacs"
"Quit"
)

choice = $(printf '%s\n' "${editors[@]}" | dmenu -h 27 -l 20 -bw 1 -p 'Open Editor: ')

case "$choice" in
    "CLion") clion;;
    "Rider") $HOME/JetBrains/Rider\ for\ Unreal\ Engine-2021.3/bin/rider.sh;;
    "Emacs") emacsclient -c -a emacs;;
    "Quit") echo "Program Terminated" && exit 1;;
    "") echo "Program Terminated" && exit 1;;
esac
