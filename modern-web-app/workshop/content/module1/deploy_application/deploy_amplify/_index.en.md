---
title: "Deploy with AWS Amplify"
weight: 2
pre: "<b>3.1 </b> "
---

Now that we know the app runs, you will create a new environment in AWS using Amplify and host our TravelBuddy web application there so that it can be accessed by users on the Internet.

AWS Amplify Console is a static web hosting service that accelerates your application release cycle by providing a simple CI/CD workflow for building and deploying static web applications.

The AWS Amplify Console provides a Git-based workflow for building, deploying, and hosting fullstack serverless web applications. Fullstack serverless apps comprise of backend resources such as GraphQL APIs, Data and File Storage, Authentication, or Analytics, integrated with a frontend framework such as React, Gatsby, or Angular.

In this exercise, you will have the option to connect the project source code to AWS Amplify from a open-source Git repository or through AWS' very own source control service - CodeCommit. 

{{% notice tip %}}
If you haven't used CodeCommit before, this is an excellent opportunity to use a fully-managed source control service that integrates seamlessly with AWS services! Whether you choose to develop on AWS CodeCommit or an open-source git service like GitHub, you will still be able to cover all the topics of the lab.

{{% /notice %}}

{{% options "Option A:I want to integrate AWS Amplfiy with CodeCommit:./deploy_amplify/codecommit_deployment.html" 

"Option B:I want to integrate AWS Amplfiy with GitHub:./deploy_amplify/github_deployment.html"

%}}

