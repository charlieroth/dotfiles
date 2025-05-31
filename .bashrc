export XDG_CONFIG_HOME="$HOME"/.config


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
export SHELL_SESSION_HISTORY=0
export LANG=en_US.UTF-8
# user
export USER="${USER:-$(whoami)}"
# directories
export GITUSER="charlieroth"
export REPOS="$HOME/git"
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
export PATH=$PATH:/usr/local/go/bin
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

alias v=nvim

# git
alias ga="git add"
alias gcm="git commit -m"
alias gc="git commit"
alias gl="git lg"
alias gp="git pull"
alias gs="git status"

# tailscale
alias tsup="sudo tailscale up --accept-routes"
alias tsdn="sudo tailscale down"

alias lg='lazygit'
alias ld='lazydocker'
alias nd='nix develop'

alias dot="cd $DOTFILES"
alias scripts="cd $SCRIPTS"
alias repos="cd $GHREPOS"

# ---- Kubernetes ----
alias k='kubectl'
alias kgp='kubectl get pods'
alias kn='kubens'
alias kcr='kubectl config use-context rancher-desktop'

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source .bashrc_work

# ---- Cargo (Rust) ----
. "$HOME/.cargo/env"

# ---- Deno ----
. "/home/charlie/.deno/env"

# ---- Zoxide (Better cd) ----
eval "$(zoxide init bash)"

# ---- Starship (PROMPT) ----
eval "$(starship init bash)"

# ---- Direnv (Environment Management) ----
eval "$(direnv hook bash)"

# ---- UV ----
eval "$(uv generate-shell-completion bash)"

source /home/charlie/.local/share/zeus/rc/zeus.bash
