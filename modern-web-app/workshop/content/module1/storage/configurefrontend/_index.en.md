---
title: "Configure Front End"
weight: 2
pre: "<b>6.2 </b>"
---

With your S3 Bucket now created, you will now connect it to the TravelBuddy web app by configuring the front end.

### Importing Storage module

1. Open up the Navigation Bar component file in the following directory: `src/components/layout/NavigationBar.js`

2. Import the Storage module from AWS Amplify in the Navigation bar component file by adding the following import statement to the top of the file:

```bash
import { Storage } from "aws-amplify"
```

### Populating functions to GET, PUT and DELETE objects from S3 Bucket

In the TravelBuddy code bundle, the bodies of the following 3 functions in `src/App.js` have been removed: `useEffect`, `saveFile` and `removeProfilePic`. 

![storage-emptymethods](../images/storage-emptymethods.png)


In this section, we will complete the functions to better understand interactions with S3 bucket to allow users to upload and remove their profile pictures. 

The following React `useEffect` Hook is called each time the Navigation bar component is being rendered. Learn more about React Hooks [here](https://reactjs.org/docs/hooks-effect.html).

In the body of the function, the method `Storage.list` lists all objects present in the S3 Bucket and returns a list of object names. Within this list of object names, an attempt is made to look for a match between the names of the objects, and the user's username. A match would indicate that the S3 bucket contains a profile picture of the user. 
If a match is found, the method `Storage.get` downloads the object from the S3 bucket, and displays it on the Navigation bar with the `setprofileState` method.

```bash
  useEffect(() => {
    Storage.list('',{level :'public'})
      .then(result => {
        result.map((key) => {
          if (props.username == key.key){
            console.log("Existing Profile Picture found in S3 bucket:", key.key);
            setphotoUploaded(true);
            var URL = props.username.replace(/\s/g, ''); 
            Storage.get(URL)
            .then(data=>{
              setprofileState({
                fileUrl:data,
                filename:props.username,
              })
            })
            .catch(err=>{
              console.log('error fetching image', err);
            })
          }
        })
      })
      .catch(err => console.log(err));
  }, []);
  ```

In the following function `SaveFile`, the method `Storage.put` allows the user to upload a profile picture into the S3 bucket.

```bash
  const saveFile=()=>{
    if (profileState.fileUrl!=='') {
      setisLoading(true)
      Storage.put(profileState.filename, profileState.file)
        .then(()=>{
          console.log("Successfully saved file!")
          setisLoading(false);
          setphotoUploaded(true);
        })
        .catch(err=>{
          console.log("Error uploading file", err)
        })
    }
  }
```

In the following function `removeProfilePic`, the method `Storage.remove` allows the user to remove a previously uploaded profile picture from the S3 bucket.

```bash
  const removeProfilePic = () => {
    console.log(profileState.filename)
    Storage.remove(profileState.filename)
    .then(result => console.log(result))
    .catch(err => console.log(err));

    setprofileState({
      fileUrl:"",
      file:"",
      filename:""
    });
    setphotoUploaded(false);
  }
```

After completing the functions, the storage functionality should work as intended - let's try it out! 

### Storage Functionality Demonstration

1. Return to the landing page of our TravelBuddy web application. Create an account and sign in. 

![storage-demo-1](../images/storage-demo-1.png)

2. Click on the account username at the top right hand side of the Navigation Bar. A modal titled `Select profile picture` should appear as shown below. 

![storage-demo-2](../images/storage-demo-2.png)

3. Upload a profile picture (JPG/PNG file) either by dragging and dropping it into the drop zone in the modal, or by clicking the drop zone.

![storage-demo-3](../images/storage-demo-3.png)

4. A preview of your uploaded image should appear at the bottom of the modal. Click `Make Changes`. 

This action triggers the `saveFile` method from above, which uploads the uploaded image into the S3 Bucket. 

![storage-demo-4](../images/storage-demo-4.png)

5. Verify that the thumbnail at the top right hand side of the Navigation bar has been updated with your uploaded image. Viola!

![storage-demo-5](../images/storage-demo-5.png)

6. Let us verify that the removal functionality works as well. 

Click on the account username at the top right hand side of the Navigation Bar. 

Select the `Remove` button at the bottom of the modal. This action triggers the `removeProfilePic` method from above, which deletes the uploaded image from the S3 Bucket. 

The preview of your profile picture should disappear, showing you a message of "No current profile picture" as shown below. Similarly, we can see that the thumbnail at the top right hand side of the Navigation bar has returned to the default display picture.

![storage-demo-2](../images/storage-demo-2.png)

There we have it - we have successfully incorporated User Storage capabilities with Amazon S3 and AWS Amplify and have written code to incorporate CRUD functionalities! 

<!-- 
{{% options "Option A:I have deployed with containers:./query_api/cloud9.html" "Option B:I have deployed with ElasticBeanstalk:./query_api/eclipse_eb.html" %}} -->
