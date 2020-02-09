#!/bin/bash

togglecompton() {
    if pgrep -x "picom" > /dev/null
    then
        pkill picom
    else
        picom --experimental-backends -b
    fi
}

trap "togglecompton" USR1

while true; do
    if pgrep -x "picom" > /dev/null
    then
        echo -e "%{T3}蘒"
    else
        echo -e "%{T3}﨡"
    fi
    sleep 1 &
    wait
done
