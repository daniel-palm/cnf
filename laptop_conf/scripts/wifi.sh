#!/bin/bash
notify-send "🔭searching for networks.."
wifi=$(nmcli device wifi list | sed 's .\{27\}  ' | grep -v "SSID" | grep -Eo '^[^ ]+')
selected=$(nmcli device wifi connect "$chosen" password "$password")

#echo "begin ping"
ping -c1 8.8.8.8 > /dev/null 2>&1
if [ $? -eq  0 ]; then
#	echo "ping success";
       #         say success
	chosen=$(printf "%s\\nAvailable networks:" "$wifi" | dmenu -i -p "Select network:")
	password=$(printf "%s\\nPlease enter the password for "$chosen"" | dmenu -i -p "Password:")
	nmcli device wifi connect "$chosen" password "$password"
        else
                echo "Ping failed, restarting networking.."
		nmcli networking off && nmcli networking on
        fi
