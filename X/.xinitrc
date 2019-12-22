#!/bin/sh

# X related config...
xrdb .Xresources

# Touchpad, set natural scrolling and tap to click
xinput --set-prop 'SYNA2393:00 06CB:7A13 Touchpad' "libinput Tapping Enabled" 1
xinput --set-prop 'SYNA2393:00 06CB:7A13 Touchpad' "libinput Natural Scrolling Enabled" 1

# Use this to enable touchpad while typing (useful for games)
# xinput --set-prop 'SYNA2393:00 06CB:7A13 Touchpad' 'Disable While Typing Enabled' 0

# Set keyboard speed, default is 660 25
xset r rate 300 65

# Add ~/.fonts folder to system's font's folders
xset +fp ~/.fonts/

# Set mouse cursor for bspwm
# xsetroot -cursor_name left_ptr

# Keyboard layout
setxkbmap \
  -layout us \
  -option ctrl:nocaps \
  -option grp:alt_space_toggle \
  -option shift:both_capslock_cancel \
  -option compose:ralt \
  -option terminate:ctrl_alt_bksp &

xedgewarp -b &

# Startup programs...
libinput-gestures-setup start
# redshift -l 43.106277:12.386502 &
redshift &
picom --experimental-backends &
# mons -a & # Disable other displays if only one monitor

# Tray area stuff
xfce4-power-manager &

# Variables
export QT_STYLE_OVERRIDE=gtk2
export QT_QPA_PLATFORMTHEME=gtk2
export TERM=alacritty

# Set background
# feh --bg-fill /home/docler/.wallpapers/space.png &
# feh --bg-fill /home/docler/.wallpapers/space.png &
# feh --randomize --bg-fill ~/.config/polybar/wallpaper/ &
feh --randomize --bg-fill Pictures/FFBackground.jpg &

# Keys bindings, DE/WM agnostic
#### Now started as a systemd user service,
#### not sure it's a good idea
# sxhkd -c /home/docler/.config/sxhkd/sxhkdrc.bspwm &
sxhkd &
sh ~/.config/polybar/launch.sh &
# polybar top &
# conky-startup.sh &

# Hack to make gtk apps startup time human
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &

polkit session
lxsession &

xrandr --dpi 141.21

# Delete $HOME/tmp folder and create it again
rm -rf $HOME/tmp
mkdir $HOME/tmp

# Start WM!
exec i3
