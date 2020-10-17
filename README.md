# Powermanger for mainsail
this script will be good for on and off the printer over wireless plugs (wifi or 466mhz) an u can also use the Gpio
an it will also have a Autoshutdown funktion for it


[shell_command autoshutdown]
command: sh /home/pi/powermanager/script/autoshutdown.sh
timeout: 2.
verbose: false


RUN_SHELL_COMMAND CMD=autoshutdown