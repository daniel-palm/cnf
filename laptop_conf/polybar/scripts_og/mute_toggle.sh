#!/bin/bash

Mute()
{
if [[ $(pamixer --get-mute) = true ]]; then
	$(pactl set-sink-mute alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink 0) && notify-send "🔊unmuted"
else
	$(pactl set-sink-mute alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink 1) && notify-send "🔇muted"
fi
}

Up()
{
$(amixer -D pulse sset Master 5%+ && paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga)
}

Down()
{
amixer -D pulse sset Master 5%- && paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga
}

 while getopts ":mud" option; do
    case $option in
       m) # display Help
          Mute
          exit;;
       u)
          Up
          exit;;
       d) # Invalid option
	  Down
        exit;;
   esac
done

