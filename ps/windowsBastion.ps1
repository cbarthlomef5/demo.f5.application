<powershell>
# Create new local user and add to administrator group
$password = ConvertTo-SecureString "Wind0wsS3rverSecure!" -AsPlainText -Force
$username = "demo"
New-LocalUser $username -Password $password -FullName "demo f5"
Add-LocalGroupMember -Group "Administrators" -Member $username

# Install applications
Set-ItemProperty -Path HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -Name UseWUServer -Value 0
Restart-Service -Name wuauserv -Force
# Install Chrome
$LocalTempDir = $env:TEMP; $ChromeInstaller = "ChromeInstaller.exe"; (new-object    System.Net.WebClient).DownloadFile('http://dl.google.com/chrome/install/375.126/chrome_installer.exe', "$LocalTempDir\$ChromeInstaller"); & "$LocalTempDir\$ChromeInstaller" /silent /install; $Process2Monitor =  "ChromeInstaller"; Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } else { rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound)
# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString(‘https://chocolatey.org/install.ps1’))
choco feature enable -n allowGlobalConfirmation

# Create temp directory
New-Item -Path 'C:\temp' -ItemType Directory

# Copy certificate to temp directory
New-Item -Path 'C:\temp\id_rsa' -ItemType File -Value "${certificate}" -Force

# Create netlogon scripts path and copy file to path
New-Item -Path 'C:\Windows\System32\Repl\Imports\Scripts' -ItemType Directory
New-Item -Path 'C:\Windows\System32\Repl\Imports\Scripts\logon.cmd' -ItemType File -Value "${logonScriptCMD}" -Force
New-SmbShare -Name "Netlogon" -Path "C:\Windows\System32\Repl\Imports\Scripts"

# Set user logon script
$ComputerName = $env:COMPUTERNAME
$Computer = [adsi]"WinNT://$ComputerName"
$user = $Computer.psbase.Children.Find($username)
$user.LoginScript = ".\logon.cmd"
$user.SetInfo()
</powershell>