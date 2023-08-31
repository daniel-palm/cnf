#!/bin/sh

set -eu
while :
do
	# Uptime
	UP=$(uptime)
	UP=${UP#*up}
	UP=${UP%%,*}

	# Packages
	PKGS=$(checkupdates 2> /dev/null | wc -l)
	PKGS=${PKGS##* }		# strip leading spaces

    # Workspace
    AWS="$(xprop -root '\t$0' _NET_CURRENT_DESKTOP | cut -f 2)"
    WS="$name$(expr \( $AWS + 1 \))"        # because workspaces begin at '0'
    NWS="$(xprop -root '\t$0' _NET_NUMBER_OF_DESKTOPS | cut -f 2)"

	# Volume
	VOL=$(mixerctl -n outputs.master)
	VOL=${VOL%,*}			# strip other channel
	VOL=$(( (VOL * 100) / 254 ))
	MUTE=$(mixerctl -n outputs.master3.mute)
	if [ $MUTE = on ]
	then	MUTE=" ^fg(red)Shhh!^fg() /"
	else	MUTE=""
	fi

	# Battery
	O=$(envstat -s 'acpibat0:charge,acpibat0:charging,acpibat0:discharge rate')
	BAT_PERC=${O#*(}        # strip from beginning to '('
	BAT_PERC=${BAT_PERC%%.*}        # strip from first '.' to end
	BAT_STATE=${O#*charging:}       # snag charge state

	if [ $BAT_STATE = TRUE ]
	then STATE="^fg(green)+^fg()"       # charging
	else STATE="^fg(red)-^fg()"     # discharging
	fi

	# Date
	D=$(date '+%a %d %b %I:%M')

	# Weather
	WTTR=$(cat $HOME/.scripts/weather.txt)

	# Moon phase
	MOON="$(cat $HOME/.scripts/moon.txt)"

	# Print
    echo "$D ~ $WTTR / $PKGS# / $VOL% /$MUTE $STATE$BAT_PERC% / [$WS-$NWS]" > ~/.config/sdorfehs/bar
	sleep 1
done
