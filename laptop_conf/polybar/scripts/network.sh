#!/bin/bash
############################################################
# Help                                                     #
############################################################
wifi=$(nmcli con show --active | sed -n '2p'  | awk '{print $1;}')
#resetnet=$(nmcli networking off && nmcli networking on)
Network()
{
   # Display network information
	if [[ $(nmcli con show --active | sed -n '2p' | wc -l) = 1 ]]; then
		echo "🖥️$wifi "
	else
		echo "[Disconnected]"

		
	fi
}

Restart()
{
	nmcli networking off && nmcli networking on && notify-send "Restarting networking.."

sleep 6

if [[ $(nmcli con show --active | sed -n '2p' | wc -l) = 1 ]]; then
	notify-send "Connected to $(nmcli con show --active | sed -n '2p'  | awk '{print $1;}')"
        else
                notify-send "git gud nub"
        
                
        fi



}

############################################################
############################################################
# Main program                                             #
############################################################
############################################################
############################################################
# Process the input options. Add options as needed.        #
############################################################
# Get the options
while getopts ":hr" option; do
   case $option in
      h) # display Help
         Network
         exit;;
      r)
	 Restart
	 exit;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done

