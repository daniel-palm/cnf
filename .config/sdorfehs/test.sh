#!/bin/sh

while :
sleep 2 # Updating status every 10 seconds
do # because status takes over sdorfehs messages

DATE=`date +'%a %b %d'`
TIME=`date +'%H:%M'`

# All together now!
echo $DATE \ $TIME
done

