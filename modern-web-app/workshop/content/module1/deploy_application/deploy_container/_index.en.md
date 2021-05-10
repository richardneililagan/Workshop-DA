---
title: "ECR, ECS, Docker and Fargate"
weight: 1
pre: "<b>Containers path: </b> "
hidden: true
---


In this lab the following will be actioned.

Create a local docker environment to test locally the Tomcat and install the WAR file.
Create a local docker environment to test locally the MySQL database and seed the database.
Docker compose (setting up multiple docker containers) to test both these components together.
Create an ECR registry
Create a DockerFile and create a image
Push the Docker image to the registry
Create a ECS fargate cluster
Run a task with the registry image

### Cloud9
For this component, we will be setting up and using Cloud9 service instead of windows.
Go to the AWS Console and type in cloud9. Make sure that your region is the required region you are working from. 

In our example we will be setting all this in ap-southeast-2
Click create an environment. 

![cloud9](../images/cloud9.png)

Enter your name and click Next step.

Increase the size of the filesystem to 100G. 

Leave everything as default in configure settings and click next. 

Click create environment. 

### Cloud9 configuration for java

Install all the required components to run the docker setup. Open a terminal in cloud9 and run the following:
We now need to setup the required JAVA version to be 1.8 and change the required parameters on the IDE. 

To install the java version see website here: []()

``` bash
sudo yum install -y java-1.8.0-openjdk-devel
sudo alternatives --config java #enter 1.8 version
sudo alternatives --config javac #enter 1.8 version
sudo yum remove -y java-1.7.0-openjdk-devel
```

### Install the SAM cli
``` bash
pip install awscli --upgrade --user
pip install --upgrade aws-sam-cli --user
```

### Install maven
``` bash
sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven
```

### Install docker-compoose
```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
docker --version
```

### Create docker-compose file and test
1. Build the travelbuddy war file

```bash
curl http://workshops.devax.academy/monoliths-to-microservices/en/module1/files/TravelBuddy.zip --output TravelBuddy.zip
unzip TravelBuddy.zip
cd TravelBuddy
mvn package
```

There will now be a target/travelbuddy.war file you will be consuming.

Go to the base directory. 
```bash 
cd ~/environment
```

2. Get the database seed file for the docker database image
```bash
curl http://workshops.devax.academy/monoliths-to-microservices/en/module1/files/DB.sql --output DB.sql
```

3. Create local docker-compose to test the applications work.

Copy the war file to be consumed by the tomcat docker container. 
```bash
mkdir -p .TravelBuddy/target
cp TravelBuddy/target/travelbuddy.war .TravelBuddy/target/
```

These are the files you will be consuming for the compose file below.
Create the following file - docker-compose.yaml
```yaml
version: '3.7'

services:
  # App backend service
  app:
    image: tomcat:jdk8-openjdk
    build: ./
    environment:
      JDBC_CONNECTION_STRING: "jdbc:mysql://database:3306/travelbuddy?useSSL=false&autoReconnect=true"
      JDBC_UID: "user1"
      JDBC_PWD: "labpassword"
     # JAVA_OPTS: "-DJDBC_UID=user1 -DJDBC_PWD=labpassword -DJDBC_CONNECTION_STRING='jdbc:mysql://database:3306/travelbuddy'"
    ports:
      - "8080:8080"
    depends_on:
      - database
    links:
      - database
    volumes:
      - ./TravelBuddy/target/travelbuddy.war:/usr/local/tomcat/webapps/travelbuddy.war
    command: ["catalina.sh", "run"]

  database:
    container_name: database
    image: mysql:5.7.31
    command: --default-authentication-plugin=mysql_native_password
    environment:
      MYSQL_ROOT_PASSWORD: "labpassword123"
      MYSQL_DATABASE: "travelbuddy"
      MYSQL_ROOT_HOST: '%'
      MYSQL_USER: "user1"
      MYSQL_PASSWORD: "labpassword"
    healthcheck:
      test: ["CMD", "mysqladmin" ,"ping", "-h", "localhost"]
      timeout: 20s
      retries: 10
    ports:
      - "3306:3306"
    volumes:
      - ./DB.sql:/docker-entrypoint-initdb.d/0_init.sql
    tty: true
```

