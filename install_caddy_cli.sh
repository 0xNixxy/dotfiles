#!/bin/bash

# Script to install Caddy CLI from official Cloudsmith repository
# Reference: https://caddyserver.com/docs/install#debian-ubuntu-raspbian

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
