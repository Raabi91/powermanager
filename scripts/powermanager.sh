#!/bin/sh

NAMENDATEI=config.sh
. /home/pi/powermanager/$NAMENDATEI

sh /home/pi/powermanager/scripts/autoshutdown.sh &

state="0" 	#set state on reboot to off

$printer_off

sleep 15

gpio -g mode $pin_printer out
gpio -g mode $pin_autosh out
gpio -g mode $pin_printer out
gpio -g write 6 0
while true
do

result="$( gpio -g read $pin_printer )"
klipper_restart="$( gpio -g read 6 )"

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
elif [ "$klipper_restart" = "1" ]; then
		sudo service klipper restart
		curl -H "Content-Type: application/json" -X POST http://127.0.0.1:7125/machine/device_power/off?Klipper%20Restart
fi

sleep 0.5
done
