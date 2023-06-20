# python-flask-restapi


Prerequsites-
- eks cluster
- Gitlab Account
- python project
- Gitlab-Runner (
            install docker,configure kubectl,configure aws cli in Gitlab-runner)
- .gitlab-ci.yml file 
- Docker file
- Kubernetes manifest file

-----------------------------------------------------------------------------------------------------
## Import the project from github to gitlab

- Step-1 Enable the import option from GitHub through GitLab console

1.On the top bar, select Main menu > Admin.
2.On the left sidebar, select Settings > General.
3.Expand Visibility and access controls.
4.Scroll to Import sources.
5.Select the GitLab export checkbox.

- Step-2 create a New Project and choose Import project Option 
- Step-3 Create a PAT token from GitHub and proved token in gitlab
- Step-4 Select the req repo to import from GitHub
- Step-5 Imported
------------------------------------------------------------------------------------------------------
## Gitlab-Runner setup
- Step-1 Create a GitLab Runner instance for cicd of project

Install the Gitlab runner on EC2 instance 


- Step-2 Register git-lab runner with git-lab

$gitlab-runner register

Provide the url and token details from Gitlab and choose the requried executor option Shell  to run command 

On Gitlab
go to settings -> cicd -> Runner -> Add new project runner with respective tags


- Step-3 Install the Req software in Gitlab runner instance for building the project (pip for python project)

$sudo apt update

$sudo apt install python3-pip

$pip3 --version

- Step-4 Create a .gitlab-ci.yml file for building the python file

.gitlab-ci.yml

-----------------------------------------------------------------------------------------------------------
note 
War file will store on Gitlab-runner instance

------------------------------------------------------------------------------------------------------------------------------------------------------
### Building Docker Image -

#### Install Docker on Gitlab Runner instance

Give the req permission to docker
$sudo chmod 666 /var/run/docker.sock

ADD the build script in 
Gitlab-ci.yml file

- Pushing Docker Image to dockerhub-

First add the docker username and password as an environment variables and pass it in script



- Pushing Docker Image to AWS ECR REPO-
   
1st Install AWS CLI on Gitlab-Runner Instance
2nd Create a ECR Access role and attach the role to Gitlab-runner instance



- Pushing Docker Image into GitLab Repository-

1st Create a PAT token in Gitlab
2nd Make a variable of that token in cicd gitlab and pass it on script


----------------------------------------------------------------------------------------------------------------------------------------------------

## Integration of EKS with GitLab-

- Install Kubectl on gitlab-Runner server on gitlab-runner user 
- Configure awscli ( create a Iam user for gitlab and give the req access to eks and configure the awscli in gitlab-runner)
- Get the kube config file in the gitlab-runner server
  $aws eks update-kubeconfig --region region-code --name my-cluster
- update the script


POC python APP deployment doc
https://docs.google.com/document/d/1vmT7aOrT0NbBbp4eDskAxg4q_NEOmqpG/edit?usp=sharing&ouid=103192517212555028114&rtpof=true&sd=true

Detailed POC configuration of Gitlab and Gitlab setups
https://docs.google.com/document/d/1cDscvIwVM7Qke2blecbpUoVze5_DXsVJ/edit?usp=sharing&ouid=103192517212555028114&rtpof=true&sd=true

POC DOC for CICD GitLab
https://docs.google.com/document/d/1jGDqDN5gEOxCG44p2-V7LiCvYB84ImRv/edit?usp=drive_link&ouid=103192517212555028114&rtpof=true&sd=true

