#!/bin/sh

# Update apt repositories
sudo apt update && sudo apt upgrade

# Setup Rust Tools apt repository
curl -fsSL https://apt.cli.rs/pubkey.asc | sudo tee -a /usr/share/keyrings/rust-tools.asc

curl -fsSL https://apt.cli.rs/rust-tools.list | sudo tee /etc/apt/sources.list.d/rust-tools.list

sudo apt update

sudo apt install eza \
  fzf \
  less \
  stow \
  vim \
  neovim \
  zoxide \
  ghostty
