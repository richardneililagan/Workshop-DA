---
title: "Automated Setup with AWS Amplify"
weight: 7
pre: "<b>OPTION A </b>"
---

### Automated Setup: Create storage bucket

1. To start from scratch, run the following command from the root of your project:
```bash
amplify add storage
```
2. Select `Content` in prompted options:

```bash
? Please select from one of the below mentioned services (Use arrow keys)
❯ Content (Images, audio, video, etc.)
  NoSQL Database
```
The CLI will walk you though the options to enable Auth, if not enabled previously, and name your S3 bucket with `profileimgstore`. 

3. To update your backend, run:
```bash
amplify push
```

When your backend is successfully updated, your new configuration file `aws-exports.js` is copied under your source directory.














