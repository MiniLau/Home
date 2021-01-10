#!/bin/bash
# HOW TO: https://pimylifeup.com/raspberry-pi-static-ip-address/#:~:text=First%2C%20you%20have%20to%20decide,assign%20to%20your%20Raspberry%20Pi

# force value for somethings ?

# Utilitaries functions
read_var_from_env() {
#https://gist.github.com/judy2k/7656bfe3b322d669ef75364a46327836
  VAR=$(grep $1 $2 | xargs)
  IFS="=" read -ra VAR <<< "$VAR"
  echo ${VAR[1]}
}


# Check if script run as sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
else

# Retrieve Router IP
route_info=$(ip r | grep default)
interface=$(echo $route_info | awk '{ print $5 }')
router_ip=$(echo $route_info | awk '{ print $3 }')

# Retrieve Network DNS IP
resolv_info=$(cat /etc/resolv.conf | grep nameserver)
dns_ip=$(echo $resolv_info | awk '{ print $2 }')

# Retrieve raspberry chosen static IP (from .env file)
raspberry_ip=$(read_var_from_env HOST .env)

# Change DHPCD config file
echo "
interface $interface
static ip_address=$raspberry_ip/24
static routers=$router_ip
static domain_name_servers=$dns_ip" >> /etc/dhcpcd.conf

fi
