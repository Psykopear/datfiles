#/bin/bash
echo "^ca(1,poweroff)^fg(#EC5F67)^ca() ^ca(1, reboot)^fg(#FFCC00)^ca()^fg(white)  " \
 | dzen2 -dock -p -x "1814" -y "28" -w "106" -h "30" -e 'onstart=uncollapse;button1=exit;button3=exit'
