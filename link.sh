#!/bin/bash

DOT=~/dotfiles
VIM_COLORS=~/.vim/colors
ZSH_THEMES=~/.oh-my-sh/custom/themes
HOME=~

ln -s $DOT/gitconfig $HOME/.gitconfig
ln -s $DOT/zshrc $HOME/.zshrc
ln -s $DOT/vimrc $HOME/.vimrc
ln -s $DOT/charlie.vim $VIM_COLORS/charlie.vim
ln -s $DOT/charlie.zsh-theme $ZSH_THEMES/charlie.zsh-theme
