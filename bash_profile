#!/bin/sh

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

mg() { mkdir "$@" && cd "$@" || exit; }
npm-latest() { npm info "$1" | grep latest; }
killport() { lsof -i tcp:"$*" | awk 'NR!=1 {print $2}' | xargs kill -9; }

git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

acolor() {
  [[ -n $(git status --porcelain=v2 2>/dev/null) ]] && echo 31 || echo 33
}

export PS1="\u@\[\033[32m\]\W\[\033[\$(acolor)m\]\$(git_branch)\[\033[00m\]\$ "

# shell prompt
# export PS1="\u: \W $ "
source ~/.bashrc
