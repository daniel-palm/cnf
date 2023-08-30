#!/bin/bash

MONITOR=${1}
PIPE_LINE=${2}


audio=$(pulseaudio-control output)
#echo $audio
if [[ $audio == "Sink #11" ]] ; then
	#echo "airpod"
	output=airpod
elif [[ $audio == "Sink #3" ]]; then
	#echo "computah"
	output=computer
elif [[ $audio == "%{F#6b6b6b}Sink #3%{F-}" ]]; then
	#echo "muted computah"
	output=muted
else
	echo "unkwn"
fi
#echo $output
putLineToPipeFile ${MONITOR} ${PIPE_LINE} " $output"
#	echo "no mpd, starting"
#	/usr/bin/mpd >/dev/null
#	echo "almost there.."
#	sleep 3
#	/usr/bin/ncmpcpp
#else
#	echo "mpd running"
#	/usr/bin/ncmpcpp
#fi
