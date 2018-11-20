#!/bin/sh

# X related config...
xrdb .Xresources

# Touchpad, set natural scrolling and tap to click
xinput --set-prop 'SYNA2393:00 06CB:7A13 Touchpad' "libinput Tapping Enabled" 1
xinput --set-prop 'SYNA2393:00 06CB:7A13 Touchpad' "libinput Natural Scrolling Enabled" 1
# xinput --set-prop 11 275 1
# xinput --set-prop 11 285 1


# Keyboard layout
# -layout us,it \
setxkbmap \
  -layout us \
  -option ctrl:nocaps \
  -option grp:alt_space_toggle \
  -option shift:both_capslock_cancel \
  -option compose:ralt \
  -option terminate:ctrl_alt_bksp &

# Startup programs...
libinput-gestures-setup start
# libinput-gestures &
xedgewarp -b &
# redshift -l geoclue2 &
redshift -l 43.106277:12.386502 &
compton &
mons -a & # Disable other displays if only one monitor

# Tray area stuff
nm-applet &
arandr-indicator &
xfce4-power-manager &
# pasystray &
comptray &

export QT_STYLE_OVERRIDE=gtk
export QT_QPA_PLATFORMTHEME=gtk2


# Set background
feh --bg-fill /home/docler/.wallpapers/ &

# Keys bindings, DE/WM agnostic
sxhkd &

# Hack to make gtk apps startup time human
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &

# polkit session
lxsession &

xrandr --dpi 96


# Delete $HOME/tmp folder and create it again
rm -rf $HOME/tmp
mkdir $HOME/tmp

# xrandr --output eDP-1-1 --primary
# Start WM!
exec i3
