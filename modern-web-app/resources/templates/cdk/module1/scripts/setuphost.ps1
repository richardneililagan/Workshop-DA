# Set execution policy and install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Reload profile
$env:ChocolateyInstall = Convert-Path "$((Get-Command choco).Path)\..\.."   
Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"

# Install Git
choco install git -y --params="'/GitAndUnixToolsOnPath /NoAutoCrlf'"

# Install Python 3 https://chocolatey.org/packages/python3
choco install python3 -y
refreshenv

# Install AWS Cli 2 https://chocolatey.org/packages/awscli
choco install awscli -y

# Install Google Chrome https://chocolatey.org/packages/googlechrome
choco install googlechrome -y

# Install VS Code https://chocolatey.org/packages/vscode
choco install vscode -y

# Install NodeJS
choco install nodejs -y

# Install Amplify CLI
npm install -g @aws-amplify/cli --unsafe-perm=true

# Clear desktop
$wshShell = New-Object -ComObject "WScript.Shell"
Get-ChildItem -Path  $wshShell.SpecialFolders.Item("AllUsersDesktop") -Recurse -ErrorAction SilentlyContinue | foreach { Remove-Item -Path $_.FullName }
Get-ChildItem -Path  $wshShell.SpecialFolders.Item("Desktop") -Recurse -ErrorAction SilentlyContinue | foreach { Remove-Item -Path $_.FullName }

# Create shortcuts
$wshShell = New-Object -ComObject "WScript.Shell"
$urlShortcut = $wshShell.CreateShortcut(
  (Join-Path $wshShell.SpecialFolders.Item("AllUsersDesktop") "Dashboard.url")
)
$urlShortcut.TargetPath = "https://dashboard.eventengine.run/login"
$urlShortcut.Save()

$wshShell = New-Object -ComObject "WScript.Shell"
$urlShortcut = $wshShell.CreateShortcut(
  (Join-Path $wshShell.SpecialFolders.Item("AllUsersDesktop") "Workshop.url")
)
$urlShortcut.TargetPath = "https://workshops.devax.academy/monoliths-to-microservices/"
$urlShortcut.Save()