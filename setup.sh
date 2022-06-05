#!/bin/bash

GITCONFIG="$HOME/github.com/charlieroth/dotfiles/gitconfig"
VIM="$HOME/github.com/charlieroth/dotfiles/vimrc"
KITTY="$HOME/github.com/charlieroth/dotfiles/kitty"
FISH="$HOME/github.com/charlieroth/dotfiles/fish"
NVIM="$HOME/github.com/charlieroth/dotfiles/nvim"

ln -sf $GITCONFIG ~/.gitconfig
ln -sf $VIM ~/.vimrc
ln -sf $KITTY ~/.config/kitty
ln -sf $FISH ~/.config/fish
ln -sf $NVIM ~/.config/nvim

echo "dotfiles setup.sh: symlink complete"
