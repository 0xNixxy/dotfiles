#!/bin/bash

# Script to install Azure CLI from official Microsoft repository
# Reference: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt#install-azure-cli

# Install pre-requisites for Caddy CLI
sudo apt update &&
  sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https curl

# Download and install Cloudsmith signing key
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' |
  sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg

# Add Caddy software repository
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' |
  sudo tee /etc/apt/sources.list.d/caddy-stable.list

# Install caddy package
sudo apt update &&
  sudo apt install caddy -y
