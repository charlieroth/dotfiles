`dotfiles` and tools to install when setting up a machine

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
        sqlite \
        deno \
        neovim \
        lua-language-server \
        tree \
        tree-sitter \
        ripgrep
```

## Dotfiles

``` bash
> cd $HOME
> mkdir git && cd git
> mkdir charlieroth && cd charlieroth
> git clone https://github.com/charlieroth/dotfiles.git
> chmod +x setup.sh
> ./setup.sh
```

## NVM (Node Version Manager)

[Docs](https://github.com/nvm-sh/nvm)

```bash
> curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
> which nvim
> nvm list
> nvm install node
```
