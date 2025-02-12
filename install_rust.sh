#!/bin/bash

# Update the package list
echo "Updating package list..."
sudo apt update -y

# Install curl and build-essential if they are not already installed
echo "Installing required dependencies..."
sudo apt install -y curl build-essential

# Install Rust using rustup
echo "Installing Rust via rustup..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Configure the shell to add rustup to PATH
echo "Configuring shell..."
source $HOME/.cargo/env

# Verify installation
echo "Verifying Rust installation..."
rustc --version

# Optional: Update Rust to the latest version
echo "Updating Rust to the latest version (optional)..."
rustup update

# Confirm installation of cargo
echo "Verifying Cargo installation..."
cargo --version

echo "Rust installation complete!"

# Configure the shell to add rustup to PATH
echo "Configuring shell..."
source $HOME/.cargo/env

# Add cargo and bitn to the PATH if they are not already in the PATH
if ! grep -q 'cargo' "$HOME/.bashrc"; then
    echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> $HOME/.bashrc
fi
