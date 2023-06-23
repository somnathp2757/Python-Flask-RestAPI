# Code pipeline for deployment on EC2 python project-

Prerequisites-
- appspec.yml file
- python app code

----------------------------------------------------------------------------------------------

### The basic steps are below:

- Prepare Python application and push it to GitHub
- Setup IAM role. We will need two IAM role. Role for EC2 and Code deploy. EC2 - role will require S3 and code deploy permission.
- Launch EC2 instance
- Create application in code deploy
- Setup code pipeline

---------------------------------------------------------------------------------------------------------

###  IAM Role setup
 two (2) IAM roles are needed . Role for EC2 and Code deploy. EC2 will need S3 and code deploy permission. Code Deploy role is already created by AWS.
EC2 role creation: First go to the IAM dashboard and move to create role section. I selected AWS service and EC2.
I added 2 permissions AmazonEC2RoleforAWSCodeDeploy and AmazonS3FullAccess.
Give that role a name. When deploying EC2 instances, it will be required.

CodeDeploy Role creation: For this, I just needed to select CodeDeploy from the service list.
AWS already configured permission for this service. I do not need to add any extra permission.
Give a name and create role.
IAM roles are ready.

--------------------------------------------------------------------------------------------

### Launch EC2 Instance setup -
- Attach the IAM role which was created in the second step
- And also need to add a tag. This tag will be used by CodeDeploy to find the EC2 instances to deploy the application.

- After the EC2 instance is fully running, install the CodeDeploy agent on ec2
And make sure the agent is running

-------------------------------------------------------------------------------------------

### Create application in code deploy
 now move to the CodeDeploy dashboard.
 - Create a application in code deploy give a name and select EC2/On-premises.

- Give a name to the deployment group. The role will be the IAM role for CodeDeploy I created in the second step.

- choose the tags for the EC2 instance where I want to deploy my application.

--------------------------------------------------------------------------------------------
### Setup code pipeline to deploy
- Now the final step. create a pipeline from the CodePipeline dashboard
NOTE - we skip the build stage as we are using python app we directly create a deployment

POC https://docs.google.com/document/d/1_Hv20RJdo00d3mQrSQGifdtof6Euzvms/edit?usp=sharing&ouid=103192517212555028114&rtpof=true&sd=true
