---
title: "Incorporate User Storage"
weight: 7
pre: "<b>6. </b>"
---

AWS Amplify Storage module provides a simple mechanism for managing user content for your app in public, protected or private storage buckets. 

The Storage category comes with built-in support for Amazon S3 and DynamoDB.

To demonstrate this capability, you will set up a public S3 bucket and connect it with the TravelBuddy web app to allow your users to upload a profile picture of their choice.

Upon user sign-in (through user authentication from section 4), this profile picture will be displayed on to the Navigation bar of the TravelBuddy Site. 


<!-- 
{{% options "Option A:I have deployed with containers:./query_api/cloud9.html" "Option B:I have deployed with ElasticBeanstalk:./query_api/eclipse_eb.html" %}} -->
