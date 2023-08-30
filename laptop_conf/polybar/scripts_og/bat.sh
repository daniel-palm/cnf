#!/bin/sh

# Prints all batteries, their percentage remaining and an emoji corresponding
# to charge status (🔌 for plugged up, 🔋 for discharging on battery, etc.).
RED='\033[0;31m'
NC='\033[0m'
case $BLOCK_BUTTON in
	3) notify-send "🔋 Battery module" "🔋: discharging
🛑: not charging
♻: stagnant charge
🔌: charging
⚡: charged
❗: battery very low!
- Scroll to change adjust xbacklight." ;;
	4) xbacklight -inc 10 ;;
	5) xbacklight -dec 10 ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

# Loop through all attached batteries and format the info
for battery in /sys/class/power_supply/BAT?*; do
	# If non-first battery, print a space separator.
	[ -n "${capacity+x}" ] && printf " "
	# Sets up the status and capacity
	case "$(cat "$battery/status" 2>&1)" in
		"Full") status="🔌" ;;
		"Discharging") status="🔋" ;;
		"Charging") status=%{F#1E0}"🔌" ;;
		"Not charging") status="" ;;
		"Unknown") status="♻️" ;;
		*) exit 1 ;;
	esac
	capacity="$(cat "$battery/capacity" 2>&1)"
	# Will make a warn variable if discharging and low
	[ "$capacity" -le 25 ] && warn="🚨🚨🚨" && notify-send -u critical "😡CHARGE ME😡"
	# Prints the info
	printf "%s%s%d%%" "$warn" "$status" "$capacity"; unset warn
done && printf "\\n"