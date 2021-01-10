#!/bin/bash

# Check if script run as sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
else


echo "Raspberry dependencies ..."
source scripts/dependencies.sh

echo "Raspberry IP address ..."
source scripts/raspberry_ip.sh

echo "Raspberry security ..."
source scripts/raspberry_security.sh

echo "Raspberry crons"
crontab cronjobs.txt

echo "Rebooting now ..."
reboot


fi
