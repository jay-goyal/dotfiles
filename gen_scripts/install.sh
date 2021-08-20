SOFTWARE="`sed -e 's/#.*$//' -e '/^$/d' software.txt | tr '\n' ' '`"
layman -a toniz4-overlay
layman -a swirl
emerge --ask --autounmask-continue $SOFTWARE

