CI/CD using AWS code pipeline Deployment on EKS cluster 

Some imp files to configure 
Buildspec.yml
Kubernetes deployment file
Iam policies and role
Config map

CI/CD Flow - 

Aws pipeline

Github /code commit ---> code build ---> deploy on kubernetes cluster

Steps-
1.Create ECR Repository for our Application Docker Images

Go to Services -> Elastic Container Registry -> Create Repository
Name: eks-devops-nginx
Tag Immutability: Enable
Scan On Push: Enable
Click on Create Repository
Make a note of Repository name

2.Create CodeCommit Repository
(or can use Github)

Create STS Assume IAM Role for CodeBuild to interact with AWS EKS

In an AWS CodePipeline, we are going to use AWS CodeBuild to deploy changes to our Kubernetes manifests.
This requires an AWS IAM role capable of interacting with the EKS cluster.
In this step, we are going to create an IAM role and add an inline policy EKS:Describe that we will use in the CodeBuild stage to interact with the EKS cluster via kubectl.

Use awscli to create policy -

# Set Trust Policy 

TRUST="{ \"Version\": \"2012-10-17\", \"Statement\": [ { \"Effect\": \"Allow\", \"Principal\": { \"AWS\": \"arn:aws:iam::${ACCOUNT_ID}:root\" }, \"Action\": \"sts:AssumeRole\" } ] }"

# Verify inside Trust policy, your account id got replacd 

echo $TRUST

# Create IAM Role for CodeBuild to Interact with EKS 

aws iam create-role --role-name EksCodeBuildKubectlRole --assume-role-policy-document "$TRUST" --output text --query 'Role.Arn'


 # Define Inline Policy with eks Describe permission in a file
iam-eks-describe-policy echo '{ "Version": "2012-10-17", "Statement": [ { "Effect": "Allow", "Action": "eks:Describe*", "Resource": "*" } ] }' > /tmp/iam-eks-describe-policy 

Cat /tmp/iam-eks-describe-policy



# Associate Inline Policy to our newly created IAM Role 

aws iam put-role-policy --role-name EksCodeBuildKubectlRole --policy-name eks-describe --policy-document file:///tmp/iam-eks-describe-policy

# Verify the same on Management Console
arn:aws:iam::468085339621:role/EksCodeBuildKubectlRole

Update EKS Cluster aws-auth ConfigMap with new role created in previous step
# Verify what is present in aws-auth configmap before change 

kubectl get configmap aws-auth -o yaml -n kube-system

# Set ROLE value 

ROLE=" - rolearn: arn:aws:iam::468085339621:role/EksCodeBuildKubectlRole\n username: build\n groups:\n - system:masters" 

# Get current aws-auth configMap data and attach new role info to it // or// edit manually 

kubectl get -n kube-system configmap/aws-auth -o yaml | awk "/mapRoles: \|/{print;print \"$ROLE\";next}1" > /tmp/aws-auth-patch.yml

//Or//

kubectl edit configmap aws-auth -o yaml -n kube-system

# Patch the aws-auth configmap with new role 

kubectl patch configmap/aws-auth -n kube-system --patch "$(cat /tmp/aws-auth-patch.yml)"

# Verify what is updated in aws-auth configmap after change 

kubectl get configmap aws-auth -o yaml -n kube-system





Review the buildspec.yml for Code Build & Environment Variables

AWS Code build configuration -

Update Code Build Role to have access
1.Ec2 container registery full access
2.S3 bucket access
3.Sts access

Create STS Assume Role Policy

Go to Services IAM -> Policies -> Create Policy
In Visual Editor Tab
Service: STS
Actions: Under Write - Select AssumeRole
Resources: Specific
Add ARN
Specify ARN for Role: arn:aws:iam::180789647333:role/EksCodeBuildKubectlRole
Click Add

# For Role ARN, replace your account id here, refer step-07 environment variable EKS_KUBECTL_ROLE_ARN for more details
arn:aws:iam::<your-account-id>:role/EksCodeBuildKubectlRole

Click on Review Policy
Name: eks-codebuild-sts-assume-role
Description: CodeBuild to interact with EKS cluster to perform changes
Click on Create Policy






6.Set Environment Variables for Code Build

REPOSITORY_URI = 180789647333.dkr.ecr.us-east-1.amazonaws.com/eks-devops

EKS_KUBECTL_ROLE_ARN = arn:aws:iam::180789647333:role/EksCodeBuildKubectlRole

EKS_CLUSTER_NAME = eksdemo1

