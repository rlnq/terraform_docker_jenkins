# Homework 9 - Task. Jenkins/-CI pipelines/Groovy - This terraform project automatically creates EC2 instance with Docker and Jenkins

### Task:
1. Setup Jenkins on server.
2. Create Multibranch pipeline and connect it with the Gitlab/Github project repository with the Jenkinsfile
3. Jenkinsfile should have several stages: build, tests, notification (telegram bot, etc.)
4. [Optional] Use branch conditions, vars, etc
5. [Optional] Create script for automated Jenkins setup (with a user, plugins).

--------------------------------------------------------

## This project automatically create EC2 instance on the Ubuntu 22.04 distribution in the eu-west-1 region by default, then install docker and build and run Jenkins container on port 8080 

### Requirements:
* AWS Free Tier account 
* Terraform
* AWS CLI

### Prerequisite:
* [Install Terraform](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform)
* [Install the latest version of the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* [Set the environment variables to configure the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html) - <code> aws configure </code>
* To clone a repository to your local machine, you'll need to have Git installed. If you don't already have it installed, you can download it from the official website - [Git download](https://git-scm.com/downloads)

## Part 1: Setup Jenkins on server

### Steps

* #### Clone this repository using command:

> `git clone https://github.com/rlnq/terraform_docker_jenkins.git`

* #### Go to the project folder: 

> `cd terraform_docker_jenkins`

* #### Generate Key pair (passphrase empty) using: 

> `ssh-keygen -f ssh-key`


* #### Initialize Terraform:

 > Type `terraform init` , and press Enter. This will download and install any necessary plugins for the providers specified in your configuration file.
 
* #### Preview your changes:

> Type `terraform plan`, and press Enter. This will show you a preview of the infrastructure that will be created based on your configuration file.

* #### Apply your changes:

> Type `terraform apply`, and press Enter. This will create the specified infrastructure.

* #### Wait a few minutes and go to your new Jenkins server: *`http://your_public_ip:8080`*

> Your public IP address will appear at the end of `terraform apply` or you can use the `terraform output` command

* #### Manage your infrastructure:

> To make changes to your infrastructure, modify your configuration file and then run `terraform apply` again.

> To destroy your infrastructure, type `terraform destroy`, and press Enter.

-----------------------------------------------------------------------------

## Part 2:
* Create Multibranch pipeline and connect it with the Gitlab/Github project repository with the Jenkinsfile
* Jenkinsfile should have several stages: build, tests, notification (telegram bot, etc.)

