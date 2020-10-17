#!/bin/sh

NAMENDATEI=config.sh
. /home/pi/powermanager/$NAMENDATEI

sensor="1"
pin="4"
pin1="6"
state="0"
on="1"



sudo /home/pi/raspberry-remote/send --pin=29 10011 4 0

sleep 15
gpio -g mode $pin1 out
gpio -g write $pin1 0

while true
do

result="$( gpio -g read $pin )"
autoshutdown="$( gpio -g read $pin1 )"


if [ "$result" = "$sensor" ]; then

	if [ "$state" != "$on" ]; then
	echo "PRINTER ON"
	sudo /home/pi/raspberry-remote/send --pin=29 10011 4 1
	state="1"
	fi

fi

if [ "$result" != "$sensor" ]; then

	if [ "$state" = "$on" ]; then
	echo "PRINTER OFF"
	sudo /home/pi/raspberry-remote/send --pin=29 10011 4 0
	state="0"
	fi
fi

if [ "$autoshutdown" = "$on" ]; then

        if [ "$state" = "$on" ]; then
        echo "PRINTER OFF"
        sudo /home/pi/raspberry-remote/send --pin=29 10011 4 0
        gpio -g write $pin 0
        gpio -g write $pin1 0
	state="0"
        fi

fi
sleep 0.5
done