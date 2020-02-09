#!/bin/bash
sink=`pacmd stat | awk -F": " '/^Default sink name: /{print $2}'`
volume=`pacmd list-sinks | awk -W posix '/^[ \t]+name: /{insink = $2 == "<'$sink'>"} /^[ \t]+volume: / && insink {gsub("%", ""); print $5; exit}'`
muted_message=`pacmd list-sinks | awk -W posix '/^[ \t]+name: /{insink = $2 == "<'$sink'>"} /^[ \t]+muted: / && insink {print $2; exit}'`
volume_down=""
volume_up=""
volume_off=""

if [ "$muted_message" = "yes" ]; then
    echo "$volume_off X"
else
    echo "$volume_up $volume%"
fi
