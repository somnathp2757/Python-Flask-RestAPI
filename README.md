# CI/CD Jenkins pipeline for deployment  of  Python project on EKS-

### Prerequisites-
- dockerfile 
- eks cluster
- Jenkins server with AWS CLI configure , kubectl, docker
- Jenkins user (programmatic access)
- EKS repo
- K8s manifest file
- Jenkins file
- python code

---------------------------------------------------------------------------------------------------------
### Create a eks cluster - 

AWS Account With Admin Privileges. 
• Instance to manage/access EKS cluster using kubectl 
• AWS CLI access to use kubectl utility. 

### Step By Step Procedure Using AWS Console 

1.  Create Dedicated VPC For EKS Cluster. When you create a cluster, the VPC that you specify must meet the following requirements and considerations: 
• The VPC must have a sufficient number of IP addresses available for the cluster, any nodes, and other Kubernetes resources that you want to create 
• The VPC must have DNS hostname and DNS resolution support. Otherwise, nodes can't register to your cluster. 
• This VPC has two public and two private subnets. One public and one private subnet are deployed to the same Availability Zone. The other public and private 
subnets are deployed to a second Availability Zone in the same AWS Region. We recommend this option for most deployments. 
• With this option, you can deploy your nodes to private subnets. This option allows Kubernetes to deploy load balancers to the public subnets that can load balance 
traffic to pods that run on nodes in the private subnets. Public IPv4 addresses are automatically assigned to nodes that are deployed to public subnets, but public IPv4 addresses aren't assigned to nodes deployed to private subnets. 

2. Create IAM Role For EKS Cluster. 
•  EKS – Cluster 

3. Create EKS Cluster. 

4. Create IAM Role For EKS Worker Nodes. 
• AmazonEKSWorkerNodePolicy 
• AmazonEKS_CNI_Policy 
• AmazonEC2ContainerRegistryReadOnly 
• AmazonEBSCSIDriverPolicy 

5.Create Worker Nodes group

### How to access EKS cluster- 

Create a separate k8s client server to access EKS

6.Create An Instance (If Not Exists) Install AWS CLI , IAM Authenticator And kubectl. Configure AWS CLI using Root or IAM User Access Key & Secret Key. Or Attach IAM With Required Policies. And get kubeconfig file. 
Note - make sure you are accessing the cluster from same user for the first time

$ aws eks update-kubeconfig --name <ClusterName> --region <RegionName> 

7. Deploy AWSEBSSCSI Driver Plugin. (optional)
kubectl apply -k “github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.12” 

8. Deploy Sample Application. 
----------------------------------------------------------------------------------------------------------------------



### Jenkins and configuration in Jenkins server  -
- Install Jenkins -

   $    sudo systemctl enable Jenkins
    $   sudo systemctl start Jenkins
    $   sudo systemctl status Jenkins

- Install Docker -

$ Add Jenkins user to docker group
$  Sudo usermod -aG docker Jenkins

$  Restart Jenkins server
$ Sudo systemctl restart Jenkins                 
             
- install Aws cli (for configuration of k8s)
-  install kubectl (for configuration of k8s)
--------------------------------------------------------------------------------------------

### Integration for Jenkins With EKS cluster


- Install kubectl and Aws cli in Jenkins server
- Create a Jenkins Users in AWS and give programatic access
- Aws configure access key and secret key 
- Get the .kube/config file in Jenkins server

$ aws eks update-kubeconfig --name <ClusterName> --region <RegionName> 

- Now go to the master kubernetes client server
     
 Edit the aws-auth file - 

$ kubectl edit cm aws-auth -n kube-system

- mapUsers  
Add the Jenkins username and userarn in file

- Give the required access to Jenkins user in RBAC cluster role and role binding


Now u can access eks cluster from Jenkins server

--------------------------------------------------------------------------------------------------------------------

Jenkins script
Kubernetes manifest file
Docker file


POC https://docs.google.com/document/d/1be2WUPs3cYbwHnXt6QsEiEVuJCpw-Qwl/edit?usp=sharing&ouid=103192517212555028114&rtpof=true&sd=true
