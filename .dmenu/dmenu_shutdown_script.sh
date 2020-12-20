#!/bin/bash

declare options=("shutdown
shutdown_later
reboot")

choice=$(echo -e "${options[@]}" | dmenu -p 'What Should The Computer Do: ')

case "$choice" in
	shutdown)
		st -e shutdown now
	;;
	shutdown_later)
		st  -e shutdown
	;;
	reboot)
		st -e reboot
	;;
	*)
		exit 1
	;;
esac
