To use tplinks smartplug with Powermanager u need to install
https://github.com/softScheck/tplink-smartplug

Edit the ip's in the config

```
#!/bin/sh
# Only: 1=on/off/autoshutdown 0=only autoshutdown
only="1"
# printer_off = shell command to switch printer off
printer_off="/home/pi/tplink-smartplug/tplink_smartplug.py -t 192.168.1.XXX -c $
# printer_on = shell command to switch printer on
printer_on="/home/pi/tplink-smartplug/tplink_smartplug.py -t 192.168.1.XXX -c o$
# pin_printer = the same pin as in the power section for printer
pin_printer="4"
# pin_autosh = the same pin as in the power section for autoshutdwon
pin_autosh="5"
# pin_autosh1 = a free gpio pin for autoshutdown (not the same as pin_autosh)
pin_autosh1="6"
# Time = Time after print end before shutdown in seconds (do not use under 60 s$
time="300"
# Port from moonraker
port="7125"
```
