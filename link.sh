#!/bin/bash
mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/after/plugin
mkdir -p ~/.config/nvm/lua

ln -s $DOT/gitconfig $HOME/.gitconfig
ln -s $DOT/zshrc $HOME/.zshrc
ln -s $DOT/init.vim $HOME/.config/nvim/init.vim

for f in `find . -regex ".*\.vim$\|.*\.lua$"`; do
  rm -rf ~/.config/nvim/$f
  ln -s ~/dotfiles/$f ~/.config/nvim/$f
done
