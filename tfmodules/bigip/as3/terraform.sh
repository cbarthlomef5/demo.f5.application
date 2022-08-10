#!/bin/bash

until terraform version
do
    echo "Waiting for Terraform to be installed"
    sleep 10
done
echo "Terraform detected"
cd /home/ec2-user/tf
terraform init
terraform init -upgrade
terraform apply -auto-approve