declare -a editors=(
"CLion"
"WebStorm"
"Emacs"
"Quit"
)

choice=$(printf '%s\n' "${editors[@]}" | dmenu -h 27 -l 20 -bw 1 -p 'Open Editor: ')

case "$choice" in
    "CLion") clion;;
    "WebStorm") webstorm;;
    "Emacs") emacsclient -c -a emacs;;
    "Quit") echo "Program Terminated" && exit 1;;
    "") echo "Program Terminated" && exit 1;;
esac
