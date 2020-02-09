#!/bin/bash
convert ~/.wallpapers/space.png <( curl wttr.in/Perugia_tqp0.png ) -geometry +1662+955 -composite ~/tmp/.background.png
feh --bg-fill ~/tmp/.background.png
