#!/bin/bash

HOME=~
DOT=$HOME/dotfiles
VIM_COLORS=$HOME/.vim/colors
ZSH_THEMES=$HOME/.oh-my-sh/custom/themes

ln -s $DOT/gitconfig $HOME/.gitconfig
ln -s $DOT/zshrc $HOME/.zshrc
ln -s $DOT/vimrc $HOME/.vimrc
ln -s $DOT/init.vim $HOME/.config/nvim/init.vim
ln -s $DOT/charlie.vim $VIM_COLORS/charlie.vim
ln -s $DOT/charlie.zsh-theme $ZSH_THEMES/charlie.zsh-theme
