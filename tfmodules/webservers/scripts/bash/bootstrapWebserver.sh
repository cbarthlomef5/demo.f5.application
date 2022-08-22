#!/bin/bash

# Update and clean system
yum update -y
yum upgrade -y
yum autoremove -y

# Install LEMP
yum install nginx -y
amazon-linux-extras install nginx1 -y
amazon-linux-extras enable php8.0 -y
yum clean metadata
yum install php php-cli php-mysqlnd php-pdo php-common php-fpm -y
yum install php-gd php-mbstring php-xml php-dom php-intl php-simplexml -y

# Create necessary files
mkdir /var/www/apps
echo ${app_config} >> /var/www/apps/index.php
echo ${nginx_config} >> /etc/nginx/conf.d/apps.conf

# Start LEMP
systemctl start nginx.service
systemctl enable nginx
systemctl start php-fpm
systemctl enable php-fpm