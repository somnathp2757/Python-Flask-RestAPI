# CODE PIPELINE for deployment of python app on ECS-

### Prirequisites-

- ECS cluster
- Task Defination
- ECS service
- python app code
- ECR repository
- Dockerfile
- buildspec.yml file

------------------------------------------------------------------------------------------------

- ### Step -1 Go to AWS code pipeline create a pipeline

- ### Step -2 Select source provider -
  
choose the source location where the code is stored. This could be AWS CodeCommit, GitHub, or Amazon S3. For this example, enter AWS CodeCommit, select Repository name and select branch

- ### Step -3 Change detection options- 

using AWS cloud-watch( its will automatically detect the change in code and trigger pipeline)


Aws codepipeline (periodically checks for changes)


- ### Step-4 Build provider- 
Tools to build the projects
1 code build
2 jenkins



- ### Step-5 Build project -
Projects config- (projects name)
Environment- (environment image, os, runtime, image)
Privileged - (enable build docker image)
Service role- (to attach the policy like ECR access, s3 access)
Build spec file
Logs (cloudwatch)

- ### Step-6
 attach the EC2 container full access policy to role which is created by aws code pipeline

----------------------------------------------------------------------------------------------------------

- ### Step-7 
Code Deploy on amazon ECS
Note: make sure your ECS cluster is already running and service and  task defination is already created 

### Add a deployment. Choose AWS ECS. This is the infrastructure where your code will be deployed.

Note: image definition JSON file is needed for CodeBuild to deploy to ECS. Your buildspec.yaml file used for step 2 should include image definition instructions
NOte: make sure the name u mention in buildspec.yml is matchs with container name
