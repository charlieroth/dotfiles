# Only run on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

[[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"

if [ -r ~/.bashrc ]; then
  source ~/.bashrc
fi

export XDG_CONFIG_HOME="$HOME"/.config

# initialize pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/charlie/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
