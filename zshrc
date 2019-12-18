# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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

# Version Control
alias ga="git add ."
alias gcm="git commit -m $1"
alias gct="git checkout"
alias gctb="git checkout -b"
alias gd="git diff"
alias gs="git status"
alias ggpush="git push origin $(git_current_branch)"
alias ggpull="git pull origin $(git_current_branch)"

# Appirio
alias iu-api="cd ~/workspace/iu-cc/api"
alias iu-client="cd ~/workspace/iu-cc/client"

# Polls
alias pweb="cd ~/workspace/polls_web/"
alias papi="cd ~/workspace/polls_api/"

# Frequently Used Files
alias vrc="vim ~/.vimrc"
alias vzrc="vim ~/.zshrc"
alias vmux="vim ~/.tmux.conf"

# Postgres
alias postgres_start="pg_ctl -D /usr/local/var/postgres start"
alias postgres_stop="pg_ctl -D /usr/local/var/postgres stop"

# Urbit
alias urb="./urbit waltyr-dacmus"

# PATH exports 
export ZSH=$HOME/.oh-my-zsh
export PATH=~/.npm-global/bin:$PATH
export TERM=xterm-256color
source $ZSH/oh-my-zsh.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
