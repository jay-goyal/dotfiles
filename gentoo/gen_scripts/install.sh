SOFTWARE="`sed -e 's/#.*$//' -e '/^$/d' software.txt | tr '\n' ' '`"
layman -a gentoobr
layman -a swirl
emerge --ask --autounmask-continue $SOFTWARE

