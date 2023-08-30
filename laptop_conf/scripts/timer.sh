#!/bin/bash

if [ -z "$1" ]; then
	echo "$1 is empty, please fixi"
	exit
else
	echo "starting timer from $1"
fi

while :
do
	for ((i=$1; i>0; i--))
	do
	   	sleep 1 
   		echo "<$i> "
		clear
	done
	paplay /usr/share/sounds/freedesktop/stereo/bell.oga
	echo "time's up buckaroo".
	exit
done
