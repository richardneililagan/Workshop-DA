---
title: "Add Authentication"
weight: 4
pre: "<b>4.3. </b>"
---
### Authentication with Amplify
The Amplify Framework uses [Amazon Cognito](https://aws.amazon.com/cognito/) as the main authentication provider. Amazon Cognito is a robust user directory service that handles user registration, authentication, account recovery & other operations. In this tutorial, you’ll learn how to add authentication to your application using Amazon Cognito and username/password login.

1. Create authentication service 
```bash
amplify add auth

? Do you want to use the default authentication and security configuration? Default configuration
? How do you want users to be able to sign in? Username
? Do you want to configure advanced settings?  No, I am done.
````

2. Deploy the service with the `push` command:

```bash
amplify push
```

### Create login UI

Now that we have our authentication service deployed to AWS, it’s time to add authentication to our React app. Creating the login flow can be quite difficult and time consuming to get right. Luckily Amplify Framework has an authentication UI component we can use that will provide the entire authentication flow for us, using our configuration specified in our `aws-exports.js` file.

Open `src/App.js` and make the following changes:

1. Import the `withAuthenticator` component:

```bash
import { withAuthenticator } from '@aws-amplify/ui-react'
```

2. Change the default export to be the `withAuthenticator` wrapping the main component:

```bash
export default withAuthenticator(App)
```

Changes to `src/App.js` can be shown below (line 13 and 39)
![amplify-addauthcode](../images/amplify-addauthcode.png) 

3. Run the app to see the new Authentication flow protecting the app:

```
npm start
```

Access your application at https://localhost:3000. Now you should see the app load with an authentication flow allowing users to sign up and sign in.

![amplify-loginui](../images/amplify-loginui.png) 

After creating an account and signing in, you can see that we have been brought to our landing page!

![App Deployed](../images/landing-page.png)

Just like that, we have incorporated user authentication with AWS Cognito via AWS Amplify into our React web application.



