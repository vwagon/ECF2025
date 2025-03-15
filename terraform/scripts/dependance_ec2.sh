#!/bin/bash
set -e

# Log file
exec 1> >(logger -s -t $(basename $0)) 2>&1

# Install Docker
echo "Installing Docker..."
yum update -y || { echo "Failed to update yum"; exit 1; }
yum install -y java mariadb105 git maven || {echo "Failed to install java, mariadb105, git, maven"; exit 1; }
yum install -y docker || { echo "Failed to install docker"; exit 1; }

# Start Docker service
echo "Starting Docker service..."
systemctl start docker || { echo "Failed to start docker"; exit 1; }
systemctl enable --now docker || { echo "Failed to enable docker"; exit 1; }

# Add ec2-user to docker group
echo "Configuring user permissions..."
usermod -aG docker ec2-user || { echo "Failed to add ec2-user to docker group"; exit 1; }

# Install Docker Compose
echo "Installing Docker Compose..."
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose || { echo "Failed to download docker-compose"; exit 1; }
sudo chmod +x /usr/local/bin/docker-compose || { echo "Failed to make docker-compose executable"; exit 1; }
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose || { echo "Failed to create symlink"; exit 1; }
sudo docker-compose version || { echo "Failed to verify docker-compose installation"; exit 1; }

# Install Loki Docker driver
echo "Installing Loki Docker driver..."
docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions || { echo "Failed to install Loki Docker driver"; exit 1; }

echo "Installation complete!"