#!/bin/sh

NAMENDATEI=config.sh
. /home/pi/powermanager/$NAMENDATEI

sleep $time

result_autosh="$( gpio -g read $pin_autosh )"

if [ "$result_autosh" = "1" ]; then

	gpio -g write $pin_autosh1 1
fi

sleep 5
gpio -g write $pin_autosh1 0