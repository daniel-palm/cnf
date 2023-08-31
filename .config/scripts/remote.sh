#!/bin/bash

#This script assumes your local username is the same as your MGMT-account

chosen=$(printf "%s\n" "[sth]linbast" "[osl]linbast" "[inera]linbast" "[sth]winbast" "[osl]winbast" | dmenu -i -p "Where to?") &&
case "$chosen" in
       "[sth]linbast") urxvt -e zsh -c '. ~/.config/zsh/.zshrc; ssh 'derpalm'@bf-linbast08.sth.basefarm.net'; exit ;;
       "[osl]linbast") urxvt -e zsh -c '. ~/.config/zsh/.zshrc; ssh 'derpalm'@bf-linbast08.osl.basefarm.net'  ;;
       "[inera]linbast") urxvt -e zsh -c '. ~/.config/zsh/.zshrc; ssh 'derpalm'@bf-bastse-linera1.obf1.sth.basefarm.net'; exit ;;
       "[sth]winbast") xfreerdp -dynamic-resolution /v:bf-winbast24.mgmt.basefarm.net:3389 & ;;
       "[osl]winbast") xfreerdp -dynamic-resolution /v:bf-winbast14.mgmt.basefarm.net:3389
;;
esac
