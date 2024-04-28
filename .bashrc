# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi

bind -x '"\C-l":clear'

# ~~~~~~~~~~ Local Utility Functions ~~~~~~~~~~
_have() { type "$1" &>/dev/null; }

_source_if() { [[ -r "$1" ]] && source "$1"; }

# ~~~~~~~~~~ Environment Variables ~~~~~~~~~~
export USER="${USER:-$(whoami)}"
export LANG=en_US.UTF-8
# Shell
export SHELL=/bin/bash
# Editing
export EDITOR=nvim
export EDITOR_PREFIX=nvim
export VISUAL=nvim
# Web
export BROWSER="firefox"
# Directories
export GITUSER="charlieroth"
export REPOS="$HOME/github.com"
export GHREPOS="$HOME/github.com/$GITUSER"
export LAB="$GHREPOS/lab"
export DOTFILES="$HOME/dotfiles"
export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export SECOND_BRAIN="$DOCUMENTS/Alexandria"
# Go development
export GOBIN="$HOME/.local/bin"
export GOPRIVATE="$GHREPOS/$GITUSER/*"
# Elixir/Erlang development
export ERL_AFLAGS="-kernel shell_history enabled"
# ROS development
export ROS_DOMAIN_ID=1

# ~~~~~~~~~~ PATH ~~~~~~~~~~
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/home/charlie/zig"
export PATH="$PATH:/home/charlie/github.com/zigtools/zls/zig-out/bin"
export MODULAR_HOME="/home/charlie/.modular"
export PATH="$PATH:$MODULAR_HOME/pkg/packages.modular.com_mojo/bin"

# ~~~~~~~~~~ History ~~~~~~~~~~
export HISTFILE=~/.histfile
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignorespace

# ~~~~~~~~~~ Aliases ~~~~~~~~~~
alias v=nvim

alias ip='ip -c'
alias free='free -h'
alias tree='tree -a'
alias chmox='chmod +x'
alias diff='diff --color'
alias c='clear'

# cd
alias dot="cd $DOTFILES"
alias repos="cd $GHREPOS"
alias lab="cd $LAB"

# ls
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -lathr'

# find all files recursively and sorts by last modifcation, ignore
# hidden files
alias lastmod='find . -type -f -not -path "*/\.*" -exec ls -lrt {} +'

# git
alias gs="git status"
alias gcm="git commit -m"
alias gcam="git commit -a -m"
alias gcad="git commit -a --ammend"

# ---- Functions ----
clone() {
	local repo="$1" user
	local repo="${repo#https://github.com/}"
	local repo="${repo#git@github.com:}"
	if [[ $repo =~ / ]]; then
		user="${repo%%/*}"
	else
		user="$GITUSER"
		[[ -z "$user" ]] && user="$USER"
	fi
	local name="${repo##*/}"
	local userd="$REPOS/$user"
	local path="$userd/$name"
	[[ -d "$path" ]] && cd "$path" && return
	mkdir -p "$userd"
	cd "$userd"
	echo gh repo clone "$user/$name" -- --recurse-submodule
	gh repo clone "$user/$name" -- --recurse-submodule
	cd "$name"
} && export -f clone

# ---- Node Version Manager ----
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
