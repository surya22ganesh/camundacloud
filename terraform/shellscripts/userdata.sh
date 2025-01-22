#!/bin/bash
sudo -i
apt-get update -y
apt-get install unzip -y

# Java
apt-get install openjdk-17-jdk openjdk-17-jre -y

#jenkins
sudo -i
sudo apt-get update -y
sudo apt-get install default-jdk -y
sudo apt-get install docker.io -y
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y

# Jenkins Port Change
# sudo sed -i 's/Environment="JENKINS_PORT=8080"/Environment="JENKINS_PORT=8088"/g' /lib/systemd/system/jenkins.service
# sudo systemctl daemon-reload
# sudo systemctl restart jenkins.service
# sudo systemctl start jenkins.service

# trivy
sudo apt-get update -y
sudo apt-get install -y wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update -y
sudo apt-get install trivy -y

# installing docker 
sudo apt-get install docker.io -y
sudo systemctl enable docker

# tree
sudo apt-get install tree -y

# maven
sudo apt-get install maven -y

# SonarQube

# cd /opt
# chmod 777 .
# wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-10.6.0.92116.zip?_gl=1*uyzwzb*_gcl_au*MjU4MTU5NTYwLjE3MjQ0MDg3NTE.*_ga*NTg3OTQ5NDIwLjE3MjQ0MDg3NTE.*_ga_9JZ0GZ5TC6*MTcyNTY4NzI0MC44LjAuMTcyNTY4NzI0MC42MC4wLjA.
# mv * sonarqube.zip
# unzip sonarqube.zip 
# rm sonarqube.zip
# mv * sonarqube
# cd /opt
# sudo chown -R ubuntu:ubuntu sonarqube/
# cd /sonarqube/bin/linux-x86-64
# # su ubuntu
# # sh sonar.sh start
# # sh sonar.sh status

# SONNAR SCANNER
# sudo -i
# cd /opt
# mkdir sonarscanner
# cd sonarscanner
# chmod 777 sonarscanner
# wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-6.1.0.4477-linux-x64.zip?_gl=1*mglqgf*_gcl_au*MjU4MTU5NTYwLjE3MjQ0MDg3NTE.*_ga*NTg3OTQ5NDIwLjE3MjQ0MDg3NTE.*_ga_9JZ0GZ5TC6*MTcyNTY4NzI0MC44LjEuMTcyNTY5MDEzOC42MC4wLjA.
# mv * sonarscanner.zip
# unzip sonarscanner.zip
# rm sonarscanner.zip
# mv * sonarscanner
