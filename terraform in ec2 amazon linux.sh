sudo su - #enter into root user
yum update -y 
#installing terraform

sudo yum install -y yum-utils shadow-utils

sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo 

yum update -y 

sudo yum -y install terraform

terraform --version
