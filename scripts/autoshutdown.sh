#!/bin/sh

NAMENDATEI=config.sh
. /home/pi/powermanager/$NAMENDATEI

$print_state=0

while true
do
curl -s -o print_state_autosh.txt http://127.0.0.1:$port/printer/objects/query?print_stats
print_state_read=$(grep -oP '(?<="state": ")[^"]*' print_state_autosh.txt)

if [ "$print_state_read" = "printing" ]; then
    if [ "$print_state" = "0" ]; then
    print_state="1"
    fi
elif [ "$print_state_read" = "complete" ]; then
	if [ "$print_state" = "1" ]; then
    print_state="0"
	sleep $time
	autoshutdown="$( gpio -g read $pin_autosh )"
		if [ "$autoshutdown" = "1" ]; then
		. /home/pi/powermanager/scripts/state.txt
        	if [ "$state" = "1" ]; then
        	echo "PRINTER OFF"
        	$printer_off
        	gpio -g write $pin_printer 0
			echo "state=0" > /home/pi/powermanager/scripts/state.txt
        	fi
			if [ "$only" = "0" ]; then
        	echo "PRINTER OFF"
        	$printer_off
			echo "state=0" > /home/pi/powermanager/scripts/state.txt
        	fi

		fi

	fi
elif [ "$print_state_read" = "error" ]; then
    if [ "$print_state" = "1" ]; then
    print_state="0"
	fi

elif [ "$print_state_read" = "standby" ]; then
    print_state="0"
fi

sleep 5
done