4. Create Dockerfile
edit Dockerfile
```Dockerfile
# we will use openjdk 8 with alpine as it is a very small linux distro
FROM tomcat:jdk8-openjdk
# copy the packaged jar file into our docker image
COPY TravelBuddy/target/travelbuddy.war /usr/local/tomcat/webapps/travelbuddy.war
RUN sed -i 's/port="8080"/port="80"/' /usr/local/tomcat/conf/server.xml
# set the startup command to execute the jar
CMD catalina.sh run
```

5. Test locally
```bash
docker-compose up
# open a new terminal
docker ps 
CONTAINER ID        IMAGE                 COMMAND                  CREATED             STATUS                    PORTS                               NAMES
833148e49dcf        tomcat:jdk8-openjdk   "catalina.sh run"        48 seconds ago      Up 47 seconds             0.0.0.0:8080->8080/tcp              environment_app_1_b49c299f3707
499630c62748        mysql:5.7.31          "docker-entrypoint.s…"   49 seconds ago      Up 48 seconds (healthy)   0.0.0.0:3306->3306/tcp, 33060/tcp   database
```

These are both up and running for MYSQL and TOMCAT, in the same way you did it with your local environment. 

6. Test the mysql database.
```bash
docker exec -it database /bin/bash
# note the name of the docker container you want to ssh into, in this case it is called database
mysql -u root --password=labpassword -p
# enter the root password her

mysql> use travelbuddy
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> list tables;
mysql> show tables;
+-----------------------+
| Tables_in_travelbuddy |
+-----------------------+
| flightspecial         |
| hotelspecial          |
+-----------------------+
2 rows in set (0.00 sec)
```

7. Test the travelbuddy app
In cloud9 under the Preview tab, it will open a new window which will show a 404. 

Change the URL endpoint to have /travelbuddy at the end

![cloud9 image with docker running](../images/cloud9preview.png)

### Create ECR elastic container registry on the console

8. In the AWS console go to the ECR page.

9. In the repository name type in travelbuddy, leave the rest as default. Create repository.

![ecr registry](../images/ecr.png)

10. click on the radio button and click view push commands to be entered in the cloud9 setup. 

Use your account details to be replaced with <ACCOUNT> run the below to create your docker image and push it over to the ECR service. 
```bash
aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin <ACCOUNT>.dkr.ecr.ap-southeast-2.amazonaws.com
docker build -t travelbuddy .
docker tag travelbuddy:latest <ACCOUNT>.dkr.ecr.ap-southeast-2.amazonaws.com/travelbuddy:latest
docker push <ACCOUNT>.dkr.ecr.ap-southeast-2.amazonaws.com/travelbuddy:latest

```
Any issues, remember that you need to be in the directory where the Dockerfile is located.

What you have just completed:
Setup your login to speak to the ECR travelbuddy registry.
Build and tagged your docker image
Tagged the travelbuddy docker image to latest
Pushed the image over to your ECR. 

11. In the AWS console click travelbuddy

![docker uploaded](../images/dockeruploadedecr.png)

Congratulations ! you have uploaded your first Docker image to ECR. 

### Create ECS elastic container service on the console

12. Create a ELB for use in the ECS cluster.
In order to make the application resilient, even though we are doing a lift and migrate to cloud, we need to make sure it is setup in a application load balancer which will be used when we come to create the ECS fargate cluster. 

In the AWS console go to the EC2 service.
On the sidebar, Under Load Balancer choose the load balancers option.

Click the Create Load Balancer.

Choose the application Load balancer and click create.

- Name: travelbuddy
- Scheme: Internet-facing
- IP: ipv4

Under the listeners choose 
- Protocol: HTTP
- Port: 80

Under availability zones, choose the the lab VPC and both the Public availability zones

![vpc loadbalancer](../images/vpcazsetup.png)

- Next: Configure Security Settings
- Next: Configure Security Groups

Click on create a new security group
- Choose a name or leave with the wizard name.
- Leave all the rest default
![sec group](../images/secgrouplb.png)

- Next: Configure routing
- Type in Name: travelbuddy
- Target Type: IP
- Next: Register Targets
![routing](../images/routinglb.png)

Click next

![tg](../images/tglb.png)

- Click next
- Click Create

![created](../images/createlb.png)

Once it has created, have a look in the description at the DNS name that has just been created, this will be the URL you will be using for your application. 




13. On the AWS console we will create ECS fargate 
- Click on ECS, and create cluster.

