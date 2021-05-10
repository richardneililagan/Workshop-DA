+++
title = "Challenge - Custom Forms"
chapter = true
weight = 4
pre = "<b>4.4 </b>"
+++


In the previous example, you used the Amplify React UI library and the `withAuthenticator` component to quickly get up and running with a real-world authentication flow.

You can also customize this component to add or remove fields, update styling, or other configurations.

In addition to the `withAuthenticator` you can build custom authentication flows using the Auth class.

`Auth` has over 30 methods including `signUp`, `signIn`, `forgotPassword`, and `signOut` that allow you full control over all aspects of the user authentication flow. Check out the complete API [here.](https://aws-amplify.github.io/amplify-js/api/classes/authclass.html)

As an optional task, you are challenged with implementing custom forms using the `Auth` class methods. 

The following have been provided for you in the source code bundle:

- Sign In / Sign Up UI Components under `src/components/layout/SignInComponents.js`
- Pre Login Landing Page under `src/components/pages/PreLoginPage.js`

Add the following local state declarations to the component file of `src/App.js`

```bash
  const [authState, setAuthState] = React.useState();
  const [user, setUser] = React.useState();
  const [signedIn, setSignedin] = React.useState(false); 
  const [username , setUsername] = React.useState("");
```
Add the following methods to the component file of `src/App.js` 
```bash
  React.useEffect(() => {
    if (localStorage.getItem("username")){
      setSignedin(true)
      setUsername(localStorage.getItem("username"))
    }
      onAuthUIStateChange((nextAuthState, authData) => {
        if (nextAuthState === AuthState.SignedIn) {
          setUsername(authData.username)
          localStorage.setItem("username", authData.username)
        }
        if (!authData) {
          console.log("user is not signed in...");
        }
      });
  }, []);

  const signInMethod = () => {
    setSignedin(true);
  }

  const setUsernameMethod = (name) => {
    setUsername(name);
  }

  const signOutMethod = () => {
    setSignedin(false);
    Auth.signOut();
    localStorage.removeItem("username")
  }

```





> 1. Inside the return statements of `src/App.js`, modify it to implement conditional rendering of the page `PreLoginPage.js` when the user is not signed in Refer to the [Official Amplify documentation](https://docs.amplify.aws/ui/auth/authenticator/q/framework/react#onauthuistatechange) for more information.

When completed, the custom forms workflow should look like this: 

1. Prior to signing in, you will be greeted with a custom login page.

![amplify-prelogin-1](../images/amplify-prelogin-1.png)

![amplify-prelogin-2](../images/amplify-prelogin-2.png)

2.  After logging in, you will be brought to the rest of the TravelBuddy site!

![amplify-prelogin-3](../images/amplify-prelogin-3.png)
