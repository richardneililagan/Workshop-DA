---
title: "Create S3 Bucket"
weight: 1
pre: "<b>6.1 </b>"
---

There are two ways to add storage with Amplify - **manual** and **automated**. 

Both methods require the auth category with Amazon Cognito to also be enabled. If you are creating an S3 bucket from scratch, you should use the Automated Setup. However if you are reusing existing Cognito and S3 resources, you should opt for Manual Setup.


{{% options "Option A:I want to create a S3 bucket from scratch via the automated option:./createbucket/createbucket-amplify.html" 

"Option B:I want to integrate an existing S3 bucket via manual set up:./createbucket/createbucket-manual.html"

%}}

