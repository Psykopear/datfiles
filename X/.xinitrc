##!/bin/sh

## X related config...
#xrdb .Xresources

## Touchpad, set natural scrolling and tap to click
#xinput --set-prop 'SYNA2393:00 06CB:7A13 Touchpad' "libinput Tapping Enabled" 1
#xinput --set-prop 'SYNA2393:00 06CB:7A13 Touchpad' "libinput Natural Scrolling Enabled" 1

## Use this to enable touchpad while typing (useful for games)
## xinput --set-prop 'SYNA2393:00 06CB:7A13 Touchpad' 'Disable While Typing Enabled' 0

## Set keyboard speed, default is 660 25
#xset r rate 300 65

## Add ~/.fonts folder to system's font's folders
#xset +fp ~/.fonts/

## Keyboard layout
#setxkbmap \
#  -layout us \
#  -option ctrl:nocaps \
#  -option grp:alt_space_toggle \
#  -option shift:both_capslock_cancel \
#  -option compose:ralt \
#  -option terminate:ctrl_alt_bksp &

#xedgewarp -b &

## Variables
#export QT_STYLE_OVERRIDE=kvantum
#export QT_QPA_PLATFORMTHEME=kvantum
#export TERM=alacritty

## Keys bindings, DE/WM agnostic
#sxhkd &

## Hack to make gtk apps startup time human
#dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &

## Delete $HOME/tmp folder and create it again
#rm -rf $HOME/tmp
#mkdir $HOME/tmp

## Start WM!
#exec i3
