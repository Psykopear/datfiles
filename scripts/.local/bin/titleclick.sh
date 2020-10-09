#!/bin/bash
i3-msg floating toggle

active_window=`xdotool getactivewindow`
prev_state="down"
mouses=(`xinput --list | rg "slave  pointer" | cut -d'=' -f2 | cut -d'[' -f1`)


while true
do
    x=`xdotool getmouselocation | cut -d':' -f 2 | cut -d ' ' -f 1`
    y=`xdotool getmouselocation | cut -d':' -f 3 | cut -d ' ' -f 1`
    xdotool windowmove $active_window $x $y
    for mouse in "${mouses[@]}"
    do
        cur_state=`xinput --query-state $mouse | grep "button\[1\]=" | cut -d'=' -f2`
        if [[ "$prev_state" = "up" && "$cur_state" = "down" ]]; then
            exit 0
        fi
    done
    prev_state=$cur_state
done
