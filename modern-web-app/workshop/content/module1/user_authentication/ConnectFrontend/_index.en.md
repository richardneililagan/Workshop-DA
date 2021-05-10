---
title: "Set up Frontend"
weight: 3
pre: "<b>4.2. </b>"
---

Next, we need to configure Amplify on the client so that we can use it to interact with our backend services.

Open `src/App.js` and add the following code below the last import:

```bash
import Amplify, {Auth} from "aws-amplify";
import awsExports from "./aws-exports";
import { AmplifyAuthenticator,withAuthenticator } from '@aws-amplify/ui-react'
import { AuthState, onAuthUIStateChange } from '@aws-amplify/ui-components';
Amplify.configure(awsExports);
```
And that’s all it takes to configure Amplify.

As you add or remove categories and make updates to your backend configuration using the Amplify CLI, the configuration in aws-exports.js will update automatically.

 ![amplify-frontendsetup](../images/amplify-frontend-setup.png)

Now that our React app is set up and Amplify is initialized, we’re ready to add User Authentication in the next step.


