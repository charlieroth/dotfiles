if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias v="nvim"
alias ip='ip -c'
alias free='free -h'
alias tree='tree -a'
alias chmox='chmox +x'
alias diff='diff --color'
alias c='clear'

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

# git
alias gs="git status"
