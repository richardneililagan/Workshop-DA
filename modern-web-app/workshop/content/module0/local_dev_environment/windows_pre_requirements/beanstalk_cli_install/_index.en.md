+++
title = "Install BeanStalk CLI"
weight = 5
pre = "<b>2.5 </b>"
+++

If python is not installed, install version 3.7 or higher as follows:
download exe file from `https://www.python.org/downloads/windows/`

![](../../images/windowspythonins.png)

click yes
![](../../images/windowspythonins1.png)

![](../../images/windowspythonins2.png)
click close

In powershell 
```powershell
.\python-3.8.2.exe --version
```


This will bring up a screen - hit modify 
![](../../images/windowspythonins3.png)

Choose pip install, others are optional if you want them. 
![](../../images/windowspythonins4.png)

Click -> next -> install -> confirm -> close on the next prompts. 

You now need to add to your path for future :

Right click This PC -> Properties -> Advanced System Settings -> Environment Variables
![](../../images/windowspythonins5.png)

On path add the python path you just installed. To find its location - Windows button -> scroll down to Python -> click Python 3.8 folder, right click -> more -> open location

Right click on the python3.8 version and click properties

![](../../images/windowspythonins6.png)

Test on a new powershell -> python 

```powershell
PS C:\> python.exe
Python 3.8.2 (tags/v3.8.2:7b3ab59, Feb 25 2020, 22:45:29) [MSC v.1916 32 bit (Intel)] on win32
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

If you do not have GIT installed on your laptop - install from GIT website here: ```
If you do not have GIT installed on your laptop - install from GIT website here: `https://git-for-windows.github.io/`

Click download and run when it has downloaded. It will ask for access, say Yes. 

Click next
![](../../images/windowsgitins.png)

Under advanced Options ticl ***Add python to environment variables"  and click next all the way through to installation. 

Untick release notes and click next. 

Open a new powershell and type 
```powershell
git
usage: git [--version] [--help] [-C <path>] [-c <name>=<value>]
           [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
           [-p | --paginate | -P | --no-pager] [--no-replace-objects] [--bare]
           [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
           <command> [<args>]
```

Download the git repo for beanstalk cli
```bash
pip install awsebcli --upgrade --user
```

Now test - 
```bash
eb --version
```
Add the following to Environment path -  %USERPROFILE%\AppData\roaming\Python\Python3.8\scripts where you put your directory in exchange for USERPROFILE

#### An alternative to install is via PIP directly: 
[PIP EB Install link](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install.html)

Python 3.7 – %USERPROFILE%\AppData\Roaming\Python\Python37\Scripts

Python earlier versions – %USERPROFILE%\AppData\Roaming\Python\Scripts

To modify your PATH variable (Windows):

Press the Windows key, and then enter environment variables.

Choose Edit environment variables for your account.

Choose PATH, and then choose Edit.

Add paths to the Variable value field, separated by semicolons. For example: C:\item1\path;C:\item2\path

Choose OK twice to apply the new settings.

Close any running Command Prompt windows, and then reopen a Command Prompt window.


#### EB INIT
eb init
8 - ap-southeast-2
add in a name - travelbuddy
11 - tomcat
1 - 8.5 with java 8
n

This will create a file as below in .elasticbeanstalk/config.yaml
branch-defaults:
  default:
    environment: null
    group_suffix: null
global:
  application_name: travelbuddy
  branch: null
  default_ec2_keyname: null
  default_platform: Tomcat 8.5 with Java 8 running on 64bit Amazon Linux
  default_region: ap-southeast-2
  include_git_submodules: true
  instance_profile: null
  platform_name: null
  platform_version: null
  profile: null
  repository: null
  sc: null
  workspace_type: Application
