# Jenkins CICD Deployment of Python app on EC2-

### Prerequisites-
- EC2 Instance 
- Jenkins server ( install SSH AGENT plugin)
- Python code
- jenkinsfile

----------------------------------------------------------------------------------------------------------

## Intigration of EC2 with Jenkins-

- Install SSH AGENT plugin in Jenkins server
- go to Global Credentials and add Credentials for EC2 instance for ssh 
- create SSH username and Private key and add the contain of Pem file.
- generate the script using pipeline syntax generator 



----------------------------------------------------------------------------------------------------------

- In the Jenkins script you can use “rsync” or “scp” command to copy the python code to remote ec2 server
