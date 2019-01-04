#!/bin/sh
xrandr --output VIRTUAL1 --off --output DP1 --off --output DP3 --primary --mode 3840x2160 --rate 60 --pos 0x0 --rotate normal --dpi 140 --output eDP1 --off --output DP2 --off
i3-msg "restart"
# modify .config/i3/config, section "bar" value "height" from 28 to 42
# modify ~/.Xresources, add Xft.dpi: 140

