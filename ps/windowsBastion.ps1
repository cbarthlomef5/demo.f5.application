<powershell>
# Create new local user and add to administrator group
$password = ConvertTo-SecureString "Wind0wsS3rverSecure!" -AsPlainText -Force
$username = "demo"
New-LocalUser $username -Password $password -FullName "demo f5"
Add-LocalGroupMember -Group "Administrators" -Member $username

# Install applications
Set-ItemProperty -Path HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -Name UseWUServer -Value 0
Restart-Service -Name wuauserv -Force
$LocalTempDir = $env:TEMP; $ChromeInstaller = "ChromeInstaller.exe"; (new-object    System.Net.WebClient).DownloadFile('http://dl.google.com/chrome/install/375.126/chrome_installer.exe', "$LocalTempDir\$ChromeInstaller"); & "$LocalTempDir\$ChromeInstaller" /silent /install; $Process2Monitor =  "ChromeInstaller"; Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } else { rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound)

# Create temp directory and transfer files
New-Item -Path 'C:\temp' -ItemType Directory
New-Item 'C:\temp\id_rsa' -ItemType File -Value "${certificate}" -Force
New-Item 'C:\temp\logonScript.ps1' -ItemType File -Value "${logonScriptPS}" -Force
New-Item -Path 'C:\Windows\System32\Repl\Imports\Scripts' -ItemType Directory
New-Item 'C:\Windows\System32\Repl\Imports\Scripts\logon.cmd' -ItemType File -Value "${logonScriptCMD}" -Force

# Set user logon script
$ComputerName = $env:COMPUTERNAME
$Computer = [adsi]"WinNT://$ComputerName"
$user = $Computer.psbase.Children.Find($username)
$user.LoginScript = "logon.cmd"
$user.SetInfo()

</powershell>