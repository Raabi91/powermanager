# Install

## First of all 
install git on your pi
```
sudo apt-get install git -y
```
## Second
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

## Third

Download an install the power manager

if u use it the first time use this

```
cd
git clone https://github.com/Raabi91/powermanager
cd powermanager
sh ./scripts/install.sh
```

if you use a raspberry pi 4 do a manuel upgrade to wiringpi 2.52 with
```
cd /tmp
wget https://project-downloads.drogon.net/wiringpi-latest.deb
sudo dpkg -i wiringpi-latest.deb
```

the edit your config with
```
sudo nano /home/pi/powermanager/config.sh
```
or in mainsail or fluidd

edit the variables between the ""

wenn you are finished reboot your pi to start the script automaticly
