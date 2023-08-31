#/bin/bash
#
BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
PINK="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"
NORMAL="\033[0;39m"

set -eu
while :
do

   # Workspace 
   # I have removed the leading $ used to define the variable in original script
   # also removed the $name, as it is not needed in my case.
	# Uptime
	UP=$(uptime)
	UP=${UP#*up}
	UP=${UP%%,*}

	# Packages
	PKGS=$(checkupdates 2> /dev/null | wc -l)
	PKGS=${PKGS##* }		# strip leading spaces

    AWS="$(xprop -root '\t$0' _NET_CURRENT_DESKTOP | cut -f 2)"
    WS=" $(expr \( $AWS + 1 \))" 
    NWS="$(xprop -root '\t$0' _NET_NUMBER_OF_DESKTOPS | cut -f 2)"


	# Date
	D=$(date '+%a %d %b %I:%M')
	echo "%{#FDAO}$D"
	echo "%{F#f00}🔇muted" 
#	echo $AWS
#	echo $WS
#	echo $NWS

	# Print date and workspace in this case
        # only using the number for current desktop
        echo  " pkgs:$PKGS# / [$WS] $NWS  /  $D  " > ~/.config/sdorfehs/bar
	sleep 10

done
