+++
title = "Apache Tomcat installation for Mac"
weight = 3
pre = "<b>1.3 </b>"
+++
#### Install Apache Tomcat 9 for Mac

1. To install using brew:
```bash
brew install tomcat
```

To have tomcat start automatically at startup:
```bash
brew services start tomcat
```

To test it is working: 
```bash
catalina run
```


Open a browser to [http://localhost:8080 ](http://localhost:8080)

![tomcat localhost](../../images/mactomcat.png)
