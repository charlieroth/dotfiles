#!/bin/bash

HOME=~
DOT=$HOME/dotfiles
VIM_COLORS=$HOME/.vim/colors
ZSH_THEMES=$HOME/.oh-my-sh/custom/themes

ln -s $DOT/gitconfig $HOME/.gitconfig
ln -s $DOT/zshrc $HOME/.zshrc
ln -s $DOT/vimrc $HOME/.vimrc

mkdir -p .config/nvim
ln -s $DOT/init.vim $HOME/.config/nvim/init.vim

mkdir -p .vim/colors
ln -s $DOT/charlie.vim $VIM_COLORS/charlie.vim

mkdir -p $ZSH_THEMES
ln -s $DOT/charlie.zsh-theme $ZSH_THEMES/charlie.zsh-theme
