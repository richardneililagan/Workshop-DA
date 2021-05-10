+++
title = "Java installation on Windows"
weight = 1
pre = "<b>2.1 </b>"
+++

#### Install the Java 8 Virtual Machine (JRE)

1. Browse to the download site based off of your version of Java. Here are some versions, please decide based on the license requirements. 
- AWS java - https://docs.aws.amazon.com/corretto/latest/corretto-11-ug/what-is-corretto-11.html 
- Oracle java - https://www.java.com/en/download/
- OpenSource jdk - https://jdk.java.net/14/

These are the instructions to install the openJDK version - 
https://adoptopenjdk.net/releases.html?variant=openjdk14&jvmVariant=hotspot

Choose 
This is based off of JDK version 14.0.1 at the time of writing. Choose the MSI based on your system. 


Under windows go to settings -> System. In the search bar type in path. 
![java gif](../../images/windowsjdksetup.png)

Install as per your requiremetns 
![](../../images/jdkwindows.png)
![](../../images/jdkwindows1.png)
![](../../images/jdkwindows2.png)
![](../../images/jdkwindows3.png)
![](../../images/jdkwindows4.png)

Setup the required PATH and JAVA_HOME: 

Right Click -> My Computer(This PC) -> Properties -> Advanced System Settings

Now click on Environment Variables, select Path under System Variables section and click on Edit. We need to add the path of installed JDK to system Path.
![](../../images/jdkwindows5.png)
![](../../images/jdkwindows6.png)

Press OK Button 3 times to close all the windows. This sets the JDK 14 on system environment variables to access the same from the console.

Notes: Remove existing PATH values specific to previously installed Java. Also update JAVA_HOME, in case it was already set.

Now again open the console and test the Java version as shown. Make sure to use a new powershell onsole to test the version.
![](../../images/jdkwindows7.png)


### Test to make sure its working: 
Create a file called HelloWorld.java 
```bash 
notepad HelloWorld.java
``` 
```java
class HelloWorld {
   public static void main(String[] args) {
       System.out.println("Hello World!");
   }
}
```
```bash
$ javac HelloWorld.java
$ java HelloWorld
Hello World!
```