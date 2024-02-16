# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ---- local utility functions ----
_have() { type "$1" &>/dev/null; }

_source_if() { [[ -r "$1" ]] && source "$1"; }

# ---- environment variables ----
export SHELL=/bin/bash
export LANG=en_US.UTF-8
export USER="${USER:-$(whoami)}"
export GITUSER="charlieroth"
export PLATFORM="mac"
export REPOS="$HOME/github.com"
export GHREPOS="$HOME/github.com/$GITUSER"
export DOTFILES="$HOME/dotfiles"
export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export SCRIPTS="$HOME/dotfiles/scripts"
export CLOUD_SECOND_BRAIN=("/Users/charlie/Library/Mobile Documents/iCloud~md~obsidian/Documents/Neural Garden")
export SECOND_BRAIN="$HOME/garden"
export HRULEWIDTH=73
export EDITOR=nvim
export VISUAL=nvim
export EDITOR_PREFIX=nvim
export GOPRIVATE="$GHREPOS/$GITUSER/*"
export GOBIN="$HOME/.local/bin"
export GOPROXY=direct
export CGO_ENABLED=0
export CFLAGS="-Wall -Wextra -Werror -O0 -g -fsanitize=address -fno-omit-frame-pointer -finstrument-fucntions"

# Tell Apple to hush
export BASH_SILENCE_DEPRECATION_WARNING=1 

[[ -d /.vim/spell ]] && export VIMSPELL=("$HOME/.vim/spell/*.add")

# ---- history ----
export HISTFILE=~/.histfile
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignoreboth

set -o vi

# ---- smart prompt ----
PROMPT_LONG=20
PROMPT_MAX=95
PROMPT_AT=@

__ps1() {
 local P='$' dir="${PWD##*/}" B countme short long double \
		r='\[\e[31m\]' g='\[\e[30m\]' h='\[\e[34m\]' \
		u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
		b='\[\e[36m\]' x='\[\e[0m\]'

	[[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
	[[ $PWD = / ]] && dir=/
	[[ $PWD = "$HOME" ]] && dir='~'

	B=$(git branch --show-current 2>/dev/null)
	[[ $dir = "$B" ]] && B=.
	countme="$USER$PROMPT_AT$(hostname):$dir($B)\$ "

	[[ $B == master || $B == main ]] && b="$r"
	[[ -n "$B" ]] && B="($b$B)"

	short="$u\u$PROMPT_AT\h:$w$dir$B$p$P$x "
  PS1="$short"
}

PROMPT_COMMAND="__ps1"

# ---- aliases ----
unalias -a

alias v=nvim

alias ip='ip -c'
alias free='free -h'
alias tree='tree -a'
alias chmox='chmox +x'
alias diff='diff --color'
alias c='clear'
alias coin="clip '(yes|no)'"
alias iam=live

# cd
alias dot="cd $DOTFILES"
alias scripts="cd $SCRIPTS"
alias repos="cd $GHREPOS"

# ls
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -lathr'

# find all files recursively and sorts by last modifcation, ignore
# hidden files
alias last='find . -type -f -not -path "*/\.*" -exec ls -lrt {} +'

# second brain & zettelkasten
alias sb="cd \$SECOND_BRAIN"
alias in="cd \$SECOND_BRAIN/0-inbox/"
alias ztl="cd \$SECOND_BRAIN/00-zettelkasten/"

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

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# ---- source external dependencies / completion ----
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

_have gh && . <(gh completion -s bash)
_have pandoc && . <(pandoc --bash-completion)

# ---- personalize configuration ----
_source_if "$HOME/.bash_personal"
_source_if "$HOME/.bash_private"
_source_if "$HOME/.bash_work"

