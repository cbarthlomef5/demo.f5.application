 # Set variables
$path = "$env:USERPROFILE\.ssh"

# Test if .ssh file path exists
if (!(Test-Path $path)) {
    New-Item $path -ItemType Directory
}
# Copy files
Copy-Item -Path "C:\temp\id_rsa" -Destination "$path\id_rsa" -Force 