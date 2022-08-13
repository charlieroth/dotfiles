#!/bin/bash

BASHRC="$HOME/git/charlieroth/dotfiles/bashrc"
PROFILE="$HOME/gi/charlieroth/dotfiles/profile"
BASH_PROFILE="$HOME/git/charlieroth/dotfiles/bash_profile"
VIM="$HOME/git/charlieroth/dotfiles/vimrc"
NVIM="$HOME/git/charlieroth/dotfiles/nvim"
GITCONFIG="$HOME/git/charlieroth/dotfiles/gitconfig"
GITCONFIG_CHARLIEROTH="$HOME/git/charlieroth/dotfiles/gitconfig-charlieroth"
GITCONFIG_WALTYRDACMUS="$HOME/git/charlieroth/dotfiles/gitconfig-waltyr-dacmus"
TMUX="$HOME/git/charlieroth/dotfiles/tmux.conf"

ln -sf $PROFILE ~/.profile
ln -sf $BASHRC ~/.bashrc
ln -sf $BASH_PROFILE ~/.bash_profile
ln -sf $GITCONFIG ~/.gitconfig
ln -sf $GITCONFIG_CHARLIEROTH ~/.gitconfig-charlieroth
ln -sf $GITCONFIG_WALTYRDACMUS ~/.gitconfig-waltyr-dacmus
ln -sf $VIM ~/.vimrc
ln -sf $NVIM ~/.config/nvim
ln -sf $TMUX ~/.tmux.conf

echo "dotfiles setup.sh: symlink complete"
