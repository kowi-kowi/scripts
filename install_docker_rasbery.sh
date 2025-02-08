#!/bin/bash

# Update the system
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install required packages
echo "Installing required packages..."
sudo apt install -y ca-certificates curl gnupg

# Add Docker's official GPG key
echo "Adding Docker GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository
echo "Adding Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

# Install Docker
echo "Installing Docker..."
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Enable and start Docker service
echo "Enabling and starting Docker..."
sudo systemctl enable docker
sudo systemctl start docker

# Verify installation
echo "Verifying Docker installation..."
sudo docker run hello-world

# Add user to Docker group (optional)
echo "Adding user to Docker group..."
sudo usermod -aG docker $USER

echo "Docker installation completed! Please log out and log back in to use Docker without sudo."
