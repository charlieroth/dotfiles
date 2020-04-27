# Dotfiles

## Setting up a new machine

- Install Alfred: `https://www.alfredapp.com`
- Install Homebrew: `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && brew --version`
- Install zsh: `brew install zsh`
- Install Vim: `brew install vim && vim --version`
- Install tmux: `brew install tmux && tmux --version`
- Install Node: `brew install node && node --version && npm --version && npx --version`
- Install oh-my-zsh: `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
- Install VSCode: `https://code.visualstudio.com/download`
- Install Firefox: `https://www.mozilla.org/en-US/firefox/new/`
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
- GraphQL for VSCode
- Terminal
- TSLint
- TypeScript Hero
- Vim
- npm Intellisense
- vscode-icons

### Starter `settings.json`

```json
{
    "editor.fontSize": 16,
    "editor.minimap.enabled": false,
    "editor.fontLigatures": true,
    "editor.fontFamily": "Dank Mono",
    "editor.fontWeight": "600",
    "editor.overviewRulerBorder": false,
    "editor.hideCursorInOverviewRuler": true,
    "editor.occurrencesHighlight": false,
    "editor.matchBrackets": "always",
    "editor.glyphMargin": true,
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "esbenp.prettier-vscode",
    "editor.codeActionsOnSave": {
        "source.fixAll.tslint": true,
        "source.organizeImports": true
    },
    "editor.renderWhitespace": "none",
    "explorer.openEditors.visible": 0,
    "explorer.confirmDelete": false,
    "[javascript]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "[typescript]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode",
    },
    "typescript.updateImportsOnFileMove.enabled": "always",
    "workbench.colorCustomizations": {
        "editor.selectionBackground": "#1355647a",
        "editor.selectionHighlightBackground": "#1355647a"
    },
    "workbench.startupEditor": "newUntitledFile",
    "workbench.colorTheme": "Monokai Pro",
    "workbench.activityBar.visible": true,
    "workbench.editor.showIcons": true,
    "workbench.editor.tabCloseButton": "right",
    "workbench.statusBar.visible": true,
    "window.zoomLevel": 0,
    "vim.easymotion": true,
    "vim.sneak": true,
    "vim.incsearch": true,
    "vim.useSystemClipboard": true,
    "vim.useCtrlKeys": true,
    "vim.hlsearch": true,
    "vim.insertModeKeyBindings": [
        {
            "before": ["j", "k"],
            "after": ["<Esc>"]
        }
    ],
    "vim.leader": ",",
    "vim.handleKeys": {
        "<C-a>": false,
        "<C-f>": false
    },
    "explorer.confirmDragAndDrop": false,
    "workbench.editor.showTabs": false,
    "workbench.iconTheme": "Monokai Pro Icons",
    "workbench.panel.defaultLocation": "right",
    "typescriptHero.imports.insertSemicolons": false,
    "typescriptHero.imports.insertSpaceBeforeAndAfterImportBraces": false,
    "typescriptHero.imports.multiLineTrailingComma": false,
    "typescriptHero.imports.stringQuoteStyle": "\"",
    "typescriptHero.imports.removeTrailingIndex": false,
    "typescript.format.insertSpaceAfterConstructor": true,
    "prettier.tabWidth": 4,
}
```
