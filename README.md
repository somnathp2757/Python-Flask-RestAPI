# python-flask-restapi


Prerequsites-
- eks cluster
- Gitlab Account
- python project
- Gitlab-Runner (
            install docker,configure kubectl,configure aws cli in Gitlab-runner)
- .gitlab-ci.yml file 

------------------------------------------------------------------------------------------------------

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

Integration of EKS with GitLab-

1.Install Kubectl on gitlab-Runner server on gitlab-runner user
2.Configure awscli 
3.Get the kube config file in the gitlab-runner server
4 update the script
