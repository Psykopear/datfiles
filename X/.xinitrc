#!/bin/zsh

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
# redshift &
# redshift-gtk &
# picom --experimental-backends &
# mons -a & # Disable other displays if only one monitor

# Tray area stuff
# xfce4-power-manager &

# Variables
export QT_STYLE_OVERRIDE=gtk2
export QT_QPA_PLATFORMTHEME=gtk2
export TERM=alacritty

# Set background
# feh --bg-fill /home/docler/.wallpapers/space.png &
# feh --bg-fill /home/docler/.wallpapers/space.png &
# feh --randomize --bg-fill ~/.config/polybar/wallpaper/ &
# feh --bg-fill /usr/share/sddm/themes/chili/assets/background.jpg &
# betterlockscreen -w

# Keys bindings, DE/WM agnostic
sxhkd &

# Polybar
# sh ~/.config/polybar/launch.sh &
# polybar main -c ~/.config/polybar/config.ini &
# sh ~/.config/polybar/launch.sh &
# sleep 3; sh ~/.config/polybar/launch.sh &

# Hack to make gtk apps startup time human
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &

# polkit session
# lxsession &

xrandr --dpi 92.56
# ~/src/ulauncher/ul run &
# python ~/repos/i3scripts/autoname_workspaces.py --norenumber_workspace --icon_list_format chemist &

# Delete $HOME/tmp folder and create it again
rm -rf $HOME/tmp
mkdir $HOME/tmp

# Start WM!
exec i3
