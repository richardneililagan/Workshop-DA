---
title: "Use VSCode IDE"
weight: 1
pre: "<b>2.1</b> "
---

### Setting up Integrated Development Environment 
1. Open the VSCode IDE.
2. Click ``Open folder...``
3. Browse to the TravelBuddy package you downloaded and click ``Open``.
4. Along your menu bar, select ``View``, then select ``Terminal[^`]`` to launch a terminal at the bottom of the IDE.
5. Your development environment should look like this
![IDE Ready](../images/ide-ready.png)

### Install Project Dependencies 

5. In the newly launched terminal, install project dependencies with the command **'npm install'**
```bash
npm install
```

![npm install](../images/installdependencies.png)

{{% notice note %}}
When installing project dependencies for the first time, the process should take 3-5 mins.
{{% /notice %}}

### Deploy Project Locally 
6. After the project dependencies are installed, deploy the project locally with the command **'npm start'**
```bash
npm start
```
![npm start](../images/npmstart.png)



7. Access the TravelBuddy application in a browser by the following **http://localhost:3000/**
![App Deployed](../images/landing-page.png)


{{% notice warning %}}
You must install the project dependencies before deploying the project or the launch will fail.
{{% /notice %}}

{{% notice tip %}}
You could also access the TravelBuddy application in a browser by following http://localhost:3000/
{{% /notice %}}

**Note the following:**
- The app will automatically reload if you make changes to the code. You will see the build errors and lint warnings in the console.