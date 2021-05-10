# Set execution policy and install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Reload profile
$env:ChocolateyInstall = Convert-Path "$((Get-Command choco).Path)\..\.."   
Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"

# Install Git
choco install git -y --params="'/GitAndUnixToolsOnPath /NoAutoCrlf'"

# Install AdoptOpenJDK jdk8 hotspot 8.262.10 https://chocolatey.org/packages/corretto8jdk
choco install corretto8jdk -y 
refreshenv

# Install IntelliJ https://chocolatey.org/packages/intellijidea-community
choco install intellijidea-community -y

# Install eclipse https://chocolatey.org/packages/eclipse
choco install eclipse --version=4.15 -y --params "'/InstallationPath=C:\eclipse'"
& "c:\\setup\\eclipseinstall.ps1"

# Install Apache Maven https://chocolatey.org/packages/maven
choco install maven -y

# Install Tomcat https://chocolatey.org/packages/tomcat
choco install tomcat -y

# Install Python 3 https://chocolatey.org/packages/python3
choco install python3 -y
refreshenv

# Install AWS Cli 2 https://chocolatey.org/packages/awscli
choco install awscli -y

# Install Google Chrome https://chocolatey.org/packages/googlechrome
choco install googlechrome -y

# Install Elastic Beanstalk CLI
pip install awsebcli --upgrade

# Install MySQL Client https://chocolatey.org/packages/mysql-cli
choco install mysql-cli

# Move tomcat server to C:\ProgramData\Tomcat9
$tomcatPath = Get-ChildItem -Path C:\ProgramData\chocolatey\lib\Tomcat\tools -Directory | Select-Object -First 1
Get-ChildItem -Path $tomcatPath.FullName -Recurse | Move-Item -Destination C:\ProgramData\Tomcat9\

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