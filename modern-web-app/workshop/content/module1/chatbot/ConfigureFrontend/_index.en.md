---
title: "Configure Frontend"
weight: 7
pre: "<b>5.2 </b>"
---

With your chatbot now created via Amazon Lex, you will now implement it to the Footer of the TravelBuddy site in this section.

1. Open up the Footer component file in the following directory `src/components/layout/Footer.js`


2. Insert the following code snippet between line 217 and 218 just above the end of the FooterContainer tag.

```bash
<OverlayTrigger
      trigger="click"
      placement="left-end"
      overlay={
        <Popover>
          <ChatBot
            title="TravelBuddy Chatbot"
            theme={myTheme}
            botName="TravelBuddy_dev"
            welcomeMessage="Welcome! I am a chatbot created with AWS Lex, how can I help you today?"
            onComplete={handleComplete}
            clearOnComplete={true}
            conversationModeOn={true}
            className="chatbot-box"/>
        </Popover>
      }
>
    <Fab variant="extended" className="chatbot" position="right-bottom">
        <NavigationIcon className={classes.extendedIcon} />
        Contact Us{"  "}
    </Fab>
</OverlayTrigger>
```
{{% notice warning %}}
Ensure that the `botName` parameter is the same as the name of your chatbot previously created with the AWS Amplify CLI. 
{{% /notice %}}


![test](../images/chatbot-codesnippet.png)


Just like that, we have implemented our conversational chatbot built with Amazon Lex via AWS Amplify into our React web application!

![chatbode](../images/chatbot-landing.png)




<!-- 
{{% options "Option A:I have deployed with containers:./query_api/cloud9.html" "Option B:I have deployed with ElasticBeanstalk:./query_api/eclipse_eb.html" %}} -->
