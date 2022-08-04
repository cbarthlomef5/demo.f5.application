#!/bin/bash

# Update system, update packages, and remove unused packages
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove && sudo apt-get autoclean

# Install ubuntu desktop
#sudo apt install ubuntu-desktop -y

# Create demo user and set password
sudo useradd -m -s /bin/bash demo
echo "demo:demo.F5.com" | sudo chpasswd

# Install xrdp remote desktop
sudo apt install xrdp -y

# Install XFCE
sudo apt install xfce4 -y
sudo apt install xfce4-terminal -y

# Make xRDP use environment just created
sudo sed -i.bak '/fi/a #xrdp multiple users configuration \n xfce-session \n' /etc/xrdp/startwm.sh

# Update local firewall permissions
sudo ufw allow 3389/tcp

# Restart xRDP
sudo /etc/init.d/xrdp restart