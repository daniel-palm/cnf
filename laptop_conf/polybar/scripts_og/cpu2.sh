#!/bin/bash
############################################################
# Help                                                     #
############################################################
#red=`tput setaf 1`
Cpu()
{
	echo "$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')"
}

Process()
{

	 notify-send "Processes        (%)" "$(ps axch -o cmd:15,%cpu --sort=-%cpu | head)\\n(100% per     core)" && notify-send "$(sensors | awk '/Core 0/ {print "Temperature      " $3}' | sed 's/.\{4\}$//')"C"" && notify-send "Memory:          $(free -h --si | awk '/^Mem:/ {print $3 "/" $2}')"


}

Htop()
{
	setsid -f urxvt -e htop ;
}

Test()
{
top -bn1 | grep "Cpu(s)" | \
           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
           awk '{print $1"%"}'
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
while getopts ":cthp" option; do
   case $option in
      c) # display Help
         Cpu
         exit;;
      t) # display Help
         Test
         exit;;
      h) # display Help
         Htop
         exit;;
      p) 
	 Process
	 exit;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done

