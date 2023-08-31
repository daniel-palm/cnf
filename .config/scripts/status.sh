#!/bin/bash

#notify-send "Battery: $(cat /sys/class/power_supply/BAT0/capacity)%"

notify-send "date:$(date '+%Y/%m/%d')"
notify-send "week:$(curl -s https://vecka.nu | grep -P '(?<!\d)\d{2}(?!\d)' | grep -o '[0-9:]*' | sed -n '2p')"
notify-send "netw:$(~/.config/polybar/scripts/network.sh -h)"
#notify-send "batt:$(cat /sys/class/power_supply/BAT0/capacity)%""
#notify-send $(~/.config/polybar/scripts/vol.sh)
#notify-send "w$(bspc query -D -d focused --names)"
#notify-send $(~/.config/polybar/scripts/checkupdates.sh)
