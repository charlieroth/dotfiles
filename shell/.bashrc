# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# set to vim editing mode
set -o vi


# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export XDG_CONFIG_HOME="$HOME"/.config

# Text editing
export EDITOR=nvim
export VISUAL=nvim
export EDITOR_PREFIX=nvim
export HRULEWIDTH=80

# Shell
export SHELL=/usr/bin/bash
export SHELL_SESSION_HISTORY=0
export LANG=en_US.UTF-8

# User
export USER="${USER:-$(whoami)}"

# Directories
export GITUSER="charlieroth"
export REPOS="$HOME/github.com"
export GHREPOS="$REPOS/$GITUSER"
export LAB="$GHREPOS/lab"
export DOTFILES="$HOME/dotfiles"
export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export SCRIPTS="$DOTFILES/scripts"

# Go
# export GOPRIVATE="$GHREPOS/$GITUSER/*"
export GOBIN="$HOME/go/bin"
export GOPROXY=direct
export CGO_ENABLED=0

# Mojo
# export MODULAR_HOME="$HOME/.modular"
# export MOJO_PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo"

# Node
# export NVM_DIR="$HOME/.nvm"

# Compilation Flags
# export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# Erlang
# export ERL_AFLAGS="-kernel shell_history enabled"
# other
export BASH_SILENCE_DEPRECATION_WARNING=1

# --- PATH ---
export PATH="$HOME/.local/bin:$PATH"
export PATH="$GOBIN:$PATH"
# export PATH="$MOJO_PATH/bin:$PATH"
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
# export PATH="/Users/charlie/.local/bin:$PATH"
# export PATH="$REPOS/zigtools/zls/zig-out/bin:$PATH"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# --- Starship (PROMPT) ---
eval "$(starship init bash)"

# --- Direnv (Environment Management) ---
#eval "$(direnv hook bash)"

# --- Cargo (Rust) ---
. "$HOME/.cargo/env"

# --- Zoxide (Better cd) ---
eval "$(zoxide init bash)"
