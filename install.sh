#!/bin/bash

# Check if script run as sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
else


echo "Raspberry dependencies ..."
source scripts/install/dependencies.sh

echo "Raspberry IP address ..."
source scripts/install/raspberry_ip.sh

echo "Raspberry security ..."
source scripts/install/raspberry_security.sh

echo "Raspberry crons"
crontab cronjobs.txt

echo "Plex Server raspberry compatible image ..."
source scripts/install/plex_docker_construct.sh

echo "Rebooting now ..."
reboot


fi
