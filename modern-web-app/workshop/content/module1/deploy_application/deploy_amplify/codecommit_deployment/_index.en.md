---
title: "With CodeCommit"
weight: 2
pre: "<b>OPTION A </b> "
---

First, let's upload our source code to CodeCommit.

AWS CodeCommit is a fully-managed source control service that hosts secure Git-based repositories. It makes it easy for teams to collaborate on code in a secure and highly scalable ecosystem. CodeCommit eliminates the need to operate your own source control system or worry about scaling its infrastructure. You can use CodeCommit to securely store anything from source code to binaries, and it works seamlessly with your existing Git tools.



### Creating a new repository on CodeCommit 

 1. Under Services - type in CodeCommit. This will bring up a new screen as shown below: 
 ![codecommit-console](../../images/codecommit-console.png) 


2. Select `Create repository`. 

3. For `Repository name`, enter `travelbuddy-webapp`

4. Select `Create`. 

5. Now that the repository is created, set up an IAM user with Git credentials in the IAM console following [these instructions.](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-gc.html#setting-up-gc-iam)

6. Back in the CodeCommit console, from the Clone URL drop down, select Clone HTTPS

 ![codecommit-console](../../images/codecommit-cloneurl.png) 

7. From a terminal window run git clone and the HTTPS URL of the respository:

```bash
$ git clone <HTTPS URL>
Cloning into 'travelbuddy-wedapp'...
Username for 'https://git-codecommit.us-east-1.amazonaws.com':XXXXXXXXXX
Password for 'USERID': XXXXXXXXXXXX
warning: You appear to have cloned an empty repository.
```

### Populate the CodeCommit repository with TravelBuddy source code

8. Now that the repository is initialised, let us populate the repository with our TravelBuddy source code.

Copy the contents of the TravelBuddy bundle previously downloaded into this newly created folder. 

9. Commit the change to your CodeCommit repository using the following git commands. 

```bash
git add .
git commit -m "First Commit"
git push 
```

{{% notice note %}}
As we are pushing the entire project source code into the Repository with a single commit, this process might take some time [>10mins]. 
{{% /notice %}}


10. Verify that the TravelBuddy source code is now populated in the CodeCommit repository.
![codecommit-files](../../images/codecommit-files.png) 

### Deploy with AWS Amplify

Now that we have populated our CodeCommit repository with the project source code, let's deploy our repository with AWS Amplify!

1. Under Services - type in Amplify -> create app. This will bring up a new screen as shown below: 
![amplify-console-codecommit](../../images/amplify-console-codecommit.png) 

2. In this demonstration, select `CodeCommit` and select `Continue`.

3. Under `Recently updated repositories`, select your TravelBuddy CodeCommit repository by clicking the dropdown bar. 

4. Under `Branch`, select the master branch and click **Next**. 

5. For `Application name`, enter `travelbuddy-webapp`

6. Check "Deploy updates to backend resources with your frontend on every code commit"

7. Select or create a new IAM role to allow the Amplify Console to access your AWS resources. Click `Next`. 


![amplify-saveanddeploy-codecommit](../../images/amplify-saveanddeploy-codecommit.png) 

9. On the "Review" page, Select `Save and deploy`. 

![amplify-provision-codecommit](../../images/amplify-provision-codecommit.png) 

10. The process takes a couple of minutes for Amplify Console to create the necessary resources and to deploy your code.

![amplify-deployed-codecommit](../../images/amplify-deployed-codecommit.png) 

11. Once completed, click on the available link to launch your TravelBuddy site.

You will be taken to the TravelBuddy website hosted on AWS Amplify.

![amplify-deployed](../../images/amplify-deployed.png) 

With that, your web application is now deployed!


