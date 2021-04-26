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

# start window manager
exec dwm

