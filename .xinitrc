#!/bin/bash
source /home/leex/.xinputrc

# Enable core dumps in case something goes wrong
ulimit -c unlimited

xsetroot -cursor_name left_ptr

#load Xdefaults
xrdb ~/.Xdefaults

#Disable screensaver
xset -dpms
xset s noblank
xset s off

# Disable bell
xset b off

xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 8 1
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 8 2
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 8 6 7 4 5
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

exec ck-launch-session dbus-launch i3 > /dev/null 2>&1
