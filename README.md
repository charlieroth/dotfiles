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
    "editor.overviewRulerBorder": false, // removes border from overview ruler (located on the right, same position as the scrollbar)
    "editor.hideCursorInOverviewRuler": true, // hides cursor mark in the overview ruler
    "editor.occurrencesHighlight": false, // removes highlights occurrences (still works when you select a word)
    "editor.matchBrackets": "always", // removes the highlight of matching brackets (I use Subtle Match Brackets extension for this)
    "editor.glyphMargin": true, // removes the space used mainly for debugging indicators
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "esbenp.prettier-vscode",
    "editor.codeActionsOnSave": {
        "source.fixAll.tslint": true,
        "source.organizeImports": true
    },
    "editor.renderWhitespace": "none",
    "explorer.openEditors.visible": 0, // removes the open editors section at the top of the sidebar, you can see the opened files with ⌘ + ⌥ + Tab
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
    "workbench.activityBar.visible": true, // removes the activity bar (the 4 icons at the left of the screen), so now you will have to open the explorer, git, debugger and extension with shortcuts or through the Command Palette
    "workbench.editor.showIcons": true, // removes icon from opened files in tabs
    "workbench.editor.tabCloseButton": "right", // removes cross icon from tabs
    "workbench.statusBar.visible": true, // removes the status bar
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
