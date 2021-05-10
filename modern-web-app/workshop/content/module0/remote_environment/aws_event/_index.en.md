---
title: "AWS-provided account"
weight: 12
hidden: true
disableToc: true
---

{{% notice tip %}}
Only follow the instructions in this section if you are at an AWS-hosted event, otherwise, please follow the instructions [here to start the workshop in your own AWS account]({{< ref "module0/remote_environment/self_paced" >}}).
{{% /notice %}}

#### Login to AWS Workshop Portal

This workshop creates an AWS acccount and a Cloud9 environment. You will need the **Participant Hash** provided upon entry, and your email address to track your unique session.

Connect to the portal by clicking the button or browsing to [https://dashboard.eventengine.run/](https://dashboard.eventengine.run/)

![Event Engine](../../images/event-engine-initial-screen.png)

Enter the provided hash in the text box. The button on the bottom right corner changes to **Accept Terms & Login**. Click on that button to continue.

![Event Engine Dashboard](../../images/event-engine-dashboard.png)

#### Retrieve programmatic access credentials
While some of your interaction with AWS will be interactively via the console, you will also use programmatic access via the AWS CLI. In order to authenticate your access, you need a set of AWS credentials. If you are using an AWS-provided account, you can retrieve these credentials in order to run the lab, by following the instructions below.

1. Click on **AWS Console** button on the 'Team dashboard' page. A dialog box will open. 

![Event Engine AWS Console](../../images/event-engine-aws-console.png)

2. Select your operating system and copy the credentials. They will look like this:

```bash
export AWS_DEFAULT_REGION=ap-southeast-2
export AWS_ACCESS_KEY_ID=ASIAUVHCXU6L6242TNBG
export AWS_SECRET_ACCESS_KEY=N43UEffSG5GYAveRXh46M18dAVQpXp2aQeG/CxTd
export AWS_SESSION_TOKEN=FwoGZXIvYXdzEPf//////////wEaDFkE0EPYXOPgmFUx
```

{{% notice tip %}}
Do not copy these credentials! Copy the credentials from the dashboard :)
{{% /notice %}}

3. Save these credentials to a text file (or into an editor like VSCode). You will use them in future steps in this lab.

4. When you have saved the credentials to a file for later use, click **Open AWS Console**. This will open AWS Console in a new browser tab.




