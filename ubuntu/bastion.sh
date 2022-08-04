#cloud-boothook
#!/bin/bash
set -x

echo "Updating and cleaning system"
apt-get update
apt-get upgrade -y
apt-get autoremove
apt-get autoclean

