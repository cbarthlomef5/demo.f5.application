#!/bin/bash

echo "Updating and cleaning system"
apt update -y
apt upgrade -y

echo "Installing Gnome"
apt install ubuntu-desktop -y

echo "Installing Xfce"
apt install xubuntu-desktop -y

echo "Installing xrdp"
apt install xrdp -y

echo "Updating groups"
adduser ubuntu ssl-cert
adduser xrdp ssl-cert

echo "Updating local firewall for RDP"
ufw allow 3389/tcp

echo "Updating password for Ubuntu"
echo "ubuntu:demo.F5.com" | sudo chpasswd