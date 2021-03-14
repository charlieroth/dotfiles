#!/usr/bin/env bash
mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/after/plugin
mkdir -p ~/.config/nvm/lua

ln -s $DOT/gitconfig $HOME/.gitconfig
ln -s $DOT/zshrc $HOME/.zshrc
ln -s $DOT/init.vim $HOME/.config/nvim/init.vim
