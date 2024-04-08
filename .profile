source ~/.config/fish/config.fish

if [[ "$PLATFORM" == "mac"* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
