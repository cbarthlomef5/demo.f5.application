# terraform.py
# Script to execute Terraform commands on remote server

# Import Modules
import subprocess

# Execute Terraform commands
subprocess.run(['terraform', 'init', '-upgrade'])
subprocess.run(['terraform', 'apply' '-auto-approve'])
