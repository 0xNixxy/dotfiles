#!/bin/bash

# Install latest version of rustup and rust.

# Get official rustup for WSL
# Use 'rustup self uninstall' to remove rustup.
curl --proto '=https' --tlsv1.3 -sSf https://sh.rustup.rs | sh
