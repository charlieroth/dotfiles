# Dotfiles

Dotfiles and tools I usually install when setting up a new machine

## Using This Repo
``` bash
$ git clone https://github.com/charlieroth/dotfiles.git ~/char/dotfiles

$ cd ~/char/dotfiles

$ chmod +x install.sh

$ sh install.sh
```


# Software To Install (MacOS)

## Raycast

A blazingly fast, totally extendable launcher. It lets you complete tasks, calculate, share common links, and much more

Download: `https://www.raycast.com/`


## Homebrew

MacOS package manager

Installation: `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && brew --version`

```bash
> brew install python@3.9 tmux tmuxinator go gopls lazygit rust-analyzer sqlite deno neovim lua-language-server tree tree-sitter
```

## Oh My Zsh

Framework for managing `zsh` configuration

Install: `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`


## Neovim, Lua

Vim-fork focused on extensibility and usability

Install: `https://github.com/neovim/neovim/wiki/Installing-Neovim`


## Node

JavaScript runtime built on Chrome's V8 JavaScript Engine

[Install & Update NVM](https://github.com/nvm-sh/nvm#installing-and-updating)

Download: `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash`

Add the following source lines at bottom of `~/.zshrc`

``` bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

Get latest stable: `nvm install node`
