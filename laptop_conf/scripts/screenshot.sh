#!/bin/bash
sleep 0.2
scrot -s '/tmp/%F_%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f'
notify-send "Snipped"
