+++
title = "Java installation for Mac"
weight = 1
pre = "<b>1.1 </b>"
+++

#### Install the Java 8 Virtual Machine (JRE)

1. Install via brew
    ``` bash
    brew update
    brew tap adoptopenjdk/openjdk
    brew cask info adoptopenjdk # to confirm correct tap is installed
    brew cask install java
    enter admin Password:
    ```

    ![java gif](../../images/mac4.png)

    To confirm java is installed 

    ```bash
    java --version
    ```
![java version](../../images/mac5.png)

2. Install via tar.gz
Download the macOS version  [Java opensource download site](https://jdk.java.net/) and download the latest "Ready to use:" JDK :

![jdk website](../../images/mac1.png)

![mac version](../../images/mac2.png)

Install this into a directory which the user has access to : 
```bash
    $ mkdir /yourjavadir/; cd /yourjavadir/
    $ tar -zxvf ~/Downloads/openjdk-14.0.1_osx-x64_bin.tar.gz 
    $ vim ~/.bash_profile 

    export JAVA_HOME=/yourjavadir/jdk-14.0.1.jdk/Contents/Home/bin

    $ source ~/.bash_profile
    $ echo $JAVA_HOME
```

### Test to make sure its working: 
Create a file called HelloWorld.java 
```bash 
vim HelloWorld.java
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