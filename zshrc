ZSH_THEME="eastwood"
MYVIMRC=~/.config/nvim/init.vim

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

alias vim="~/nvim-osx64/bin/nvim"
alias vrc="nvim $MYVIMRC"

# General Aliases
alias cl="clear"
alias lp="lsof -Pi | grep LISTEN"
alias lsn="ps -ef | grep node"
alias vimf="vim (ls | fzf)"

# Node/NPM
alias cpj="cat package.json | fzf"
alias nrx="npm run xcode"

# Version Control
alias ga="git add"
alias gcm="git commit -m"
alias gct="git checkout"
alias gcb="git checkout -b"
alias gd="git diff"
alias gs="git status"
alias ggpush="git push origin $(git_current_branch)"
alias ggpull="git pull origin $(git_current_branch)"
alias gfp="git fetch && git pull"

# Tmux Environments
alias albert="sh ~/bin/dev-albert"
alias elixirlab="sh ~/bin/elixir-lab"

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
