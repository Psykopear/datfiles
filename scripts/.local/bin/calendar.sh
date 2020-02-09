TODAY=$(expr `date +'%d'` + 0)
MONTH=`date +'%m'`
YEAR=`date +'%Y'`

(
echo '^bg(#222222)^fg(#DE8834)'`date +'%d %b %H.%M'`;
# current month, hilight header and today
cal | sed -re "s/^(.*[A-Za-z][A-Za-z]*.*)$/^fg(#DE8834)^bg(#222222)\1/;
s/(^|[ ])($TODAY)($|[ ])/\1^bg(#DE8834)^fg(#222222)\2^fg(#6c6c6c)^bg(#222222)\3/"
sleep 8
) | dzen2 -fg '#6c6c6c' -bg '#222222' -fn 'xft:Terminus:size=10' -x 828 -y 30 \
-w 160 -l 7