14. Choose the networking only, powered by Fargate.
![fargate](../images/fargate.png)

Next step
15. Choose name travelbuddy 
![fargatename](../images/fargatename.png)
and click create (do not tick create VPC as we will be using the LAB one already built)

16. Click view cluster.
![fargatenext](../images/fargateview.png)

17. Create a task definitions
![task creation](../images/taskcreate.png)
- Click on Task Definitions on the menu, 
- click ```Create Task Definition```
- Choose the fargate which will manage the instances

![task fargate](../images/taskfargate.png)
- Click next

18. Configure task and container definitions

Enter the following:

| **NAME** | **Value**|
---------------------------------|---------|
|<code>Task Definition Name</code> | <code>travelbuddytask</code>|
|<code>Task Role</code>|<code>ecsTaskExecutionRole</code>|
|<code>Task execution role</code>| <code>ecsTaslExecutionRole</code>|
|<code>Task size</code>| <code>2GB</code>|
|<code>Task CPU</code>| <code>1 vCPU</code>|

Get the image information from your recently uploaded docker image

Click on ```Add container```

| **NAME** | **Value**|
---------------------------------|---------|
|<code>Container name</code> | <code>travelbuddy</code>|
|<code>Image</code> | <code><REPOSITORY-URL/image:tag> e.g. 3XXXXXX.dkr.ecr.ap-southeast-2.amazonaws.com/travelbuddy:latest</code>|
|<code>Soft limit</code> | <code>1024</code>|
|<code>Port Mappings</code> | <code> 80 tcp</code>|

In the environment varialbles, it will read these from the container when it starts up, get the Database URL that is provided in your account. 
Environment variables : add three variables below: 

| **Key**  | **Value** |
---------------------------------|---------|
| <code>JDBC_CONNECTION_STRING</code> | <code>jdbc:mysql://\<RDSInstanceAddress\>:3306/travelbuddy?useSSL=false&autoReconnect=true&allowPublicKeyRetrieval=true</code> |
| <code>JDBC_UID</code> | <code>root</code> |
| <code>JDBC_PWD</code> | <code>labpassword</code> |

![fargate](../images/containervariables.png)

![container](../images/container2.png)

Click create

![container2](../images/container3.png)

Click view definitions and review what was created.

19. Create a service

Click Clusters on the menu

Choose the travelbuddy cluster

On the services tab, click create

Fill in the following: 

| **NAME** | **Value**|
---------------------------------|---------|
|<code>Launch type</code> | <code>FARGATE</code>|
|<code>Task Definition Family</code> | <code>travelbuddytask</code>|
|<code>Platform version</code> | <code>LATEST</code>|
|<code>Cluster</code> | <code>travelbuddy</code>|
|<code>Service name</code> | <code>travelbuddyservice</code>|
|<code>Number of tasks</code> | <code> 1</code>|

Leave the rest default and click next
![fargateservice](../images/fargateservice.png)

20. Fill in the network configuration.
- Cluster VPC : Choose the lab vpc
- Subnets : choose both Public subnets.
- Edit the security group and confirm port 80 is opened
- Keep auto-assign Public IP to ENABLED

21. Add the load balancer details for the cluster
Set the following: 

| **NAME** | **Value**|
---------------------------------|---------|
|<code>Load balancer type</code> | <code>Application Load Balancer</code>|
|<code>Load balancer name </code> | <code>travelbuddy</code>|
|<code>Container to load balance</code>| <code>travelbuddy</code>|



![lbecs.png](../images/lbecs.png)

- Port - choose the travelbuddy:80:80 and add to load balancer.

![lbecs2.png](../images/lbecs2.png)

| **NAME** | **Value**|
---------------------------------|---------|
|Production listener port| <code> 80:HTTP</code>|
target froup name </code> | <code>travelbuddy:80:80</code>


Leave the rest as default and click Next 
![fargatenetwork](../images/fargateservicenetwork.png)

22. Fill in autoscaling, leave ```Do not adjust the service’s desired count```
Click Next Step

23. Review and create the service.

24. Click view service
25. Get the ALB DNS name you had from creating the ALB to test the application
26. In a browser, add the travelbuddy endpoint to the url - http://```<PUBLIC-ALB-DNS-NAME>```/travelbuddy/

You now have a container service running a task which is running tomcat with travelbuddy application talking to the RDS service.

![end](../images/fargateend.png)

