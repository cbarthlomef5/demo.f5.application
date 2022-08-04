#!/bin/bash

echo "Changing hostname"
echo "jupiter" > /etc/hostname

echo "Updating and cleaning system"
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove && sudo apt-get autoclean

echo "Creating demo user"
sudo useradd -m -s /bin/bash demo
echo "demo:demo.F5.com" | sudo chpasswd