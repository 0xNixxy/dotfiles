#!/bin/bash

# Script to install Azure CLI from official Microsoft repository
# Reference: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt#install-azure-cli

# Install pre-requisites for Azure CLI
sudo apt update &&
  sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release -y

# Download and install Microsoft signing key
sudo mkdir -p /etc/apt/keyrings
curl -sLS https://packages.microsoft.com/keys/microsoft.asc |
  gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg >/dev/null
sudo chmod go+r /etc/apt/keyrings/microsoft.gpg

# Add the Azure CLI software repository
AZ_DIST=$(lsb_release -cs)
echo "Types: deb
URIs: https://packages.microsoft.com/repos/azure-cli/
Suites: ${AZ_DIST}
Components: main
Architectures: $(dpkg --print-architecture)
Signed-by: /etc/apt/keyrings/microsoft.gpg" |
  sudo tee /etc/apt/sources.list.d/azure-cli.sources

# Install azure-cli package
sudo apt update &&
  sudo apt install azure-cli -y
