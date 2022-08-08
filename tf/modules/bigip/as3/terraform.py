# terraform.py
# Script to execute Terraform commands on remote server

# Import Modules
import subprocess

# Execute Terraform commands
subprocess.Popen(['terraform', 'init', '-upgrade'])
subprocess.Popen(['terraform', 'apply', '-auto-approve'])
