# GitLab CI/CD  deployment on EC2 Python APP-

### prerequisites-

- gitlab account /server
- gitlab runner
- .gitlab-ci.yml file
- integration of gitlab runner with gitlab
- ec2 server (for deployment python app make sure pip is install in the server)

—-------------------------------------------------------------------------------------------------------

## Integration of EC2 server With Gitlab-

- make sure your gitlab-runner is running and configured
- Add variables in gitlab which we will use in .gitlab-ci.yml file
- configure the aws cli with runner

### add variables-

- Add pub IP address of ec2 as an variable in gitlab (EC2_IP)
- Add username as an variable in gitlab (ubuntu)
- Add private key as a variable in gitlab copy the content of pem file (EC2_pvt_key)
------------------------------------------------------------------------------------------------------------

  POC CICD https://docs.google.com/document/d/18QxZdnSdbGB7UqBUcmuOThWKF_W18p18/edit?usp=sharing&ouid=103192517212555028114&rtpof=true&sd=true
  
  POC Gitlab COnfiguration https://docs.google.com/document/d/1cDscvIwVM7Qke2blecbpUoVze5_DXsVJ/edit?usp=drive_link&ouid=103192517212555028114&rtpof=true&sd=true
