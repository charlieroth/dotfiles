# Dotfiles

Dotfiles and tools I usually install when setting up a new machine

## Using This Repo
``` bash
> git clone https://github.com/charlieroth/dotfiles.git ~/char/dotfiles
> cd ~/char/dotfiles
> chmod +x install.sh
> sh install.sh
```


# Software To Install (MacOS)

## Raycast

A blazingly fast, totally extendable launcher. It lets you complete tasks, calculate, share common links, and much more

Download: `https://www.raycast.com/`


## Homebrew

MacOS package manager

Installation:
```bash
> /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
> brew --version
> brew install python@3.9 go gopls lazygit gh rust-analyzer sqlite deno neovim lua-language-server tree tree-sitter
```

## Oh My Zsh

Framework for managing `zsh` configuration

Installation:
```bash
> sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
```


## Neovim, Lua

Vim-fork focused on extensibility and usability

Install: `https://github.com/neovim/neovim/wiki/Installing-Neovim`


## Node

JavaScript runtime built on Chrome's V8 JavaScript Engine

[Install & Update NVM](https://github.com/nvm-sh/nvm#installing-and-updating)

Installation:
```bash
> curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash`
```

Confirm Installation:
```bash
> nvm list
> nvm install node
```
