#!/bin/bash

MDIR="/home/derpalm/Music/bones"

cd $MDIR

while true; do
out=$(fzf --height=100% --layout=reverse --exact --print-query -m | tail -n +2)
      if [ "$out" == ":quit" ]; then
	  exit 0
	
      else
	  for f in $out ; do ffplay -nodisp -autoexit "$f"; done

      fi

done
