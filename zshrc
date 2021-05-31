ZSH_THEME="minimal"

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
plugins=(git asdf)

# General Aliases
alias cl="clear"
alias lp="lsof -Pi | grep LISTEN"
alias lsn="ps -ef | grep node"

# Vim
alias vim="nvim"
alias vrc="vim ~/.config/nvim"

# Node/NPM
alias cpj="cat package.json | fzf"
alias yrx="yarn run xcode"

# tmux
alias tks="tmux kill-server"

# Version Control
alias lg="lazygit"
alias ga="git add"
alias gcm="git commit -m"
alias gct="git checkout"
alias gcb="git checkout -b"
alias gd="git diff"
alias gs="git status"
alias ggpush="git push origin $(git_current_branch)"
alias ggpull="git pull origin $(git_current_branch)"
alias gfp="git fetch && git pull"

# Postgres
alias postgres_start="pg_ctl -D /usr/local/var/postgres start"
alias postgres_stop="pg_ctl -D /usr/local/var/postgres stop"

# RabbitMQ
alias rabbitmq-stop="rabbitmqctl stop"

export ZSH=$HOME/.oh-my-zsh
export TERM=xterm-256color
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# PATH
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/Users/char/bin
export PATH=$PATH:~/.npm-global/bin
export PATH=$PATH:/usr/local/opt/rabbitmq/sbin

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

. /opt/homebrew/opt/asdf/asdf.sh
