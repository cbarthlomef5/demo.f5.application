#!/bin/bash

# Update system, update packages, and remove unused packages
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove && sudo apt-get autoclean

# Install tasksel
sudo apt install ubuntu-desktop -y

# Install lightdm Display Manager
sudo apt install lightdm -y
sudo service lightdm start

# Create demo user and set password
sudo useradd -m -s /bin/bash demo
echo "demo:demo.F5.com" | sudo chpasswd