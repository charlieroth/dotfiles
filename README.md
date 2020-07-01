# Dotfiles

## Setting up a new machine

- Install Alfred: `https://www.alfredapp.com`
- Install Homebrew: `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && brew --version`
- Install zsh: `brew install zsh
- Install Vim: `brew install vim && vim --version`
- Install Node: `brew install node && node --version && npm --version && npx --version`
- Install oh-my-zsh: `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
- Install Chrome: `https://www.google.com/chrome/`

## Grab them files

``` bash
git clone https://github.com/charlieroth/dotfiles.git

$ chmod +x install.sh

$ ./install.sh
```

## VSCode Setup

Add `code` command to `PATH`: `Cmd+Shift+P`, `Shell Command: Install 'code' command in PATH`

### List of Extensions

- Auto Close Tag
- Babel Javascript
- ESLint
- file-icons
- GraphQL for VSCode
- Latest Typescript and Javascript Grammar
- Subliminal
- Terminal
- TSLint
- TypeScript Hero
- Vim
- vscode-icons

### Starter `settings.json`

```json
{
  "editor.fontFamily": "Dank Mono, Regular",
  "editor.fontSize": 18,
  "editor.renderWhitespace": "all",
  "editor.fontLigatures": true,
  "editor.folding": true,
  "editor.hideCursorInOverviewRuler": true,
  "editor.lineHeight": 26,
  "editor.lineNumbers": "off",
  "editor.matchBrackets": false,
  "editor.minimap.enabled": false,
  "editor.overviewRulerBorder": false,
  "editor.tabSize": 2,
  "explorer.openEditors.visible": 0,
  "terminal.integrated.shell.osx": "/bin/zsh",
  "window.zoomLevel": 0,
  "workbench.activityBar.visible": false,
  "workbench.colorTheme": "Subliminal",
  "workbench.editor.showIcons": false,
  "workbench.iconTheme": "file-icons",
  "workbench.startupEditor": "newUntitledFile",
}
```
