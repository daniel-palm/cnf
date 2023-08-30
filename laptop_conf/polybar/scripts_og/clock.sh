#!/bin/sh

clock=$(date '+%I')
week=$(curl -s https://vecka.nu | grep -P '(?<!\d)\d{2}(?!\d)' | grep -o '[0-9:]*' | sed -n '2p')

case "$clock" in
	"00") icon="🕛" ;;
	"01") icon="🕐" ;;
	"02") icon="🕑" ;;
	"03") icon="🕒" ;;
	"04") icon="🕓" ;;
	"05") icon="🕔" ;;
	"06") icon="🕕" ;;
	"07") icon="🕖" ;;
	"08") icon="🕗" ;;
	"09") icon="🕘" ;;
	"10") icon="🕙" ;;
	"11") icon="🕚" ;;
	"12") icon="🕛" ;;
esac

Date()
{
	#date "+ $icon%H:%M"
	date "+%b %d$icon%H:%M"
}
Week()
{
	notify-send "📅 $(date "+%Y/%m/%d")" && notify-send "week: $(curl -s https://veckonr.se | grep "Vecka" | sed -n '1p' | grep -o '[0-9:]*' | sed -n '1p')"
}

Calendar()
{
 	notify-send "$(ncal)"
}


while getopts ":dwc" option; do
   case $option in
      d) # display Help
         Date
         exit;;
      w)
	 Week
	 exit;;
      c)
	 Calendar
	 exit;;

     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done

