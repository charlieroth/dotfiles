#!/usr/bin/env bash

ln -s ~/dotfiles/gitconfig ~/.gitconfig

ln -s ~/dotfiles/zshrc ~/.zshrc

mkdir -p ~/.config/nvim

cp -Rv ~/dotfiles/nvim ~/.config/nvim
