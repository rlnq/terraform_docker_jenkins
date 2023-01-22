# Homework 9 - Task. Jenkins/-CI pipelines/Groovy
# This Terraform project automatically creates EC2 instance with Docker and Jenkins

### Task:
1. Setup Jenkins on server.
2. Create Multibranch pipeline and connect it with the Gitlab/Github project repository with the Jenkinsfile
3. Jenkinsfile should have several stages: build, tests, notification (telegram bot, etc.)
4. [Optional] Use branch conditions, vars, etc
5. [Optional] Create script for automated Jenkins setup (with a user, plugins).

--------------------------------------------------------

## This project automatically creates an EC2 instance on the Ubuntu 22.04 distribution in the eu-west-1 region, then installs docker, builds and runs the Jenkins container on port 8080 

### Requirements:
* AWS Free Tier account 

### Prerequisite:
* [Install Terraform](https://developer.hashicorp.com/terraform/downloads?product_intent=terraform)
* [Install the latest version of the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* [Set the environment variables to configure the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html) - <code> aws configure </code>
* To clone a repository to your local machine, you'll need to have Git installed. If you don't already have it installed, you can download it from the official website - [Git download](https://git-scm.com/downloads)

# Part 1: 
* Setup Jenkins on server
* [Optional] Create script for automated Jenkins setup (with a user, plugins).

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

* #### Manage your infrastructure:

> To make changes to your infrastructure, modify your configuration file and then run `terraform apply` again.

> To destroy your infrastructure, type `terraform destroy`, and press Enter.

> Your public IP address will appear at the end of `terraform apply` or you can use the `terraform output` command

* #### Wait a few minutes and go to your new Jenkins server: *`http://your_public_ip:8080`*

* #### Our [groovy-script](https://github.com/rlnq/docker-jenkins/blob/main/jenkins-home/init.groovy.d/startup.groovy) will create a user with default credentials ("jenkins-user","jenkins1234"). You can change the user credentials in Manage Jenkins on your server or download this repository and change the credentials ( also u need to change repo in [user_data.sh](https://github.com/rlnq/terraform_docker_jenkins/blob/main/user_data.sh) )

When we first log into our Jenkins server, we will see an authorization page.

![image](https://user-images.githubusercontent.com/117667360/213868683-1a5f4fc3-9a99-49eb-af33-404be77cd657.png)

Then your must enter your credentials and install the suggested plugins and after that your Jenkins will be ready!

-----------------------------------------------------------------------------

# Part 2:
* Create Multibranch pipeline and connect it with the Gitlab/Github project repository with the Jenkinsfile
* Jenkinsfile should have several stages: build, tests, notification (telegram bot, etc.)
* [Optional] Use branch conditions, vars, etc

#### My simple [Jenkinsfile](https://github.com/rlnq/terraform_docker_jenkins/blob/main/Jenkinsfile) with conditions and vars 

#### My pipeline branches: 

![image](https://user-images.githubusercontent.com/117667360/213890494-4f3ae25b-3a9b-444b-8146-24c812e5fed3.png)

#### The first stage - Build. I used Jenkins variables in this stage:

![image](https://user-images.githubusercontent.com/117667360/213890566-d21987fd-2901-4b14-9cd5-d6146fccd2a0.png)

#### The second stage - Test:

![image](https://user-images.githubusercontent.com/117667360/213890626-945a5323-8999-4e47-826d-bdc9f2dc1643.png)

#### I used the 'env.BRANCH_NAME' variable to get the name of the current branch and the 'when' clause to define the condition for that stage.
#### In our examples, we've skipped the "Stage only for test branch" because the current branch being compiled is not a test branch.
#### At the last stage "Push notification" we receive a Telegram notifications:

![image](https://user-images.githubusercontent.com/117667360/213890694-c44ef58f-6177-4132-880c-2c0504273c7c.png)

### In the Telegram bot:

<img width="460" alt="Screenshot 2023-01-22 at 23 31 04" src="https://user-images.githubusercontent.com/117667360/213941521-04e08ea0-7edb-40b9-8a0b-156454b3eac7.png">

My Github WebHooks

![image](https://user-images.githubusercontent.com/117667360/213942284-889d2d02-35a7-45f7-94cc-ee1a00821649.png)
