#!/bin/bash

########################
# This script creates symlinks from the home
# directory to any desired dotfiles in ~/dotfiles 
########################

DIR=~/dotfiles
OLD_DIR=~/dotfiles_old
FILES="gitconfig vimrc zshrc"

echo "Creating $OLD_DIR for backup of any existing dotfiles in ~"
mkdir -p $OLD_DIR

echo "Changing to the $DIR directory"
cd $DIR

for FILE in $FILES; do
  echo "Moving $FILE from $DIR to $OLD_DIR"
  mv ~/.$FILE $OLD_DIR/
  
  echo "Creating symlink ~/dotfiles/$FILE to ~/.$FILE"
  ln -s $DIR/$FILE ~/.$FILE
done
