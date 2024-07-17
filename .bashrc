#
# ~/.bashrc
#

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
export HRULEWIDTH=73
# shell
export SHELL=/opt/homebrew/bin/bash
export SHELL_SESSION_HISTORY=0
export LANG=en_US.UTF-8
# user
export USER="${USER:-$(whoami)}"
# directories
export GITUSER="charlieroth"
export REPOS="$HOME/github.com"
export GHREPOS="$HOME/github.com/$GITUSER"
export LAB="$GHREPOS/lab"
export DOTFILES="$HOME/dotfiles"
export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export SCRIPTS="$DOTFILES/scripts"
export SECOND_BRAIN="$DOCUMENTS/Alexandria"
# go
export GOPRIVATE="$GHREPOS/$GITUSER/*"
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
# other
export BASH_SILENCE_DEPRECATION_WARNING=1

# ---- PATH ----
export PATH="$MOJO_PATH/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# ---- Aliases ----
alias v=nvim
alias t='tmux'
alias tks='tmux kill-server'
alias ip='ip -c'
alias free='free -h'
alias tree='tree -a'
alias chmox='chmox +x'
alias diff='diff --color'
alias c='clear'
alias coin="clip '(yes|no)'"
alias iam=live
alias dot="cd $DOTFILES"
alias scripts="cd $SCRIPTS"
alias repos="cd $GHREPOS"
alias lab="cd $GHREPOS"
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -lathr'
alias lastmod='find . -type f -not -path "*/\.*" -exec ls -lrt {} +'
alias sb="cd \$SECOND_BRAIN"
alias in="cd \$SECOND_BRAIN/00\ Inbox/"
alias gp="git pull"
alias gs="git status"
alias lg='lazygit'
alias fishies=asciiquarium
alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias vf='v $(fp)'

source <(kubectl completion bash)
complete -o default -F __start_kubectl k
alias k='kubectl'
alias kgp='kubectl get pods'
alias kn='kubens'
alias kcr='kubectl config use-context rancher-desktop'


# ---- Source external dependencies / completion ----
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
. "$HOME/.cargo/env"
eval "$(zoxide init bash)"
eval "$(starship init bash)"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/charlie/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
