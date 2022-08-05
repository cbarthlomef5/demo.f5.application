<powershell>
# Create new local user and add to administrator group
$password = ConvertTo-SecureString "Wind0wsS3rverSecure!" -AsPlainText -Force
$username = "windowsdemo"
New-LocalUser $username -Password $password -FullName "demo f5"
Add-LocalGroupMember -Group "Administrators" -Member $username

# Create .ssh directory and transfer certifiacte
New-Item -Path 'C:\temp' -ItemType Directory
New-Item 'C:\temp\id_rsa' -ItemType File -Value "${certificate}" -Force
</powershell>