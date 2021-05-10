+++
title = "Test installation on Windows"
weight = 6
pre = "<b>2.6 </b>"
+++
### Test all the setup 

Finally, we can test that Tomcat, Maven, Java and Eclipse are all configured appropriately. We will use a test application for this purpose.

1. Download the [test application from here](https://alarter-share.s3-ap-southeast-2.amazonaws.com/idevelop_test_app.zip) and explode the archive into a filesystem location.

2. In Eclipse, select File | open project from filesystem and locate the exploded folder. Import the project.

![install test project](../../images/windowseclipseimport.png)

#### Configure local Tomcat server

You will now configure a **local Tomcat v9.x** server to run the test app on your local development machine.

3. In Eclipse, click **Window** > **Show view** > **Servers**. You may need to use the **Other...** feature to select the Servers view if it is not offered in the initial listing.

4. In the Servers window, click *No servers are available. Click this link to create a new server...*

![](../../images/windowseclipseimport1.png)

5. Expand **Apache**, select **Tomcat v9.x Server**, and then click **Next**.

![](../../images/windowseclipseimport2.png)

6. Click **Browse...** and locate your *Tomcat v9.x Server* installation. This will be the filesystem location you downloaded to earlier - if you are following these instructions, it will be `/usr/local/homebrew/Cellar/tomcat/9.0.34/libexec` 

    If you are unsure - run `catalina version` and add the CATALINA_HOME directory in the location

    Under JRE - choose the OpenJDK 14 in the list of JRE's.

7. Click **Finish**.
8. In **Project Explorer**, right-click on **idevelop_test_app** and choose Maven | Update Project
9. Right-click on **idevelop_test_app** again, and choose Run As | Run on Server. A new window will apear and choose an existing server, and highlight the localhost | tomcat server. 

    ![](../../images/windowseclipseimport3.png)

Click After a few seconds, the test app should run in the embedded browser window:

![](../../images/macfinal.png)

10. If the app runs as expected, you are ready to begin the first lab!
