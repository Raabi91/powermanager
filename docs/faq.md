# FAQ

## How Upgrade the script
```
cd ~/powermanager
git reset --hard HEAD
git pull
sudo reboot
```

## How do i use the test.gcode

you have to ways:

the first way is to download the gcode over the browser an put it in mainsail:

the second way is to copy it over ssh into your virtual sd like this
```
cp -i /home/pi/powermanager/gcode/autoshutdown_test.gcode /home/pi/sdcard/autoshutdown_test.gcode
```

you musst edit it to your virtual sdcard path

## How Edit my config after first instalation

you have 3 ways

1.
got to Mainsail -> Settings -> Maschine
and go into the config folder than you can edit the powermanager_config.sh

2.
Open the config  in SSH an edit the settings

```
sudo nano /home/pi/powermanager/config.sh
```
3.
use Ftp and search the file to edit and reupload it. the path is /home/pi/powermanager/

After Edit the Config  do a Reboot