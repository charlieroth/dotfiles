if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

if [[ "$PLATFORM" == "mac"* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
