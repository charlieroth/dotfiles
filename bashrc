# ---------- variables ----------
export USER="${USER:-$(whoami)}"

export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export DOT="$HOME/git/charlieroth/dotfiles"

export HRULEWIDTH=73

export EDITOR=nvim
export VISUAL=nvim
export TERM=xterm-256color

export GOPATH="$HOME/.local/share/go"
export GOBIN="$HOME/.local/bin"
export GOPROXY=direct
export CGO_ENABLED=0

# ---------- functions ----------
PROMPT_LONG=20
PROMPT_MAX=95
PROMPT_AT=@
set_prompt() {
    local P='>' dir="${PWD##*/}" B countme short long double\
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
    [[ -n "$B" ]] && B="($B)"

    long="\u:$dir$B\n$P "
    PS1="$long"
}

prompt_command() {
    set_prompt
}

export PROMPT_COMMAND=prompt_command

# ---------- path ----------
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/opt/homebrew/opt/ruby/bin
export PATH=$PATH:/Users/charlie/.deno/bin
export PATH=$PATH:/Users/charlie/.local/bin
export PATH=$PATH:/Users/charlie/.npm-global/bin
export PATH=$PATH:/Users/charlie/git/charlieroth/bin
export PATH=$PATH:/Users/charlie/git/ziglang/zig
export PATH=$PATH:/Users/charlie/git/zigtools/zls/zig-out/bin
export PATH=$PATH:/Users/charlie/.bun/bin
export PATH=$PATH:/Applications/Julia-1.8.app/Contents/Resources/julia/bin
export PATH=$PATH:/Users/charlie/.cargo/env
export PATH=$PATH:/opt/homebrew/opt/llvm/bin

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# ---------- node version manager ----------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ---------- aliases ----------
alias tks='tmux kill-server'
alias vim='nvim'
alias gs='git status'
alias gcm='git commit -m'
alias gc='git commit'
alias ls='ls -h --color=auto'
alias cl='clear'
alias chmox='chmod +x'
alias dot='cd $DOT'
alias python='python3'
