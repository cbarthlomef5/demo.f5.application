#!/bin/bash

echo "Updating and cleaning system"
yum update -y
yum upgrade -y
yum autoremove -y

echo "Install LEMP"
yum install nginx -y
amazon-linux-extras install nginx1 -y
amazon-linux-extras enable php8.0 -y
yum clean metadata
yum install php php-cli php-mysqlnd php-pdo php-common php-fpm -y
yum install php-gd php-mbstring php-xml php-dom php-intl php-simplexml -y

echo "Start LEMP"
systemctl start nginx.service
systemctl enable nginx
systemctl start php-fpm
systemctl enable php-fpm