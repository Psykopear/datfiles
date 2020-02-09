#!/bin/sh
DATE="$(date +"%a %d %H:%M")"

case "$1" in
    --popup)
        yad --calendar --undecorated --fixed --close-on-unfocus --no-buttons \
            --width=230 --height=230 --posx=824 --posy=35 \
            > /dev/null
        ;;
    *)
        echo "$DATE"
        ;;
esac
