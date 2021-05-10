---
menuTitle: "Provided account"
title: "AWS CLI with a provided account"
weight: 1
pre: "<b>Option A </b>"
---
#### Setting up credentials when using an AWS-provided account

1. Open a text editor and copy the four command lines below into the editor.

```bash
aws configure set profile.devaxacademy.region <your_region>
aws configure set profile.devaxacademy.aws_access_key_id <access_key_id>
aws configure set profile.devaxacademy.aws_secret_access_key <secret_access_key>
aws configure set profile.devaxacademy.aws_session_token <session_token>
```

2. We now need to get the IAM user credentials from event engine, Go back to your event engine tab. [https://dashboard.eventengine.run/](https://dashboard.eventengine.run/)

![](./provided_account/event-engine-dashboard.png)

3. Click on the AWS Console button.
4. Copy down the information in the box show in the image

![](./provided_account/AWS-console-login.png)

5. Insert the values in this box into the corresponding `aws configure` statements you just copied from above:

    - **\<your_region\>** with the *Region code*. Your instructor will advise you which AWS region to use for this Lab, but if you do not have an instructor, use the region found in the popup window in event engine.
    - **\<access_key_id\>** with the *Access Key Id*
    - **\<secret_access_key\>** with the *Secret Access Key*
    - **\<session_token\>** with the *Session token*

{{% notice note %}}
Do not leave \< or \> in the replaced text.
{{% /notice %}}

6. Copy and paste the lines into your command line environment (Command Prompt on Windows, Terminal on Unix systems) to execute them.

{{% notice tip %}}
If you have errors such as *aws cannot be found*, please make sure you have installed AWS CLI correctly and restarted your shell.
{{% /notice %}}


{{% notice tip %}}
Once you have executed the lines above, you will have set up your credentials for the lab environment.
{{% /notice %}}

7. Test out the configure commands work by running `aws s3 ls --profile devaxacademy`. If it worked, you should see no output

