# this is needed to dislay java programs like intellij correctly
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname LG3D

# dwm status bar
slstatus &

# needed for transparency
xcompmgr &

# initial setting background picture, sv/snooze will change it scheduled
feh --bg-scale --randomize --recursive /home/mb/Pictures

# screen handling
xset s 180 120
xss-lock -n screen-dim -- screen-lock &

# launch dbus
export $(dbus-launch)

# start window manager
exec dwm

