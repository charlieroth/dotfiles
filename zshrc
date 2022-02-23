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
plugins=(git)

# General Aliases
alias cl="clear"
alias lp="lsof -Pi | grep LISTEN"
alias lsn="ps -ef | grep node"

# Vim
alias vim="nvim"
alias vrc="vim ~/.config/nvim"
alias batcave="cd ~/.config/nvim && nvim"

# Node/NPM
alias cpj="cat package.json | fzf"

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


# Tools
alias zig="/Users/charlie/Tools/zig/zig"
alias urb="cd ~/Urbit && ./urbit waltyr-dacmus"
alias livebook="cd ~/Tools/livebook && MIX_ENV=prod mix phx.server"

export ZSH=$HOME/.oh-my-zsh
export VIMRUNTIME="/opt/homebrew/Cellar/neovim/0.6.1/share/nvim/runtime/"
export TERM=xterm-256color
export EDITOR=nvim

# PATH
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH=$PATH:/Users/charlie/bin
export PATH=/Users/charlie/.cache/rebar3/bin:$PATH
export PATH="/Users/charlie/.deno/bin:$PATH"
export PATH=$PATH:~/.npm-global/bin

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NETLIFY_AUTH_TOKEN="ttiFHOwvrqY1ahMMWZuPP5FSjeih4UcZdXAzQQi4foI"

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/charlie/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/charlie/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/charlie/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/charlie/google-cloud-sdk/completion.zsh.inc'; fi
