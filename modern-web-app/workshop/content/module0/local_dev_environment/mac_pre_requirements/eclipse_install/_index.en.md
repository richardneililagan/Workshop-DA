+++
title = "Eclipse installation for Mac"
weight = 4
pre = "<b>1.4 </b>"
+++
### Install and set up Eclipse.

To install using brew:
```bash
brew install eclipse-jee
```

#### Potential issues: 
If the Eclipse App does not start and has the following error: 
```bash
"Failed to create the Java Virtual Machine"
```

Action the following: 
```bash
cd /Library/Java/JavaVirtualMachines/openjdk-14.jdk/Contents/MacOS
sudo rm libjli.dylib
sudo ln -s /Library/Java/JavaVirtualMachines/openjdk-14.jdk/Contents/Home/lib/libjli.dylib libjli.dylib
```

This will look as a symbolic link as below: 
![symbolic link](../../images/maceclipselink.png)


To test the installation go to Applications and there will now be a Eclipse JEE.app in the folder.

Click on the folder and it will start up Eclipse: 

![workspace](../../images/maceclipsework.png)


1. Eclipse will start up
    
![ide](../../images/maceclipsstart.png)

Eventually Eclipse will be ready to start. Untick the **Always show welcome at startup** then click the **Workbench** button top-right:


2. You will see an empty workspace:

    ![empty workspace](../../images/macemptyworkspace.png)

#### Configure Eclipse to use Maven

This step may not be necessary if the version of Eclipse you install already has Maven support. If the Maven menu item does not appear in the File | New menu.

3. Open the Help | Install new software menu item
4. Click **Add** to add a new software installation site
. Enter the name **Maven** and set the location to http://download.eclipse.org/technology/m2e/releases
5. Click **Add**

![add repo](../../images/macmaverneclipse.png)

6. Choose the Maven integration option, and click Finish to install the Maven integration.
