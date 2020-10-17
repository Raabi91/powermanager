#!/bin/sh

NAMENDATEI=config.sh
. /home/pi/powermanager/$NAMENDATEI

sensor="1"
pin="5"
sleep 300

result="$( gpio -g read $pin2 )"

if [ "$result" = "$sensor" ]; then

	gpio -g write 6 1
fi

sleep 5
gpio -g write 6 0