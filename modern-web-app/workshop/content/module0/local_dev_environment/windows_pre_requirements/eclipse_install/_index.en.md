+++
title = "Eclipse installation on Windows"
weight = 4
pre = "<b>2.4 </b>"
+++
### Download and set up Eclipse Photon (or better)

In this section, you will download and set up the Eclipse IDE. As of June 2018, the current version of Eclipse is Photon. These instructions have been confirmed with Photon and Neon, but future versions should also work as noted below.

#### Download Eclipse Photon

1. Browse to the [Eclipse download page](https://www.eclipse.org/downloads/) and click on the download button for Photon:

    ![](../../images/windowseclipse.png)

2. When the download is complete, run the installer package:

    ![](../../images/windowseclipse1.png)

3. Click on the panel for **Eclipse IDE for Java EE Developers** - NOTE: It is important to select this version, not the standard IDE for developers!

    ![](../../images/windowseclipse2.png)

4. Create the folder `c:\eclipse`
5. Set the installation folder for Eclipse to `c:\eclipse`
   
   Note: The location you install Eclipse is arbitrary. The path `c:\eclipse` is chosen as a personal preference, you may install Eclipse wherever you like, but the rest of the instructions here will refer to `c:\eclipse` as the installation folder.

6. Click **Install**

    ![](../../images/windowseclipse3.png)

7. Installation will proceed:

    ![](../../images/windowseclipse4.png)

8. Accept any permission for unsigned packages that you are prompted for:

    ![](../../images/windowseclipse5.png)

9. When installation is complete, click **Launch**:

    ![](../../images/windowseclipse6.png)

10. Eclipse will start up
    
    ![](../../images/windowseclipse7.png)

11. Choose a location for your workspace. This is arbitrary, accept the default unless you have a reason to change it:

    ![](../../images/windowseclipse8.png)

12. Eventually Eclipse will be ready to start. Untick the **Always show welcome at startup** then click the **Workbench** button top-right:

    ![](../../images/windowseclipse9.png)


13. You will see an empty workspace:

    ![](../../images/windowseclipse10.png)

#### Configure Eclipse to use Maven

This step may not be necessary if the version of Eclipse you install already has Maven support. If the Maven menu item does not appear in the File | New menu.

14. Open the Help | Install new software menu item
15. Click **Add** to add a new software installation site
16. Enter the name **Maven** and set the location to `http://download.eclipse.org/technology/m2e/releases`
17. Click **Add**

    ![](../../images/windowseclipse11.png)

18. Choose the Maven integration option, and click Finish to install the Maven integration.
