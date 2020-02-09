#!/bin/bash

togglegpu() {
    if [ -f /etc/modprobe.d/disable-nvidia.conf.disable ]
    then
        sudo /home/docler/.local/bin/disablegpu.sh > /dev/null
    else
        sudo /home/docler/.local/bin/enablegpu.sh > /dev/null
    fi
}

trap "togglegpu" USR1

while true; do
    if [ -f /etc/modprobe.d/disable-nvidia.conf.disable ]
    then
        echo -e "%{F#ff4444}"
    else
        echo -e ""

    fi
    sleep 1 &
    wait
done
