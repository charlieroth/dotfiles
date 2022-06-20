# ---------- variables ----------
export USER="${USER:-$(whoami)}"

export GITUSER="charlieroth"
export GHREPOS="$HOME/github.com/$GITUSER"

export DOT="$HOME/github.com/$GITUSER/dotfiles"
export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"

export HRULEWIDTH=73

export EDITOR=nvim
export VISUAL=nvim
export TERM=xterm-256color

export GOPRIVATE="github.com/$GITUSER/*"
export GOPATH="$HOME/.local/share/go"
export GOBIN="$HOME/.local/bin"
export GOPROXY=direct
export CGO_ENABLED=0

export LESS_TERMCAP_mb="[35m" # magenta
export LESS_TERMCAP_md="[33m" # yellow
export LESS_TERMCAP_me="" # "0m"
export LESS_TERMCAP_se="" # "0m"
export LESS_TERMCAP_so="[34m" # blue
export LESS_TERMCAP_ue="" # "0m"
export LESS_TERMCAP_us="[4m"  # underline

# ---------- funcs ----------
nvm_switch() {
  if [[ $PWD == $PREV_PWD ]]; then
    return
  fi

  if [[ "$PWD" =~ "$PREV_PWD" && ! -f ".nvmrc" ]]; then
    return
  fi

  PREV_PWD=$PWD
  if [[ -f ".nvmrc" ]]; then
    nvm use
    NVM_DIRTY=true
  elif [[ $NVM_DIRTY = true ]]; then
    nvm use default
    NVM_DIRTY=false
  fi
}

PROMPT_LONG=20
PROMPT_MAX=95
PROMPT_AT=@
set_prompt() {
  local P='$' dir="${PWD##*/}" B countme short long double\
    r='\[\e[31m\]' g='\[\e[30m\]' h='\[\e[34m\]' \
    u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
    b='\[\e[36m\]' x='\[\e[0m\]'

  [[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
  [[ $PWD = / ]] && dir=/
  [[ $PWD = "$HOME" ]] && dir='~'

  B=$(git branch --show-current 2>/dev/null)
  [[ $dir = "$B" ]] && B=.
  countme="$USER$PROMPT_AT$(hostname):$dir($B)\$ "

  [[ $B = master || $B = main ]] && b="$r"
  [[ -n "$B" ]] && B="$g($b$B$g)"

  short="$u\u:$w$dir$B$p$P$x "
  long="$g╔ $u\u$g$PROMPT_AT$h\h$g:$w$dir$B\n$g╚ $p$P$x "
  double="$g╔ $u\u$g$PROMPT_AT$h\h$g:$w$dir\n$g║ $B\n$g╚ $p$P$x "
  PS1="$short"
}

prompt_command() {
    set_prompt
    nvm_switch
}

export PROMPT_COMMAND=prompt_command

# ---------- path ----------
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/opt/homebrew/opt/ruby/bin
export PATH=$PATH:/Users/charlie/.deno/bin
export PATH=$PATH:/Users/charlie/.npm-global/bin
export PATH=$PATH:/Users/charlie/github.com/charlieroth/bin

# ---------- nvm ----------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ---------- aliases ----------
alias gs='git status'
alias gcm='git commit -m'
alias gc='git commit'

alias tks='tmux kill-server'

alias nv='nvim'

alias ls='ls -h --color=auto'

alias chmox='chmod +x'

alias dot='cd $DOT'
