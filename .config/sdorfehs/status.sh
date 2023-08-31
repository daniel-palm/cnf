#!/bin/sh

while :
sleep 10 # Updating status every 10 seconds
do # because status takes over sdorfehs messages

DATE=`date +'%a %b %d'`
TIME=`date +'%H:%M'`
BATTERY=`cat /sys/class/power_supply/max170xx_battery/capacity`
NETWORK=$(exec /home/chug/.config/polybar/scripts/network.sh -h)
PACMAN=$(exec /home/chug/.config/polybar/scripts/checkupdates.sh)
MEMORY=$(exec /home/chug/.config/polybar/scripts/memory.sh)

# All together now!
echo $MEMORY \ $PACMAN \ $NETWORK \ $DATE \ $TIME
done

