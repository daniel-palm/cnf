#!/bin/sh

tray=$(pgrep stalonetray)
nm=$(pgrep nm-applet)

get_status () { 
	if [[ $tray ]]; then
		echo "tray [X]"
		sleep 1
		if [[ $nm ]]; then
			echo "nm-applet [X]"
		else
			echo "starting nm-applet"
			sleep 1
			nm-applet &
			echo "nm-applet [X]"
		fi
	else
		echo "starting tray"
		stalonetray &
		echo "tray [X]"
		if [[ $nm ]]; then
			echo "nm-applet [X]"
		else
			echo "starting nm-applet"
			sleep 1
			nm-applet &
			echo "nm-applet [X]"
		fi
		#echo on
		#echo off
	fi
}

get_death () {
	killall nm-applet 2>&1 > /dev/null &
	killall stalonetray 2>&1 > /dev/null &
}

while getopts ":sd" option; do
   case $option in
      s) # display Help
         get_status
         exit;;
      d) # do something
         get_death
         exit;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done

