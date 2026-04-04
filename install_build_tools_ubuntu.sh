#!/bin/bash

# Install build tools I commonly use for development in Ubuntu LTS versions.
# Primary support for C, C++ and Rust development work.

# Update to latest patches
sudo apt update &&
  sudo apt upgrade -y

# Install gcc, make
sudo apt install -y build-essential

# Install rust
./install_rust.sh