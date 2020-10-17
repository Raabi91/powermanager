#!/bin/bash

echo -e "\n\n========= Powermanager - Installation Script ==========="
echo -e "\n\n========= Install Wiringpi ==========="
sudo apt install wiringpi
echo -e "\n\n========= Creat config.sh ==========="

cp -i /home/pi/powermanager/example_config.sh /home/pi/powermanager/config.sh

echo -e "\n\n========= set permissions ==========="
sleep 1
chmod 755 /home/pi/powermanager/config.sh
chmod 755 /home/pi/powermanager/scripts/autoshutdown.sh
chmod 755 /home/pi/powermanager/scripts/autoshutdownstart.sh
chmod 755 /home/pi/powermanager/scripts/powermanager.sh

echo -e "\n\n========= installation autostart ==========="

crontab -u pi -l | grep -v "/home/pi/powermanager/scripts/powermanager.sh  &"  | crontab -u pi -
sleep 1
(crontab -u pi -l ; echo "@reboot /home/pi/powermanager/scripts/powermanager.sh  &") | crontab -u pi -

echo  "\n\n========= installation end ==========="
echo  "\n\n========= open and edit your config with ==========="
echo  "\n\n========= sudo nano home/pi/powermanager/config.sh ==========="

exit 1
