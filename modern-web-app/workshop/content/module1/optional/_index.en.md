---
title: "Bonus round!"
weight: 8
pre: "<b>8. </b>"
hidden: true
---

Now for some optional tasks to stretch you! If you have time to complete these, be sure to think about how you can extend the functionality and be prepared to explain your implementation to your fellow students!

#### Using the SDK to upload files to Amazon S3


1. Download the source [S3Manager.zip](files/S3Manager.zip) file. S3Manager is an example Java app that uses the SDK to upload files to an S3 bucket. You can find more example information in the documentation at http://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/examples-s3.html.

2. Extract the zip file, and open the project in your IDE.

3. Bucket names in AWS must be globally unique. To allow the unit test to succeed, you need to edit the code to edit the `bucketName` defined in the TestSuite class (`src/test/java/idevelop.samples.test.TestSuite.java`). Edit the bucket name to add your first/last name to make it unique. Replace the *\<yourname\>* section with your name (without spaces, lower case and no special characters including \< and \>) in `idevelop-<yourname>-testsuite`
4. Run the Unit test for this application. The unit test will peform these steps:
	- Create a bucket in the default region
	- List available buckets in your account
	- Confirm that the bucket that was created is in fact empty
	- Upload a test file to the bucket
	- Delete the uploaded file
	- Delete the bucket

	Here's an example of the output you will see:

```
==================================
Starting Test Suite
==================================

Testing idevelop.samples.AmazonS3Manager
Created bucket idevelop-alarter-testsuite.
     cf-templates-1ncvgcbjnv965-us-west-2: Created on Thu Aug 03 10:31:20 AEST 2018
     elasticbeanstalk-us-west-2-327756672493: Created on Thu Aug 03 11:23:20 AEST 2018
     idevelop-alarter-testsuite: Created on Thu Aug 03 11:59:56 AEST 2018
     ql-cf-templates-1501715150-1b6bb19f7fe4a3b4-us-west-2: Created on Thu Aug 03 09:05:51 AEST 2018
     qltrail-lab-8388-1501715152: Created on Thu Aug 03 09:05:54 AEST 2018
Lab1/S3Manager/target/test-classes/Puppy.jpg
Started upload of Lab1/S3Manager/target/test-classes/Puppy.jpg to S3 location s3://idevelop-alarter-testsuite/UploadTest.dat
Progress: 0.00000%
Progress: 6.38504%
Progress: 12.77007%
Progress: 19.15511%
...
Progress: 95.77553%
Progress: 100.00000%
Finished upload of Lab1/S3Manager/target/test-classes/Puppy.jpg
Created bucket idevelop-alarter-testsuite.
Deleted object idevelop-alarter-testsuite/UploadTest.dat
Deleted bucket idevelop-alarter-testsuite.
```

5. If these test succeed, you are ready to run the application. Run the code as a Java Application, and use the menu to create a bucket and upload an image file (you can use the *Puppy.jpg* file provided in `src/test/resources`, or your own file). Note that you will need to set a bucket name, or update the source code to use the same bucket name that you created in the previous step.
6. In the AWS Console, click **Services**, type **s3** and select the S3 option.
7. You will see a list of four buckets. These buckets have been automatically created for you by the various tasks we have executed up to this point - Elastic Beanstalk, CloudFormation and Event Engine have all used S3 in your account to manage their storage requirements. For example:

![](images/lab1-s3default.png)

8. In your IDE, run the S3Manager application and set the bucketname to a suitable name. Choose the Create Bucket option to create a new bucket:

![](images/lab1-s3manager-createbucket.png)

9. Back in the AWS S3 Console, refresh the bucket list. Note that your new bucket is now shown in the list of buckets in your account.
10. Use the S3Manager app to list all buckets and confirm the list matches the AWS S3 console.
11. Use the S3Manager app to upload a file to the bucket. you can use your own image file, or use the Puppy.jpg test file provided for you in `src/test/resources`
12. When the file upload is finished, on the AWS S3 Console, browse into the bucket to confirm the file is present.
13. Click on the file in the S3 console to see additional properties. At the bottom of the properties page, note the link to the file. Copy this link and paste it into a new browser window to attempt to retrieve the file. You will receive an Access Denied when you try to do so. The reason for this is that the bucket is not marked as world readable, so no files will be served out of the bucket without a signed URL. You can mark this particular file as public just as a test.
14. In the properties page of the file in the S3 console, click `Make Public'. Now attempt to view the file again using the link. The file will render as expected.

### Optional Task
* Marking the file you have uploaded as public may not be the best approach for your application. Instead, you may want to keep files private, but give conditional access to files as needed. AWS S3 uses signed URLs to facilitate this behaviour. See hints if you are stuck.

	Enhance the application so that a **Pre-Signed URL** is generated for the uploaded file. Use the generated URL to request the file in a web browser. For information about how to do this, see <http://docs.aws.amazon.com/AmazonS3/latest/dev/ShareObjectPreSignedURLJavaSDK.html>

### Optional Task
* ElasticBeanstalk allows you to retrieve the logs from the running instances using the **Logs | Request Logs** option in the console. Build a Java application to retrieve these log files programmatically.

### Optional Task
* The AWS SDKs allow you to programmatically orchestrate the ElasticBeanstalk environment. Build a Java application that lists all available Elastic Beanstalk applications, their environments and the currently running versions. Add functionality to allow the tool to upload a new application version to S3, then programmatically update and deploy that version to your Elastic Beanstalk envrionment.


{{% notice tip  %}}
Pre-Signed URL
{{% /notice %}}
Add the following in AmazonS3Manager.java
``` java
public void GenerateURLObject(
			String bucketName,
			String keyName
			)
	{
		try {
            java.util.Date expiration = new java.util.Date();
            long expTimeMillis = expiration.getTime();
            expTimeMillis += 1000 * 60 * 60;
            expiration.setTime(expTimeMillis);

            GeneratePresignedUrlRequest generatePresignedUrlRequest =
                    new GeneratePresignedUrlRequest(bucketName, keyName)
                            .withMethod(HttpMethod.GET);
            //                .withExpiration(expiration);
            URL url = this.s3.generatePresignedUrl(generatePresignedUrlRequest);
            System.out.println("Pre-Signed URL: " + url.getQuery());
            System.out.println("Pre-Signed URL: " + url.toString());

        } catch (AmazonServiceException e) {
            // The call was transmitted successfully, but Amazon S3 couldn't process
            // it, so it returned an error response.
            e.printStackTrace();
        } catch (SdkClientException e) {
            // Amazon S3 couldn't be contacted for a response, or the client
            // couldn't parse the response from Amazon S3.
            e.printStackTrace();
        }
	}
```
Add the following in Application.java
line 25 
``` java
System.out.println("8 - Get URL for object in Bucket (" + bucketName + ")");
```
line 110
``` java
case 8:
System.out.print("\nWhat is the object name in the bucket? ");
String keyName1 = input.nextLine();
s3manager.GenerateURLObject(bucketName, keyName1);
System.out.println("\n\n     done!");
break;
```
TestSuite.java add 
``` java
@Test
public void test_E_UrlBucket() {

	AmazonS3Manager s3manager = new AmazonS3Manager();
	
	s3manager.GenerateURLObject(bucketName, "UploadTest.dat");
}
```
Change test_E_DeleteObject to test_F_DeleteObject

Example can be found here:  [S3Obj.zip](files/S3Obj.zip)
