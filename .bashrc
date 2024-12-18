# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# set to vim editing mode
set -o vi

# keybinds
bind -x '"\C-l":clear'

# ---- Environment ----
# text editing
export EDITOR=nvim
export VISUAL=nvim
export EDITOR_PREFIX=nvim
export HRULEWIDTH=80
# shell
export SHELL=/opt/homebrew/bin/bash
export SHELL_SESSION_HISTORY=0
export LANG=en_US.UTF-8
# user
export USER="${USER:-$(whoami)}"
# directories
export GITUSER="charlieroth"
export REPOS="$HOME/github.com"
export GHREPOS="$REPOS/$GITUSER"
export LAB="$GHREPOS/lab"
export DOTFILES="$HOME/dotfiles"
export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export SCRIPTS="$DOTFILES/scripts"
export SECOND_BRAIN="$DOCUMENTS/Digital\ Garden/"
# go
# export GOPRIVATE="$GHREPOS/$GITUSER/*"
export GOBIN="$HOME/.local/bin"
export GOPROXY=direct
export CGO_ENABLED=0
# mojo
export MODULAR_HOME="$HOME/.modular"
export MOJO_PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo"
# node
export NVM_DIR="$HOME/.nvm"
# compilation flags
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
# Erlang
export ERL_AFLAGS="-kernel shell_history enabled"
# other
export BASH_SILENCE_DEPRECATION_WARNING=1

# ---- PATH ----
export PATH="$MOJO_PATH/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/Users/charlie/.local/bin:$PATH"
export PATH="$REPOS/zigtools/zls/zig-out/bin:$PATH"

# ---- Aliases ----
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ls='eza -lh --group-directories-first --icons'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'

alias c='clear'

alias ff="fzf --preview 'batcat --style=numbers --color=always {}'"
alias diff='diff --color'

alias v=nvim
alias t='tmux'
alias tks='tmux kill-server'

alias ga="git add"
alias gcm="git commit -m"
alias gc="git commit"
alias gl="git lg"
alias gp="git pull"
alias gs="git status"
alias txn="tmuxinator"
alias lg='lazygit'
alias ld='lazydocker'

alias dot="cd $DOTFILES"
alias scripts="cd $SCRIPTS"
alias repos="cd $GHREPOS"
alias lab="cd $LAB"
alias sb="cd $SECOND_BRAIN"

# ---- Work Aliases ----
alias sy="source .yoshi/bin/activate"

# ---- Kubernetes ----
alias k='kubectl'
alias kgp='kubectl get pods'
alias kn='kubens'
alias kcr='kubectl config use-context rancher-desktop'
