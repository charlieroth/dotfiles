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
export LAB="$GHREPOS/lab"
export DOTFILES="$HOME/dotfiles"
export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export SCRIPTS="$DOTFILES/scripts"
export SECOND_BRAIN="$DOCUMENTS/Alexandria"
export HRULEWIDTH=73
export EDITOR=nvim
export VISUAL=nvim
export EDITOR_PREFIX=nvim
export GOPRIVATE="$GHREPOS/$GITUSER/*"
export GOBIN="$HOME/.local/bin"
export GOPROXY=direct
export CGO_ENABLED=0
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
export MODULAR_HOME="$HOME/.modular"
export MOJO_PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo"
# Tell Apple to hush
export BASH_SILENCE_DEPRECATION_WARNING=1

# ---- PATH ----
export PATH="$MOJO_PATH/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"


# ---- history ----
export SHELL_SESSION_HISTORY=0

# ---- aliases ----
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
alias lab="cd $GHREPOS"

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

. "$HOME/.cargo/env"

eval "$(zoxide init bash)"
eval "$(starship init bash)"

# PyEnv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
