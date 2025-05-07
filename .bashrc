export XDG_CONFIG_HOME="$HOME"/.config

# ---- Cargo (Rust) ----
. "$HOME/.cargo/env"

# ---- Zoxide (Better cd) ----
eval "$(zoxide init bash)"

# ---- Starship (PROMPT) ----
eval "$(starship init bash)"

# ---- Direnv (Environment Management) ----
eval "$(direnv hook bash)"

# set to vim editing mode
set -o vi

# keybinds
bind -x '"\C-l":clear'

# ---- Environment ----
# text editing
export EDITOR=vim
export VISUAL=vim
export EDITOR_PREFIX=vim
export HRULEWIDTH=80
# shell
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
# go
export GOBIN="$HOME/go/bin"
export GOPROXY=direct
export CGO_ENABLED=0
# 1password
export SSH_AUTH_SOCK=~/.1password/agent.sock
# other
export BASH_SILENCE_DEPRECATION_WARNING=1

# ---- PATH ----
export PATH="$GOBIN:$PATH"
export PATH="$MOJO_PATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$REPOS/zigtools/zls/zig-out/bin:$PATH"

# ---- Aliases ----
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias lsa='ls -a'

if command -v eza &> /dev/null
then
  alias ls='eza -lh --group-directories-first --icons'
  alias lt='eza --tree --level=2 --long --icons --git'
fi

alias c='clear'

alias ff="fzf --preview 'batcat --style=numbers --color=always {}'"
alias diff='diff --color'

alias v=vim
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

# ---- Kubernetes ----
alias k='kubectl'
alias kgp='kubectl get pods'
alias kn='kubens'
alias kcr='kubectl config use-context rancher-desktop'

# ---- Deno ----
# . "/Users/charlie/.deno/env"

# source /Users/charlie/.config/op/plugins.sh

# pnpm
# export PNPM_HOME="/Users/charlie/Library/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
# pnpm end
