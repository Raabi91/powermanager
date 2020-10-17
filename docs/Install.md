# Install

## First of all install git on your pi
```
sudo apt-get install git -y
```
## Second
then dowload the [kiauh script](https://github.com/th33xitus/kiauh) and install the shell_command addon for klipper

```
cd ~
git clone https://github.com/th33xitus/kiauh.git
cd kiauh
chmod +x kiauh.sh scripts/*
./kiauh.sh
```
```
in the script press
4 [Advanced] + Enter
then
7 [Shell Command]
then say Yes with Y
now it will install the addon
after this close the script with 2 times Q + Enter
```
## Third
open the moonraker.config and put the power devices in it
```
cd
sudo nano /home/pi/moonraker.conf
```
put this at the end wenn you will use on, off an autoshutdown

```
[power]
devices: printer, led
printer_name: X5SAPro
printer_pin: 4
printer_active_low: false
led_name: Autoshutdown
led_pin: 5
led_active_low: false
```
the pins can be exchanged but have to be noted down for later

if you will only use autoshutdown tthen you can delete the printer like this

```
[power]
devices: led
led_name: Autoshutdown
led_pin: 5
led_active_low: false
```
## Fourth

put the shell command for klipper in your printer.cfg oder in the mainsail_macros.cfg
```
[shell_command autoshutdown]
command: sh /home/pi/powermanager/script/autoshutdown.sh
timeout: 2.
verbose: false
```

and edit your endgcode in your slicer

put this
```
RUN_SHELL_COMMAND CMD=autoshutdown
```

in the penultimate line of your end gcode

## Fifth
Download an install the power manager

if u use it the first time use this

```
git clone https://github.com/Raabi91/powermanager
cd powermanager
sh ./scripts/install.sh
```

the edit your config with
```
sudo nano home/pi/powermanager/config.sh
```
edit the variables between the ""

wenn you are finished reboot your pi to start the script automaticly