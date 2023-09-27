#! /bin/sh

asus_out=$(asusctl -k)
curr_bright=${asus_out: -1}
case $curr_bright in
    0)
        asusctl -k low;;
    1)
        asusctl -k med;;
    2)
        asusctl -k high;;
    *) ;;
esac
