#! /bin/sh

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --output eDP-1-1 --rate 144.0
systemctl start auto-cpufreq.service
