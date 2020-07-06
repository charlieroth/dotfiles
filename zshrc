# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="lambda"

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

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
plugins=(git tmux)

# General Aliases
alias cl="clear"
alias lp="lsof -Pi | grep LISTEN"

# Version Control
alias ga="git add ."
alias gcm="git commit -m $1"
alias gct="git checkout"
alias gctb="git checkout -b"
alias gd="git diff"
alias gs="git status"
alias ggpush="git push origin $(git_current_branch)"
alias ggpull="git pull origin $(git_current_branch)"

# Frequently Used Files
alias vrc="vim ~/.vimrc"
alias vzrc="vim ~/.zshrc"
alias vmux="vim ~/.tmux.conf"

# RabbitMQ
alias rabbitmq-stop="rabbitmqctl stop"

# Postgres
alias postgres_start="pg_ctl -D /usr/local/var/postgres start"
alias postgres_stop="pg_ctl -D /usr/local/var/postgres stop"

# PATH exports 
export ZSH=$HOME/.oh-my-zsh
export PATH=~/.npm-global/bin:$PATH
export TERM=xterm-256color
source $ZSH/oh-my-zsh.sh
