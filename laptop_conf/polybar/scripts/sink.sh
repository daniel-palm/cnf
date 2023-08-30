#!/bin/sh

audio=$(pulseaudio-control --node-nickname "alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp_4__sink:display" --node-nickname "bluez_sink.E8_85_4B_49_5C_1C.a2dp_sink:airpod" --node-nickname "bluez_sink.E8_85_4B_49_5C_1C.handsfree_head_unit:airpod" --node-nickname "bluez_sink.90_9C_4A_EB_0C_69.a2dp_sink:airmax" output)

case "$audio" in
	"airmax") sink="airmax" ;;
	"airpod") sink="airpod" ;;
	"display") sink="monitor" ;;
	"Sink #3") sink="computer" ;;
	"%{F#6b6b6b}Sink #3%{F-}") sink="" ;;
	*) sink="$audio"
esac
#echo $sink
	#echo $sink
	echo "$sink"
	#sleep 5
#notify-send $sink

