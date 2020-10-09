#!/bin/sh

case "$1" in
    --toggle)
        if [ "$(pgrep -x picom)" ]; then
            systemctl --user stop picom
        else
            systemctl --user start picom
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
