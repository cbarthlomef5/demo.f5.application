#!/bin/bash

echo "Updating and cleaning system"
yum update -y
yum upgrade -y
yum autoremove -y
yum autoclean -y

echo "Installing MATE packages"
amazon-linux-extras install mate-desktop1.x -y
echo "PREFERRED=/usr/bin/mate-session" > /etc/sysconfig/desktop

echo "Installing TigerVNC server"
yum install tigervnc-server -y

echo "Setting VNC password"
echo "T@co22" | vncpasswd

echo "Configuring TigerVNC"
mkdir /etc/tigervnc
echo "localhost" > /etc/tigervnc/vncserver-config-mandatory
cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@.service
sed -i 's/<USER>/ec2-user/' /etc/systemd/system/vncserver@.service
echo "SecurityTypes=None" >> ~/.vnc/config

echo "Restarting services"
systemctl daemon-reload
systemctl enable vncserver@:1
systemctl start vncserver@:1