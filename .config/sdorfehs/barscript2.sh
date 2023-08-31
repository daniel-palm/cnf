#!/bin/bash

set -eu
while :
do
    # Workspace 
    # ...

    # Uptime
    UP=$(uptime)
    UP=${UP#*up}
    UP=${UP%%,*}
	
	# Temperature
	TEMP=$(sensors | awk '/Core 0/ {print $3, "C"}' | sed 's/.\{3\}$//')
    # Packages
    PKGS=$(checkupdates 2> /dev/null | wc -l)
    PKGS=${PKGS##* }		# strip leading spaces

    AWS="$(xprop -root '\t$0' _NET_CURRENT_DESKTOP | cut -f 2)"
    WS="$(expr \( $AWS + 1 \))" 
    NWS="$(xprop -root '\t$0' _NET_NUMBER_OF_DESKTOPS | cut -f 2)"
	SINK="$(pulseaudio-control --node-nickname "alsa_output.pci-0000_01_00.1.pro-output-7:monitor" --node-nickname "alsa_output.usb-046d_G435_Wireless_Gaming_Headset_V001008005.1-01.analog-stereo:headset" --node-nickname "alsa_output.pci-0000_00_1f.3.pro-output-0:headset" --node-nickname "alsa_output.pci-0000_00_1f.3.pro-output-0:monitor" output)"

    # Date
    D=$(date '+%b%d %H:%M')
    
    # Print colored output
	echo -e "[$SINK] $TEMP ^bg(#FFFFFF)pkgs:${PKGS}^bg() [^fg(yellow)${WS}^fg() /^fg(red) ${NWS}^fg()] $D" > ~/.config/sdorfehs/bar
	sleep 10
done
