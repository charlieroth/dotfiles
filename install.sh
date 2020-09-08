#!/bin/bash
########################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
########################

# Variables
DIR=~/dotfiles
OLD_DIR=~/dotfiles_old
FILES="gitconfig vimrc zshrc charlie"

# Create dotfiles_old in home directory
echo "Creating $OLD_DIR for backup of any existing dotfiles in ~"
mkdir -p $OLD_DIR
echo "...done"

# change to the dotfiles directory
echo "Changing to the $DIR directory"
cd $DIR
echo "...done"

# move any existing dortiles in homedir to dotfiles_old, then create symlinks
for FILE in $FILES; do
  echo "Moving any existing dot files from ~ to $OLD_DIR"
  
  mv ~/.$FILE $OLD_DIR/
  
  echo "Creating symlink to $FILE in home directory"
  
  if [$FILE == "charlie"]
  then
      ln -s $DIR/$FILE ~/.vim/colors/charlie.vim
  else
      ln -s $DIR/$FILE ~/.$FILE
  fi
done
