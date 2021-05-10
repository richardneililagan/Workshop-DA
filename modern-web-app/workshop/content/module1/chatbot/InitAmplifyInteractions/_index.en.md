---
title: "Create Chatbot"
weight: 2
pre: "<b>5.1. </b>"
---

AWS Amplify Interactions category enables AI-powered chatbots in your web or mobile apps. You can use Interactions to configure your backend chatbot provider and to integrate a chatbot UI into your app with just a single line of code.

### Initialize Amplify Interactions 

1. Initialize AWS Amplify Interactions with the following command in your project's root folder:

```bash
amplify add interactions
```

The CLI will lead you through the steps to specify the chatbot to be created.

You can choose to start from a sample chatbot or start from scratch. If you choose to start from scratch, the CLI will prompt you with a series of questions to set the intents and slots for the chatbot.

{{% notice note %}}
You are allowed to run the `amplify add interactions` command multiple times to add multiple chatbots into your project.
{{% /notice %}}

2. The `add` command automatically creates a backend configuration locally. To update your backend in the cloud, run:

```bash
amplify push
```

Upon successful execution of the push command, a configuration file called `aws-exports.js` will be copied to your configured source directory.

