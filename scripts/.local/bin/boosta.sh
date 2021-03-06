#!/bin/bash

# boosta: easy bookmark management

# variables
# USAGE="<span font_weight='bold'>Alt+o</span>: open bookmark | <span font_weight='bold'>Alt+n</span>: add bookmark | <span font_weight='bold'>Alt+d</span>: delete bookmark"
USAGE="<span font_weight='bold'>Alt+o</span>: open | <span font_weight='bold'>Alt+n</span>: new | <span font_weight='bold'>Alt+d</span>: delete"
KEYS="-kb-custom-1 Alt+o -kb-custom-2 Alt+n -kb-custom-3 Alt+d"

# function definitions
######################
function openBookmark()
{
    output=$(cat $BOOKMARKS | $LAUNCHER Bookmarks: -mesg "$USAGE" $KEYS)
    retval=$?
    # return if a special keycombo was pressed
    [ $retval -ne 0 ] && return $retval
    # extract url and open it in the specified browser
    url=$(echo $output | awk -F '|' '{printf("%s ", $NF)}' | tr -d '\r\n')
    if [ ${#url} -gt 0 ]
    then
        $BROWSER $url
    fi
}

function addBookmark()
{
    # get window title from xprop, to pre-fill the title dialog
    id=$(xprop -root | grep '_NET_ACTIVE_WINDOW(WINDOW)' | awk '{print $NF}')
    pretitle=$(xprop -id $id | grep '_NET_WM_NAME(UTF8_STRING)' | awk -F '"' '{print $2}' | awk -F '-' '{print $1}')
    # ask for tags, title and url, exit if any response is empty
    tags=$(cat $BOOKMARKS | awk -F '|' '{print $1}' | sort -f | uniq | $LAUNCHER Tags: -mesg "$USAGE" $KEYS)
    retval=$?
    # return if a special keycombo was pressed
    [ $retval -ne 0 ] && return $retval
    [ -z $tags ] && exit 1
    title=$(cat $BOOKMARKS | awk -F '|' '{print $2}' | sort -f | uniq | $LAUNCHER Title: -mesg "$USAGE" $KEYS -filter "$pretitle")
    retval=$?
    # return if a special keycombo was pressed
    [ $retval -ne 0 ] && return $retval
    [ -z "$title" ] && exit 1
    url=$(cat $BOOKMARKS | awk -F '|' '{print $3}' | sort -f | uniq | $LAUNCHER URL: -mesg "$USAGE" $KEYS)
    retval=$?
    # return if a special keycombo was pressed
    [ $retval -ne 0 ] && return $retval
    [ -z "$url" ] && exit 1
    # add bookmark to file and sort it
    echo "$tags|$title|$url" >> "$BOOKMARKS"
    sort -f "$BOOKMARKS" -o /tmp/bookmarks_sorted
    mv /tmp/bookmarks_sorted "$BOOKMARKS"
}

function deleteBookmark()
{
    output=$(cat $BOOKMARKS | $LAUNCHER Bookmarks: -mesg "$USAGE" $KEYS)
    retval=$?
    # return if a special keycombo was pressed
    [ $retval -ne 0 ] && return $retval
    # ask for confirmation to delete the selected bookmark
    confirm=$(echo -e "[Y]es\n[N]o" | $LAUNCHER 'Do you really want to delete the following bookmark:' -mesg "$output" $KEYS)
    retval=$?
    ( [ $retval -ne 0 ] || [ "$confirm" != "[Y]es" ] ) && return $retval
    grep -v -F "$output" "$BOOKMARKS" > /tmp/bookmarks_deleted
    mv /tmp/bookmarks_deleted "$BOOKMARKS"
}


# script execution starts here
##############################

# source configuration or use default values
if [ -f $HOME/.config/boosta/config ]; then
  source $HOME/.config/boosta/config
else
  # TODO: better make LAUNCHER a function with an argument for -p
  # TODO: only _add_ rofi options in config file
  LAUNCHER="rofi -dmenu -i -l 40 -p"
  BROWSER="firefox"
  BOOKMARKS="$HOME/.config/boosta/bookmarks"
fi

# default: retval=10 -> open bookmark
retval=10
while [ $retval -ne 0 ]
do
  case "$retval" in
    1)
      # rofi was closed (e.g. by ESC)
      exit 0
      ;;
    10)
      openBookmark
      retval=$?
      ;;
    11)
      addBookmark
      retval=$?
      ;;
    12)
      deleteBookmark
      retval=$?
      ;;
  esac
done
