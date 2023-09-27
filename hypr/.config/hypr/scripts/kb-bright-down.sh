#! /bin/sh

asus_out=$(asusctl -k)
curr_bright=${asus_out: -1}
case $curr_bright in
    1)
        asusctl -k off;;
    2)
        asusctl -k low;;
    3)
        asusctl -k med;;
    *) ;;
esac
