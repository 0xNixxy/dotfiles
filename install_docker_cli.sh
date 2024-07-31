#!/bin/bash

# Script to install Docker Engine from official Docker repository
# Reference: https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

# Install pre-requisites for Docker Engine
sudo apt update &&
  sudo apt install ca-certificates curl -y

# Download and install Docker signing key
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the Docker software repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" |
  sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

# Install Docker packages
sudo apt update &&
  sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Manage Docker as a non-root user
if ! getent group docker >/dev/null; then
  sudo groupadd docker
fi
if ! groups $USER | grep -q "\bdocker\b"; then
  sudo usermod -aG docker $USER
fi

# Verify Docker works without sudo
# Altenatively, user can log out and log in again before running "hello-world"
newgrp docker
docker run hello-world
