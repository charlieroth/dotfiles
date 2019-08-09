# Dotfiles

### Setting up a new machine

- Download
- Install Homebrew: `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && brew --version`
- Install zsh: `brew install zsh
- Install Vim: `brew install vim && vim --version`
- Install tmux: `brew install tmux && tmux --version`
- Install Node: `brew install node && node --version && npm --version && npx --version`
- Install oh-my-zsh: `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
- Install VSCode: `https://code.visualstudio.com/download`
- Install Firefox: `https://www.mozilla.org/en-US/firefox/new/`
- Install Chrome: `https://www.google.com/chrome/`


### Grab them files

```
$ git clone https://github.com/charlieroth/dotfiles.git

$ chmod +x install.sh

$ ./install.sh
```

### VSCode Setup

Add `code` command to `PATH`: `Cmd+Shift+P`, `Shell Command: Install 'code' command in PATH`

Starter `settings.json`

```
{
  "workbench.iconTheme": "file-icons",
  "editor.fontFamily": "Dank Mono, Regular",
  "editor.fontSize": 18,
  "editor.renderWhitespace": "all",
  "editor.fontLigatures": true,
  "editor.folding": true,
  "editor.minimap.enabled": false,
  "editor.hideCursorInOverviewRuler": true,
  "editor.lineHeight": 26,
  "editor.lineNumbers": "off",
  "editor.overviewRulerBorder": false,
  "explorer.openEditors.visible": 0,
  "window.zoomLevel": 0,
  "workbench.activityBar.visible": false,
  "workbench.colorTheme": "Subliminal",
  "workbench.editor.showIcons": false,
  "editor.matchBrackets": false,
  "terminal.integrated.shell.osx": "/bin/zsh",
  "workbench.startupEditor": "newUntitledFile",
  "editor.tabSize": 2,
}
```