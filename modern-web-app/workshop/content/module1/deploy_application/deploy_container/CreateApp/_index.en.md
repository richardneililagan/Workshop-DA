---
title: "Fargate Create Application and Environment"
weight: 1
pre: "<b>5.1 </b>"
---

ECS (elastic container service) Fargate removes the burden of provisioning container based services. 

In this lab we will create a local docker environment to install tomcat, and a separate container for testing your mysql application. 

We will demonstrate this from the Windows machine. Your application can be migrated to a Docker container and then deployed into Fargate without the heavy lifting and no modifications to the application. 

Test this locally on your machine to make sure the docker container can communicate to the database and it works locally.

1. Logon to your windows machine you have been provided and open a powershell.

There will be two containers docker onto the machine - 
https://docs.docker.com/engine/install/


2. In the AWS Console, click **Services**, and type **beanstalk** and then press **enter**.  You will now be directed to the AWS Elastic Beanstalk console.
3. On the top right of the console click **Create Application**
4. For **Application name**, enter `TravelBuddy`
5. For **Platfrom**, select **Tomcat**
6. For **Application Code** select **Upload your code**
7. In the Source code origin panel, select **Local file** and click **Choose file**.
8. Locate the `travelbuddy.war` file you created previously and click **Open**.
{{% notice info %}}
At this point, the browser will upload the WAR file you have selected, before showing the next step of the wizard. The upload could take some time, but you can monitor the upload progress in your browser.
{{% /notice %}}
9. Once the file is successfully uploaded, Click **Configure more options**.

10. In the Configure Travelbuddy-env window that appears, for Configuration Presets select ```High availability.``` This will change the configuration to support multiple web servers behind an Elastic Load Balancer and implement auto-scaling.

#### Configure network
11. Locate the **Network** configuration card, and click **Edit**
12. In the **Modify Network** page, for **VPC** choose the `Lab VPC` from the drop-down list.
13. In the *Load balancer settings* panel, leave the **visibility** set to **Public** since you need the ELB to be able to serve traffic from the Internet.
14. In the *Load balancer subnets* panel, indicate that you want the ELB to be Internet accessible by placing a check in the boxes for the Public Subnets (10.20.10.0/24 and 10.20.15.0/24).
15. In the *Instance subnets* panel, place a check in the boxes for the two Private subnets (10.20.50.0/24 and 10.20.55.0/24). This will indicate that you want the EC2 instances to be launched in the Private subnet, behind the ELB. 
Make sure the Public IP address tick is off.




    ![Lab1 Vpc Config](../../images/lab1-vpc-config.PNG)

16. Click **Save**

#### Configure instances & security
17. Locate the **Security** configuration card, and click **Edit**
18. Under **Virtual Machine Permissions**, for **EC2 key pair** select the key pair called `devaxacademy` from the drop-down list.
19. Click **Save**
20. Locate the **Instances** configuration card, and click **Edit**
21. Under **EC2 security groups**,  select the one with DBSecurityGroup in the name.
22. Locate the **Capacity** configuration card, and click **Edit**
23. Under Instance type, select t3.medium, and click **Save**

#### Configure software 
24. Locate the **Software** configuration card, and click **Edit**
25. Scroll down to the **Environment properties** panel. Refer to the table below and add the specified **Name** from the **Property Name** column, and the **Value** from the **Property Value** column. Make sure you replace **<RDSInstanceAddress>** with the `RDSInstanceAddress` in the `JDBC_CONNECTION_STRING` property value. You retrieved this earlier from the CloudFormation stack output, and pasted it into a text editor. If you need to, you can go back to the CloudFormation console to retrieve the address again.

{{% notice note %}}
To get the next parameter created, start typing in the text box and it will enable you to add it. 
Make sure you put the full URL in for the RDSInstanceAddress, it will look something like  `X.X.ap-southeast-2.rds.amazonaws.com`
{{% /notice %}}

| **Property Name**  | **Property Value** |
---------------------------------|---------|
| <code>JDBC_CONNECTION_STRING</code> | <code>jdbc:mysql://\<RDSInstanceAddress\>:3306/travelbuddy?useSSL=false</code> |
| <code>JDBC_UID</code> | <code>root</code> |
| <code>JDBC_PWD</code> | <code>labpassword</code> |

26. Click **Save**

#### Create the ElasticBeanstalk Environment
You have now configured all the elements we need to modify for this part of the workshop. You will have noticed that there are a lot more configuration options we could have set! You should take some time to go back over this part of the workshop and investigate those options so you can become familiar with the setup options that are available to your applications when deploying on Amaozn ElasticBeanstalk.

27. Click **Create app**
28. Elastic Beanstalk will now proceed with creating the new Environment to run your TravelBuddy website. This will take a few minutes while an Elastic Load Balancer, EC2 instance, Launch configuration, Security Groups and more are created for you by AWS Elastic Beanstalk.

{{% notice note %}}
The AWS Console will show the Create Environment page and will show log events as the infrastructure is built automatically. It should only take a couple of minutes for the environment to be ready. When the deployment is complete, you will see the Elastic Beanstalk environment created and the application deployed.
{{% /notice %}}


Once the deployment is complete, click the Environment URL beside **URL** at the top of the page.  You will be taken to the TravelBuddy website hosted on Elastic Beanstalk, with flight and hotel specials coming from the MySQL database running on an RDS-hosted MySQL database. 

