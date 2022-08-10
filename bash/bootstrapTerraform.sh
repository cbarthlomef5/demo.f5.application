#!/bin/bash

echo "Updating and cleaning system"
yum update -y
yum upgrade -y

echo "Install Terraform"
yum install yum-utils -y
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
yum install terraform -y