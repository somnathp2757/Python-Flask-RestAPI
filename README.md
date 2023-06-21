# GitLab CI/CD deployment of python app in ECS-

### Prerequisite-
- ECS cluster
- Task Defination
- GitLab account
- .gitlab-ci.yml file
- python application
- IAM user with programmatic access to access the ECS Cluster

----------------------------------------------------------------------------------------------------------
- Step-1 Create a GitLab Runner instance for cicd of project

Install the Gitlab runner on EC2 instance 

- Step-2 Register gitlab-runner with git-lab

- Step-3 Install the Req software in Gitlab runner instance for building the project (pip for python)

- Step-4 Create a .gitlab-ci.yml file for building the python project

----------------------------------------------------------------------------------------------------------
### Building Docker Image-

- Step-1 Install Docker on Gitlab Runner instance

Give the req permission to docker
$ sudo chmod 666 /var/run/docker.sock

ADD the build script in 
Gitlab-ci.yml file

Pushing Docker Image to AWS ECR REPO

1.Install AWS CLI on Gitlab-Runner Instance

2.Create a ECR Access role and attach the role to Gitlab-runner instance
Use in the script



------------------------------------------------------------------------------------------------------

 ### Integration of  ECS With Gitlab CI/CD

Note: You will need your role to be either Maintainer or Owner
Go to settings -> CI/CD and then click on variables.

Add these variables AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY and AWS_DEFAULT_REGION. As a best practice AWS_ACCESS_KEY_ID & AWS_SECRET_ACCESS_KEY should only give programmatic access.


----------
POC https://docs.google.com/document/d/1zQLnovB6ms1Gb4Pos0XmaopAqz2ylj2h/edit?usp=sharing&ouid=103192517212555028114&rtpof=true&sd=true
