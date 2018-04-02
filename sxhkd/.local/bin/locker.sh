#!/bin/bash
## OLD ONE, I keep it here for reference
### scrot /tmp/screen_locked.png -q 100 -d 0 -m
### convert /tmp/screen_locked.png -scale 10% -scale 1000% /tmp/screen_locked2.png
### convert /tmp/screen_locked.png  -blur 0x8 -colorspace Gray /tmp/screen_locked2.png
### composite -gravity center /home/docler/Pictures/clio.jpg /tmp/screen_locked2.png /tmp/screen_locked.png
### i3lock -i /tmp/screen_locked2.png -f
### rm /tmp/screen_locked.png /tmp/screen_locked2.png

# This is if you use i3lock-shiver
i3lock -g
# This is if you use i3lock-blur
# i3lock -f
