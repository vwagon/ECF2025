#!/bin/bash
set -e
sudo yum update -y
sudo yum install fail2ban -y  
sudo yum install -y java mariadb105 git maven
sudo yum install -y docker
sudo docker --version
sudo java -version
sudo usermod -aG docker ec2-user
sudo systemctl enable --now docker
sudo systemctl status docker
sudo docker ps
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo docker-compose version
sudo docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions
if grep -q "^PermitRootLogin" /etc/ssh/sshd_config; then
  sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
else
  echo "PermitRootLogin no" >> /etc/ssh/sshd_config
fi
