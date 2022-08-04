#!/bin/bash

echo "Updating and cleaning system"
apt-get update
apt-get upgrade -y
apt-get autoremove
apt-get autoclean

echo "Installing xrdp"
apt install xrdp -y
apt install xfce4 -y
apt install xfce4-terminal -y

echo "Updating password for Ubuntu"
echo "ubuntu:demo.F5.com" | chpasswd

echo "Setting RDP params"
sed -i.bak '/fi/a #xrdp multiple users configuration \n xfce-session \n' /etc/xrdp/startwm.sh

echo "Updating local firewall for RDP"
ufw allow 3389/tcp

echo "Restarting RDP service"
/etc/init.d/xrdp restart