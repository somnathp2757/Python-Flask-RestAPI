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

POC https://docs.google.com/document/d/14M2iJzJMBB3ur_TkdUnShKCgOeUiNVp5/edit?usp=sharing&ouid=103192517212555028114&rtpof=true&sd=true
