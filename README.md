# Jenkins CICD Deployment of python app on ECS-

### Prerequisites-
- dockerfile 
- ECS cluster
- Jenkins server with AWS CLI configure , docker
- Jenkins user (programmatic access)
- EKS repo
- Jenkins file
- python code
---------------------------------------------------------------------------------------------------------
### Create a ECS CLUSTER 

To create a cluster (AWS Management Console)

- Open the Amazon ECS classic console at https://console.aws.amazon.com/ecs/.
- From the navigation bar, select the Region to use.
- In the navigation pane, choose Clusters.
- On the Clusters page, choose Create Cluster.
- For Select cluster compatibility, choose Networking only, then choose Next Step.

### Important

The FARGATE and FARGATE_SPOT capacity providers will be automatically associated with the cluster. For more information, see AWS Fargate capacity providers.

- On the Configure cluster page, enter a Cluster name. Up to 255 letters (uppercase and lowercase), numbers, hyphens, and underscores are allowed.


- In the Networking section, configure the VPC for your cluster. You can keep the default settings, or you can modify these settings with the following steps.

- (Optional) If you choose to create a new VPC, for CIDR Block, select a CIDR block for your VPC. For more information, see Your VPC and Subnets in the Amazon VPC User Guide.

- For Subnets, select the subnets to use for your VPC. You can keep the default settings or you can modify them to meet your needs
- In the CloudWatch Container Insights section, choose whether to turn on Container Insights for the cluster. For more information, see Amazon ECS CloudWatch Container Insights.
- Choose Create.
---------------------------------------------------------------------------------------------------------
### Create a Task Defination


- In the navigation pane, choose Task definitions
- Choose Create new task definition, Create new task definition.
- For Task definition family, specify a unique name for the task definition.
- For each container to define in your task definition, complete the following 
A. Name 
B.IMAGE URI
C.Container Port
D.Environment variable if any
E.App Environment FARGATE or EC2
F.TASK SIZE / Container size
G.Log Collection

--------------------------------------------------------------------------------------------------------
### Create a service


- In the navigation page, choose Clusters.
- On the Clusters page, select the cluster to create the service in.
- From the Services tab, choose Create.
- Under Deployment configuration, specify how your application is deployed.
- For Application type, choose Service.
- For Task definition, choose the task definition family and revision to use.
- For Service name, enter a name for your service.
- For Desired tasks, enter the number of tasks to launch and maintain in the service.
- (Optional) To help identify your service and tasks, expand the Tags section, and then configure your tags.

- To have Amazon ECS automatically tag all newly launched tasks with the cluster name and the task definition tags, select Turn on Amazon ECS managed tags, and then select Task definitions.
- To have Amazon ECS automatically tag all newly launched tasks with the cluster name and the service tags, select Turn on Amazon ECS managed tags, and then select Service.
- Add or remove a tag.


---------------------------------------------------------------------------------------------------------

### Integration of Jenkins With ECS cluster


1.Install  AWS cli in Jenkins server
2.Create a Jenkins Users in AWS and give programmatic access
3.AWS configure access key and secret key 
4.Make sure Jenkins user have ECS Cluster access 

Refer AWS ecs doc for AWS command to update ecs cluster 

Command to use in Jenkins script to update ECS service

$        sh " AWS ecs update-service --cluster ecs-python --service pyhton-app --force-new-deployment"


Now u can access ECS cluster from Jenkins server

--------------------------------------------------------------------

Jenkins script
Docker file

--------------------------------------------------------------------
POC https://docs.google.com/document/d/1gwDNYzfEbp_3s8y-fSy3sZbGCPWzYdyV/edit?usp=sharing&ouid=103192517212555028114&rtpof=true&sd=true
