#!/bin/bash
ICON=$HOME/Pictures/Icons/tina.png
#ICON=$HOME/Pictures/Icons/lock2.png
TMPBG=/tmp/screen.png
scrot /tmp/screen.png
convert $TMPBG -scale 10% -scale 1000% $TMPBG
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG
#convert $TMPBG -gravity center -composite -matte $TMPBG
i3lock -u -i $TMPBG
#i3lock -u -i $TMPBG
rm /tmp/screen.png
