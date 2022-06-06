# Dotfiles

Dotfiles and tools I usually install when setting up a new machine


## Raycast

A blazingly fast, totally extendable launcher. It lets you complete tasks, calculate, share common links, and much more

Download: `https://www.raycast.com/`

## Kitty

The fast, feature-rich, GPU based terminal emulator

[Docs](https://sw.kovidgoyal.net/kitty/)

## Homebrew

Installation:
```bash
> /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
> brew --version
> brew install python@3.9 \
        go \
        gopls \
        lazygit \
        gh \
        rust-analyzer \
        sqlite \
        deno \
        neovim \
        lua-language-server \
        tree \
        tree-sitter \
        ripgrep \
        netlify-cli
```

## Fish & oh-my-fish

```bash
> brew install fish
> which fish
> sudo echo "$(which fish)" >> /etc/shells
> chsh -s /opt/homebrew/bin/fish
```

## Dotfiles

``` bash
> cd $HOME
> mkdir github.com && cd github.com
> mkdir charlieroth && cd charlieroth
> git clone https://github.com/charlieroth/dotfiles.git
> chmod +x setup.sh
> ./setup.sh
```

## NVM (Node Version Manager)

[Install & Update](https://github.com/nvm-sh/nvm#installing-and-updating)

Installation:
```bash
> curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | fish`
```

Confirm Installation:
```bash
> nvm list
> nvm install node
```
