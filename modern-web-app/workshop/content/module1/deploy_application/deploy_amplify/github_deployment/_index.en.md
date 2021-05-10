---
title: "With GitHub"
weight: 2
pre: "<b>OPTION B</b> "
---

First, let's upload our source code to a Git-based provider of your choice.

AWS Amplify supports multiple Git-based providers such as Github, BitBucket, GitLab and AWS CodeCommit.

In this lab, we will be using Github for demonstration. Ensure that you have uploaded the TravelBuddy bundle files to a Github repository. 

### Deploy with AWS Amplify

 1. Under Services - type in Amplify -> create app. This will bring up a new screen as shown below: 
![amplify-console](../../images/amplify-console.png) 

2. In this demonstration, select `GitHub` and select `Continue`.

3. Enable GitHub authorization by signing in with your GitHub account credentials.

4. Under `Recently updated repositories`, select your TravelBuddy repository by clicking the dropdown bar. 

5. Under `Branch`, select the master branch and click **Next**. 

6. For `Application name`, enter `travelbuddy-webapp`

7. Check "Deploy updates to backend resources with your frontend on every code commit"

8. Select or create a new IAM role to allow the Amplify Console to access your AWS resources. Click `Next`. 

![amplify-saveanddeploy](../../images/amplify-saveanddeploy.png) 

9. On the "Review" page, Select `Save and deploy`. 

![amplify-provision](../../images/amplify-provision.png) 

10. The process takes a couple of minutes for Amplify Console to create the necessary resources and to deploy your code.

![amplify-ready](../../images/amplify-ready.png) 

11. Once completed, click on the available link to launch your TravelBuddy site.

You will be taken to the TravelBuddy website hosted on AWS Amplify.

![amplify-deployed](../../images/amplify-deployed.png) 

With that, your web application is now deployed!
