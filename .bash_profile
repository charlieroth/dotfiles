# Only run on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  # needed for brew
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -r ~/.bashrc ]; then
  source ~/.bashrc
fi

export XDG_CONFIG_HOME="$HOME"/.config
. "$HOME/.cargo/env"
export MODULAR_HOME="/home/charlie/.modular"
export PATH="/home/charlie/.modular/pkg/packages.modular.com_mojo/bin:$PATH"
