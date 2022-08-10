#!/bin/bash

echo "Updating and cleaning system"
yum update -y
yum upgrade -y
yum autoremove -y
yum autoclean -y

echo "Install NGINX"
yum install nginx -y
amazon-linux-extras install nginx1 -y
systemctl start nginx.service