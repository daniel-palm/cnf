#!/bin/bash

if [[  $(xrandr | grep " connected " | awk '{ print$1 }' | grep "DP2") ]]; then
        echo "DisplayPort detected"
        notify-send "DisplayPort detected, configuring.."
        sed -i s/HDMI2/DP2/ ~/.config/bspwm/bspwmrc
        #sed -i s/eDP1/DP2/ ~/.config/polybar/config
        sleep 1
	~/.config/scripts/display.sh_original
        bspc wm -r

elif [[  $(xrandr | grep " connected " | awk '{ print$1 }' | grep "HDMI2") ]]; then
        echo "DisplayPort detected"
        notify-send "HDMI detected, configuring.."
        sed -i s/DP2/HDMI2/ ~/.config/bspwm/bspwmrc
        #sed -i s/eDP1/HDMI2/ ~/.config/polybar/config
        sleep 1
        ~/.config/scripts/display.sh_original
        bspc wm -r


else
	notify-send "No external monitors detected."
	sleep 1
        sed -i s/DP2/eDP1/ ~/.config/polybar/config
        #sed -i s/HDMI2/eDP1/ ~/.config/polybar/config
	~/.config/scripts/display.sh_original
        bspc wm -r


#not working
#elif [[  $(xrandr | grep " connected " | awk '{ print$1 }' | grep DP-2) = 2 ]]; then
  #      notify-send "Display-port detected, configuring.."
 #       sed -i s/HDMI-2/DP-2/ ~/.config/bspwm/bspwmrc
  #     sleep 1
#	~/.config/scripts/display.sh
        #bspc wm -r
#	exit
#else
	#notify-send "No external displays detected."
#	sleep 1
#	~/.config/scripts/display.sh
#	sleep 3
#	notify-send "Exiting"
#	sleep 1
#	notify-send "..."
#	sleep 1
#	notify-send " .."
#	sleep 1
#	notify-send "  ."
#	exit
fi
