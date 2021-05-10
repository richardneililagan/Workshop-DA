---
menuTitle: "Own account"
title: "AWS CLI with your own account"
weight: 2
pre: "<b>Option B </b>"
prevLink: "install_cli"
---

#### Setting up credentials when using your own AWS account

1. Open a text editor and copy the three command lines below into the editor.

```bash
aws configure set profile.devaxacademy.region <your_region>
aws configure set profile.devaxacademy.aws_access_key_id <access_key_id>
aws configure set profile.devaxacademy.aws_secret_access_key <secret_access_key>
```

2. If you already have a set of credentials for an IAM user with administrative privileges, you can reuse those for the field below in the next step. If you do not yet have programmatic access credentials, [follow the instructions here](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys) to retrieve them for a user with administrative privilege for use in this lab.

3. Insert the values of each the following into the `aws configure` statements you just copied from above:

    - **\<your_region\>** with the *Region code*. Your instructor will advise you which AWS region to use for this Lab, but if you do not have an instructor, you can use `us-east-1` or `ap-southeast-2`.
    - **\<access_key_id\>** with the *Access Key Id*
    - **\<secret_access_key\>** with the *Secret Access Key*

{{% notice note %}}
Do not leave \< or \> in the replaced text.
{{% /notice %}}

4. Copy and paste the lines into your command line environment to execute them.

{{% notice tip %}}
If you have errors such as *aws cannot be found*, please make sure you have installed AWS CLI correctly and restarted your shell.
{{% /notice %}}


{{% notice tip %}}
Once you have executed the lines above, you will have set up your credentials for the lab environment. [Click here to continue with the next step of setup.].
{{% /notice %}}


