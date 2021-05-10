---
title: "Using your own AWS account"
weight: 11
hidden: true
---

{{% notice tip %}}
Only complete this section if you are running the workshop on your own. If you are at an AWS hosted event, please instead follow the instructions to [start the workshop at an AWS event]({{< ref "module0/remote_environment/aws_event" >}}).
{{% /notice %}}

{{% notice warning %}}
Your account must have the ability to create new IAM roles and scope other IAM permissions.
{{% /notice %}}

#### Obtaining an AWS account

1. If you don't already have an AWS account, [create
one now by clicking here](https://portal.aws.amazon.com/billing/signup#/start)


#### Setting up an Administrator account

2. If you don't already have an IAM user in your AWS account that has administrative privilege, follow these instructions to [create a new IAM user to use for the workshop](https://console.aws.amazon.com/iam/home?#/users$new)

3. Enter the user details:
![Create User](/images/iam-1-create-user.png)

4. Attach the AdministratorAccess IAM Policy:
![Attach Policy](/images/iam-2-attach-policy.png)

5. Click to create the new user:
![Confirm User](/images/iam-3-create-user.png)

6. Take note of the login URL and save:
![Login URL](/images/iam-4-save-url.png)
