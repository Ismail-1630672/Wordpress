# Wordpress

I will be deploying wordpress onto AWS with a relational database (RDS) using terraform as infrastructure as code (Iac) and Docker

Wordpress will be deployed onto AWS EC2 (Elastic Compute Cloud)

# why EC2 ?

EC2 is one of AWS's services where we can run applications such as wordpress and also host databases

# Why wordpress ?

Wordpress is a tool used to publish websites, its written in PHP paired with a MySQL database

# Why RDS ?

RDS is also an AWS service, it is used as wordpress requires a database to store data on a backend.

# Why Terraform ?

Terraform will be used as a infrastructure as code tool, with terraform we will be able to define, provision and manage infrastructure resources on AWS 

# Why Docker ?

Docker will be used to develop, deploy and manage applications in lightweight containers, we will be deploying the wordpress application using docker.

# Tasks to be performed:

Task-1: Create a terraform script to deploy a virtual machine in a public subnet and a relational database in a private subnet.
Task-2: Create a dockerfile to deploy wordpress with apache web server and php in the same virtual machine.
Task-3: Build the docker image, tag it and push to docker hub.
Task-4: Connect wordpress container with RDS database.

