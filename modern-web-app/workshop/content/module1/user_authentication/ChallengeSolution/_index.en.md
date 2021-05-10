+++
title = "Challenge Solution"
chapter = true
weight = 4
pre = "<b>4.5 </b>"
+++


Hope you had fun with the previous challenge exercise! Did you get it right? 

The modified return statements of `src/App.js` is as follows:
```bash
  return signedIn ? (
    <div className="App">
        <Fragment>
        <Router>
          <NavigationBar username={username} signOutMethod={signOutMethod} />
          <SegmentBar/> 
          <Switch>
             <Route exact path="/home" component={Home} />
             <Route exact path="/prelogin" component={PreLoginPage} />
            <Route exact path="/flight" component={FlightPage} />
            <Route exacoct path="/hotel" component={HotelPage} /> 
            <Route component={Home} />
          </Switch>
          <Footer />
        </Router>
        <AmplifyAuthenticator/> 
      </Fragment>
    </div>
  ) : (
    <Fragment> 
    <PreLoginPage signedIn={signedIn} setUsernameMethod={setUsernameMethod} signInMethod={signInMethod} /> 
    </Fragment>
);
```

The entire modified `src/App.js` file is now as follows:

```bash
import React, { Fragment } from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import "./App.css";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import NavigationBar from "./components/layout/NavigationBar";
import Home from "./components/pages/Home";
import Footer from "./components/layout/Footer";
import SegmentBar from "./components/layout/SegmentBar";
import FlightPage from "./components/pages/FlightPage";
import HotelPage from "./components/pages/HotelPage";
import PreLoginPage from "./components/pages/PreLoginPage";

import Amplify from 'aws-amplify';
import {Auth} from 'aws-amplify'; 
import awsconfig from './aws-exports';
import { AmplifyAuthenticator, withAuthenticator} from '@aws-amplify/ui-react';
import { AuthState, onAuthUIStateChange } from '@aws-amplify/ui-components';

Amplify.configure(awsconfig);

const App = () => {
  const [authState, setAuthState] = React.useState();
  const [user, setUser] = React.useState();
  const [signedIn, setSignedin] = React.useState(false); 
  const [username , setUsername] = React.useState("");

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

  return signedIn ? (
    <div className="App">
        <Fragment>
        <Router>
          <NavigationBar username={username} signOutMethod={signOutMethod} />
          <SegmentBar/> 
          <Switch>
             <Route exact path="/home" component={Home} />
             <Route exact path="/prelogin" component={PreLoginPage} />
            <Route exact path="/flight" component={FlightPage} />
            <Route exacoct path="/hotel" component={HotelPage} /> 
            <Route component={Home} />
          </Switch>
          <Footer />
        </Router>
        <AmplifyAuthenticator/> 
      </Fragment>
    </div>
  ) : (
    <Fragment> 
    <PreLoginPage signedIn={signedIn} setUsernameMethod={setUsernameMethod} signInMethod={signInMethod} /> 
    </Fragment>
);
}
export default App;
```