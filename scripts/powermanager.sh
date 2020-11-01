#!/bin/sh

NAMENDATEI=config.sh
. /home/pi/powermanager/$NAMENDATEI

sh /home/pi/powermanager/scripts/autoshutdown.sh &

state="0" 	#set state on reboot to off

$printer_off

sleep 15

gpio -g mode $pin_printer out
gpio -g mode $pin_autosh out
gpio -g mode $pin_autosh1 out
gpio -g write $pin_autosh1 0

while true
do

result="$( gpio -g read $pin_printer )"
autoshutdown="$( gpio -g read $pin_autosh1 )"

if [ "$only" = "1" ]; then

	if [ "$result" = "1" ]; then

		if [ "$state" != "1" ]; then
		echo "PRINTER ON"
		$printer_on
		state="1"
		echo "state=1" > /home/pi/powermanager/scripts/state.txt
		fi
	elif [ "$result" != "1" ]; then

		if [ "$state" = "1" ]; then
		echo "PRINTER OFF"
		$printer_off
		state="0"
		echo "state=0" > /home/pi/powermanager/scripts/state.txt
		fi
	fi

fi

sleep 0.5
done