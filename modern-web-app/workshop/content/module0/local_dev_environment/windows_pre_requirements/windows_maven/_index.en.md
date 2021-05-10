+++
title = "Apache Maven installation on Windows"
weight = 2
pre = "<b>2.2 </b>"
+++
Browse to [the Apache Maven download page](https://maven.apache.org/download.cgi)

![](../../images/windowsmaven.png)
Scroll down to locate the link to download **apache-maven-3.6.3-bin.zip**, the binary archive for Maven:
    ![](../../images/windowsmaven1.png)

1. Browse to [the installation instructions page](https://maven.apache.org/install.html) for instructions on how to install Maven - the steps are outlined below.

    First, unzip the contents of the file into `C:\Program Files\Apache Software Foundation\`

    ![](../../images/windowsmaven2.png)

<hr />

2. Confirm the unpack succeeded, and that the path `C:\Program Files\Apache Software Foundation\apache-maven-3.6.3\bin` is present on the filesystem. Copy this path into your clipboard:

   ![](../../images/windowsmaven3.png)

<hr />

3. You now need to set an environment variable so that the tools can find Maven. Open the system properties tool:

    ![](../../images/windowsmaven4.png)
<hr />

4. Edit the PATH variable:

    ![](../../images/windowsmaven5.png)

<hr />

5. Add in the path to the bin folder for Maven (`C:\Program Files\Apache Software Foundation\apache-maven-3.6.3\bin`) and save the changes.

    ![](../../images/windowsmaven6.png)

<hr />

6. Test that the maven is working, open a new powershell and run `mvn -version`

    ![](../../images/windowsmaven7.png)