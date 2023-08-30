#!/bin/sh

LAUNCHER="dmenu -nb black -sb darkgreen -sf black -fn JetbrainsMono-10 -l 5 -i -p "

chosen=$(printf "%s\n" "[sth]linbast" "[osl]linbast" "[inera]linbast" "[sth]winbast" "[osl]winbast" | $LAUNCHER"Where?") || exit 1



case "$chosen" in
       "[sth]linbast") urxvt -e zsh -c '. ~/.config/zsh/.zshrc; ssh '$USER'@bf-linbast08.sth.basefarm.net'; exit ;;
       "[osl]linbast") urxvt -e zsh -c '. ~/.config/zsh/.zshrc; ssh '$USER'@bf-linbast08.osl.basefarm.net'  ;;
       "[inera]linbast") urxvt -e zsh -c '. ~/.config/zsh/.zshrc; ssh '$USER'@bf-bastse-linera1.obf1.sth.basefarm.net'; exit ;;
       "[sth]winbast") xfreerdp -dynamic-resolution /v:bf-winbast24.mgmt.basefarm.net:3389 & ;;
       "[osl]winbast") xfreerdp -dynamic-resolution /v:bf-winbast14.mgmt.basefarm.net:3389
esac
