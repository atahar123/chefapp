#!/bin/bash

sudo apt-get update -y

sudo apt-get upgrade -y

# java
sudo apt-get install openjdk-8-jdk openjdk-8-jre -y

# env variables
cd /etc
sudo chmod 777 environment
cat >> /etc/environment <<EOL
JAVA_HOME= /usr/lib/jvm/java-8-openjdk-amd64
JRE_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
EOL
sudo chmod 644 environment

# jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins -y

sudo cat /var/lib/jenkins/secrets/initialAdminPassword
