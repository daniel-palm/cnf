#!/bin/bash
#sthbast=$(source '/home/derpalm/Documents/wip/sth.sh')
#$sthbast
#sthbast=$(ssh derpalm@bf-linbast08.sth.basefarm.net)
#oslbast=$(ssh derpalm@bf-linbast08.osl.basefarm.net)
#winbast=$(xfreerdp -dynamic-resolution /v:bf-winbast24.mgmt.basefarm.net:3389 &)

chosen=$(printf "%s\\nsthlinbast\\osllinbast\\nsthwinbast" | dmenu -i -p "Where to?") &&
#case "$chosen" in
#	"sthlinbast") $sthbast ; exit ;;
#	"osllinbsat") $oslbast ;;
#	"sthwinbast") $winbast ;;
#esac
