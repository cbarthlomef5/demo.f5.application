<powershell>
# Create new local user and add to administrator group
$password = ConvertTo-SecureString "Wind0wsS3rverSecure!" -AsPlainText -Force
$username = "windowsdemo"
New-LocalUser $username -Password $password -FullName "demo f5"
Add-LocalGroupMember -Group "Administrators" -Member $username

# Install applications
Set-ItemProperty -Path HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -Name UseWUServer -Value 0
Restart-Service -Name wuauserv -Force

# Create .ssh directory and transfer certifiacte
New-Item -Path 'C:\temp' -ItemType Directory
New-Item 'C:\temp\id_rsa' -ItemType File -Value "${certificate}" -Force
</powershell>