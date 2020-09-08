ZSH_THEME="charlie"

# Outputs the name of the current branch
# Usage example: git pull origin $(git_current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
function git_current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

# General Aliases
alias cl="clear"
alias lp="lsof -Pi | grep LISTEN"
alias lsn="ps -ef | grep node"

# Version Control
alias ga="git add"
alias gcm="git commit -m"
alias gct="git checkout"
alias gctb="git checkout -b"
alias gd="git diff"
alias gs="git status"
alias ggpush="git push origin $(git_current_branch)"
alias ggpull="git pull origin $(git_current_branch)"

# Projects

# Frequently Used Files
alias vrc="vim ~/.vimrc"
alias vzrc="vim ~/.zshrc"

# Postgres
alias postgres_start="pg_ctl -D /usr/local/var/postgres start"
alias postgres_stop="pg_ctl -D /usr/local/var/postgres stop"

# RabbitMQ
alias rabbitmq-stop="rabbitmqctl stop"

# PATH exports 
export ZSH=$HOME/.oh-my-zsh
export PATH=~/.npm-global/bin:$PATH
export PATH=$PATH:/usr/local/opt/rabbitmq/sbin
export TERM=xterm-256color
source $ZSH/oh-my-zsh.sh
