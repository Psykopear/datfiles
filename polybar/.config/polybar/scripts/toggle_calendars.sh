#!/bin/sh
if pgrep -x "calendars" > /dev/null
then
    pkill calendars &
else
    ~/src/calendars/target/release/calendars
fi
