#!/bin/bash

pidof mpd >/dev/null
if [[ $? != 0 ]] ; then
	echo "no mpd, starting"
	/usr/bin/mpd >/dev/null
	echo "almost there.."
	sleep 3
	/usr/bin/ncmpcpp
else
	echo "mpd running"
	/usr/bin/ncmpcpp
fi
