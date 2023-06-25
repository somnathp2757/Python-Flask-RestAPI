node{
     
    
    stage('SCM Checkout GitHub'){
        git branch: 'jenkins-eks-python', credentialsId: 'github', url: 'https://github.com/00farhan00/Python-Flask-RestAPI.git'
    }
    
    stage('Build Docker Image'){
        sh "docker build -t 468085339621.dkr.ecr.ap-south-1.amazonaws.com/python-app:${BUILD_NUMBER} ."
    }
    
    stage('Login and Push Docker Image to ECR'){
        sh "aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 468085339621.dkr.ecr.ap-south-1.amazonaws.com"
        sh 'docker push 468085339621.dkr.ecr.ap-south-1.amazonaws.com/python-app:${BUILD_NUMBER}'
     }
    stage('deploy/ update on ecs service'){
       sh " aws ecs update-service --cluster ecs-python --service pyhton-app --force-new-deployment"
    }
    
     
}
