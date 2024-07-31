#!/bin/bash

# This script installs the common tools I use for my development environment
# across systems. As some of the repositories maintained in the Debian and
# Ubuntu package repositories are very out-of-date, this script adds official
# repositories to install the latest versions of these tools. This script is
# targeted at fresh installations. For existing development setups, you may want
# to invoke the installation scripts for specific tools.

# Update to latest patches
sudo apt update &&
  sudo apt upgrade

################################################
# Install my frequently used development tools #
################################################

# Azure CLI
./install_azure_cli.sh

# GitHub CLI
./install_github_cli.sh

# Docker CLI
./install_docker_cli.sh

# Rust toolchain
# install_rust_cli.sh
