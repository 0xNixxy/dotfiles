#!/bin/bash

# Script to install GitHub CLI from official GitHub repository
# Reference: https://github.com/cli/cli/blob/trunk/docs/install_linux.md

# Install pre-requisites for GitHub CLI
(type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y))

# Download and install GitHub signing key
sudo mkdir -p -m 755 /etc/apt/keyrings &&
  wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg |
  sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg >/dev/null &&
  sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg

# Add the GitHub CLI repository
echo "deb [arch=$(dpkg --print-architecture) \
signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] \
https://cli.github.com/packages stable main" |
  sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null

# Install gh package
sudo apt update &&
  sudo apt install gh -y
