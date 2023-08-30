#!/bin/bash

if [[ $(pgrep ncmpcpp) ]]; then
	echo "▶️ $(mpc | head -n -2) $(mpc | head -n -1 | sed '1d' | cut -c21- | sed 's/.....$//')"
else
	echo "<not playing>"
fi
