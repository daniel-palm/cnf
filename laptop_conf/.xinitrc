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
#exec /home/derpalm/.config/scripts/bg.sh
#pactl set-default-sink alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink
#nitrogen --restore &
xinput set-prop "TPPS/2 Elan TrackPoint" "libinput Accel Speed" -0.5
xinput set-prop 13 313 1
xinput set-prop "Synaptics TM3471-010" "libinput Natural Scrolling Enabled" 1 
xinput set-prop 9 315 -0.75
xinput set-prop 11 315 -0.75
xinput set-prop 11 315 1
#setxkbmap -option caps:backspace
setxkbmap -option caps:escape
exec bspwm -c /home/derpalm/.config/bspwm/bspwmrc
