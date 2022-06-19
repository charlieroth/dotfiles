export BASH_SILENCE_DEPRECATION_WARNING=1

eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -n "$BASH_VERSION" ] && [ -f $HOME/.bashrc ];then
    source $HOME/.bashrc
fi

