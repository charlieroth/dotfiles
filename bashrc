# vim
alias vim="vim -u ~/dotfiles/.vimrc"
alias vrc="vim ~/dotfiles/.vimrc"
alias svrc="source ~/dotfiles/.vimrc"

# bash_profile
alias vbash="vim ~/.bash_profile"
alias sbash="source ~/.bash_profile"

# purdue
alias purdue="ssh roth47@data.cs.purdue.edu"

# git
alias gst="git status"
alias gct="git checkout"
alias gb="git branch"
alias gc="git commit"
alias gcm="git commit -m"
alias gcam="git commit -am"
alias gpho="git push origin"
alias gplo="git pull origin"

# tmux
alias mux="tmux"
alias muxh="tmux new-session \; split-window -v \;"
alias muxv="tmux new-session \; split-window -h \;"
alias muxk="tmux kill-server"

# directory shortcuts
alias wisely-api="cd ~/dev/school/cs408/wisely-api"
alias wisely="cd ~/dev/school/cs408/wisely"

alias polls-api="cd ~/dev/school/cs407/polls-api"
alias polls="cd ~/dev/school/cs407/polls"

# nvm
nvm use >/dev/null
source /Users/charlie/alacritty-completions.bash
