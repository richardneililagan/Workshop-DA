---
title: "Modify your Site"
weight: 2
pre: "<b>3.2 </b> "
---

The AWS Amplify Console will rebuild and redeploy the app when it detects changes to the connected repository. Let's make a change on our site to test out this process.

1. Within our TravelBuddy code bundle, Open the `index.html` page inside the `public` folder.

2. Modify the title line so it says **TravelBuddy - The only buddy you need to bring along on your life's adventures!**.

![amplify-modifytitle](../images/amplify-modifytitle.png)

3. Save the file and commit the change to your git repository. 

```bash
git add .
git commit -m "Updated title"
git push 
```

4. Amplify Console will begin to build the site again soon after it notices the update to the repository. It will happen pretty quickly! Head back to the Amplify Console console page to watch the process.

![amplify-triggerupdate](../images/amplify-triggerupdate.png)

5. Once completed, re-open the TravelBuddy site and notice the title change.

![amplify-updatedtitle](../images/amplify-updatedtitle.png)


 
With that, we have created our very own CI/CD environment!

--- 

Congratulations! You now have successfully:

- Taken a modern web application built with ReactJS and deployed it on the Internet with AWS Amplify.

- Connected a git-based source code project (GitHub/CodeCommit) to AWS Amplify to build a CI/CD pipeline.

- Made changes to the source code, commited and push those changes into Github/CodeCommit which triggered an automated build process via AWS Amplify.









