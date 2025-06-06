alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ls='eza -lh --group-directories-first --icons'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'

alias c='clear'

alias ff="fzf --preview 'batcat --style=numbers --color=always {}'"
alias diff='diff --color'

alias v=nvim
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
