# Logon script to setup user environment
Copy-Item -Path "C:\temp\id_rsa" -Destination "$env:USERPROFILE\.ssh\id_rsa"