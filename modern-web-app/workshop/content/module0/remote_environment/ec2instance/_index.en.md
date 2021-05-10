---
title: "AWS Console Login and EC2 Windows instance remote connection"
weight: 1
pre: "<b>1.1 </b>"
---

{{% notice tip %}}
Note that these environments are ephemeral, so will not keep any work you do, and will get terminated after the labs, if you want to save any work you have done here, please save it to your local desktop.
{{% /notice %}}

#### Login to the AWS Lab Account
You would have received a HASH value in the email for this course. 

If you have not received a HASH, please reach out to your AWS facilitator who will provide you with this. 

1. In a new browser window go to the following URL - [https://dashboard.eventengine.run/login](https://dashboard.eventengine.run/login)


![](../images/dashboardlogin.png)

2. Enter your Team Hash and **Click Accept Terms & Login**
3. Click **AWS Console**
4. Click **Copy Login Link** and paste the copied login details into a note taking application (eg. Notepad) and save them on your computer. These will be used later on in the lab
5. Click **Open AWS Console**
6. From the AWS console, Click **Services** and type `EC2`



![](../images/ec2.png)

7. Click Running instances - notice that there is 1 running. 

![](../images/ec2runninginstances.png)

![](../images/ec2windows.png)


#### Login to the windows machine

You will now login to the already provisioned windows machine. To do this we first of all need to grab the key details for you to RDP into the machine. 

8. In a new browser window, click on - [https://dashboard.eventengine.run/login](https://dashboard.eventengine.run/login)

9. Enter your hash again if its not already in there. A window as below will appear.
![](../images/teamdashboard.png)

10. Click on the SSH key tab. 

11. Click on Download keypair, this will be used to get your Windows machines password. 


![](../images/keypair.png)

Remember where this was downloaded to. 
Now we will get the Windows Password. 

12. Go back to the EC2 instance dashboard and click the Windows instance (the only item in the list). 

13. Click on actions and "Get Windows Password"

![](../images/getwindowspwd.png)

14. Click the Choose File and select the recently downloaded PEM file.

![](../images/retrievekey.png)

15. Click "Decrypt Password"

This will now provide the Administrator Password to login to that windows machine. 

16. Take a copy of the Password and save it in your text editor for later use.

![](../images/adminpassword.png)

17. Click close to close that popup window

18. Click on the windows instance on the dashboard again, then click Actions and click "Connect"

![](../images/connect.png)

19. Click on the "Download Remote Desktop File"

This will create a RDP file you can now use to remote desktop into your Windows machine. 

20. Go to your downloads directory and double click on the RDP file. 
![](../images/connecting.png)
21. You may get a certificate verification warning. If you do, click Continue. 
![](../images/warning.png)

{{% notice tip %}} 
If you do not have RDP installed on your Mac - you can install it from the App Store here: 
```https://apps.apple.com/au/app/microsoft-remote-desktop/id1295203466?mt=12```
{{% /notice %}}

22. Click the download and you will connect to the Windows machine - You will get a connecting message

23. Enter the Administrator password that you had saved earlier.

![](../images/password.png)

You should now be on a remote desktop on your AWS account with an AMI for the lab.

Lets get started on the lab: 

![](../images/launchdesktop.png)


