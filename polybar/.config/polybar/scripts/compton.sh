#!/bin/sh

case "$1" in
    --toggle)
        if [ "$(pgrep -x picom)" ]; then
            pkill picom
        else
            picom -b --experimental-backends
        fi
        ;;
    *)
        if [ "$(pgrep -x picom)" ]; then
            echo "蘒"
        else
            echo "﨡"
        fi
        ;;
esac
