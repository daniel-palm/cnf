#!/bin/sh
# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#set systemd DISPLAY when not using a login-manager
dbus-update-activation-environment --systemd DISPLAY
xrdb ~/.Xresources
picom -b &
urxvtd -q -o -f
sxhkd &
dunst &
#set bg
#exec /home/chug/.config/scripts/bg.sh
#pactl set-default-sink alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink
#nitrogen --restore &
#xinput set-prop 9 315 -0.75
#xinput set-prop 11 315 -0.75
setxkbmap -option caps:backspace
xrandr --output DP-4 --primary --right-of DP-0
xrandr --output DP-4 --mode 1920x1080 --rate 340
xrandr --output DP-0 --mode 3440x1440 --rate 60
#xrdb -merge /home/derpalm/Documents/nordx/src/nord
#exec bspwm -c /home/chug/.config/bspwm/bspwmrc
exec sdorfehs -f /home/chug/.config/sdorfehs/config
xinput set-prop 13 292 -0.5

