#!/bin/bash
sudo apt-get update
sudo apt-get install -y docker.io
sudo systemctl start docker
usermod -a -G docker ccseyhan     #change here with your username
systemctl enable docker
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
git clone https://github.com/ccseyhan/wordpress_deployment_terraform.git 
docker-compose -f /wordpress_deployment_terraform/docker-compose.yaml up --build -d


