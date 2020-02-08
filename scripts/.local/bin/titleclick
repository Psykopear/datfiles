#!/bin/bash
i3-msg floating toggle

active_window=`xdotool getactivewindow`
keep_going=true
prev_state="down"


while [[ "$keep_going" = true ]]
do
    x=`xdotool getmouselocation | cut -d':' -f 2 | cut -d ' ' -f 1`
    y=`xdotool getmouselocation | cut -d':' -f 3 | cut -d ' ' -f 1`
    xdotool windowmove $active_window $x $y
    cur_state=`xinput --query-state 12 | grep "button\[1\]=" | cut -d'=' -f2`
    if [[ "$prev_state" = "up" && "$cur_state" = "down" ]]; then
        keep_going=false
    fi
    prev_state=$cur_state
done
