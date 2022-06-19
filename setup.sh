#!/bin/bash

BASHRC="$HOME/github.com/charlieroth/dotfiles/bashrc"
PROFILE="$HOME/github.com/charlieroth/dotfiles/profile"
BASH_PROFILE="$HOME/github.com/charlieroth/dotfiles/bash_profile"
VIM="$HOME/github.com/charlieroth/dotfiles/vimrc"
GITCONFIG="$HOME/github.com/charlieroth/dotfiles/gitconfig"
TMUX="$HOME/github.com/charlieroth/dotfiles/tmux.conf"

ln -sf $PROFILE ~/.profile
ln -sf $BASHRC ~/.bashrc
ln -sf $BASH_PROFILE ~/.bash_profile
ln -sf $GITCONFIG ~/.gitconfig
ln -sf $VIM ~/.vimrc
ln -sf $TMUX ~/.tmux.conf

echo "dotfiles setup.sh: symlink complete"
