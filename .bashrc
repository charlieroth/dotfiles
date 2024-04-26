# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ---- local utility functions ----
_have() { type "$1" &>/dev/null; }

_source_if() { [[ -r "$1" ]] && source "$1"; }

# ---- environment variables ----
export SHELL=/bin/bash
export BASH_SILENCE_DEPRECATION_WARNING=1
export LANG=en_US.UTF-8
export USER="${USER:-$(whoami)}"
export GITUSER="charlieroth"
export PLATFORM="linux"
export REPOS="$HOME/github.com"
export GHREPOS="$HOME/github.com/$GITUSER"
export LAB="$GHREPOS/lab"
export DOTFILES="$HOME/dotfiles"
export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export SECOND_BRAIN="$DOCUMENTS/Alexandria"
export HRULEWIDTH=73
export EDITOR=nvim
export VISUAL=nvim
export EDITOR_PREFIX=nvim
export GOPRIVATE="$GHREPOS/$GITUSER/*"
export GOBIN="$HOME/.local/bin"
export GOPROXY=direct
export CGO_ENABLED=0
# export CFLAGS="-Wall -Wextra -Werror -O0 -g -fsanitize=address -fno-omit-frame-pointer -finstrument-functions"
export ERL_AFLAGS="-kernel shell_history enabled"
export ROS_DOMAIN_ID=1

# ---- PATH ----
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cabal/bin"
export PATH="$PATH:$HOME/.ghcup/bin"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/home/charlie/zig"
export PATH="$PATH:/home/charlie/github.com/zigtools/zls/zig-out/bin"
export MODULAR_HOME="/home/charlie/.modular"
export PATH="$PATH:$MODULAR_HOME/pkg/packages.modular.com_mojo/bin"

# ---- history ----
export HISTFILE=~/.histfile
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignorespace


# ---- aliases ----
alias v=nvim
alias python='/usr/bin/python3.11'

alias ip='ip -c'
alias free='free -h'
alias tree='tree -a'
alias chmox='chmod +x'
alias diff='diff --color'
alias c='clear'

# cd
alias dot="cd $DOTFILES"
alias scripts="cd $SCRIPTS"
alias repos="cd $GHREPOS"
alias lab="cd $LAB"

# ls
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -lathr'

# find all files recursively and sorts by last modifcation, ignore
# hidden files
alias last='find . -type -f -not -path "*/\.*" -exec ls -lrt {} +'

# git
alias gs="git status"


# ---- functions ----
# clone() {
# 	local repo="$1" user
# 	local repo="${repo#https://github.com/}"
# 	local repo="${repo#git@github.com:}"
# 	if [[ $repo =~ / ]]; then
# 		user="${repo%%/*}"
# 	else
# 		user="$GITUSER"
# 		[[ -z "$user" ]] && user="$USER"
# 	fi
# 	local name="${repo##*/}"
# 	local userd="$REPOS/$user"
# 	local path="$userd/$name"
# 	[[ -d "$path" ]] && cd "$path" && return
# 	mkdir -p "$userd"
# 	cd "$userd"
# 	echo gh repo clone "$user/$name" -- --recurse-submodule
# 	gh repo clone "$user/$name" -- --recurse-submodule
# 	cd "$name"
# } && export -f clone

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# ---- Source External Dependencies / Completion ----
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

_have gh && . <(gh completion -s bash)
_have pandoc && . <(pandoc --bash-completion)

# ---- Personalize Configuration ----
_source_if "$HOME/.bash_personal"
_source_if "$HOME/.bash_private"
_source_if "$HOME/.bash_work"

# ---- Rust ----
. "$HOME/.cargo/env"

# ---- Zoxide ----
eval "$(zoxide init bash)"

# ---- Starship ----
eval "$(starship init bash)"

# ---- ROS setup ----
# source /opt/ros/iron/setup.bash

# ---- ASDF (Version Manager for Elixir) ----
. "$HOME/.asdf/asdf.sh"
