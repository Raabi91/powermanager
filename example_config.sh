#!/bin/sh
# Only: 1=on/off/autoshutdown 0=only autoshutdown
only="1"
# printer_off = shell command to switch printer off
printer_off="sudo /home/pi/raspberry-remote/send --pin=29 10011 4 0"
# printer_on = shell command to switch printer on
printer_on="sudo /home/pi/raspberry-remote/send --pin=29 10011 4 1"
# pin_printer = the same pin as in the power section for printer
pin_printer="4"
# pin_autosh = the same pin as in the power section for autoshutdwon
pin_autosh="5"
# pin_autosh1 = a free gpio pin for autoshutdown (not the same as pin_autosh)
pin_autosh1="6"
# Time = Time after print end before shutdown in seconds
time="300"