#!/bin/bash

# Install Docker
sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# Clone repo and start Jenkins image
cd /home/ubuntu
git clone https://github.com/rlnq/docker-jenkins.git

cd docker-jenkins
sudo docker build -t 'jenkins-with-docker' .
sudo docker run -d -p 8080:8080 --name "jenkins-with-docker" -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker jenkins-with-docker
