# OSX Setup

## Installation

```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/tilwe28/dotfiles/mac/install.sh)
```

## Homebrew

```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- enable `zsh` [completion](https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh)

## Git

```bash
$ git clone https://github.com/tilwe28/dotfiles.github
./install.sh
```

## What's Installed

#### Formulae
- git
  - global config
    - username
    - email
    - editor
    - excludesfile
- wget
- python
- ripgrep
- fzf
  - alias for interactive search with preview
    - bat for syntax highlighting
- fd
- gcc
- btop
- zoxide
- eza
- bat
- tldr
- nvm
- neovim
- lazygit
- yazi
- sevenzip
- jq
- poppler
- watchman

#### Casks
- wezterm
- arc
- google-chrome
- visual-studio-code
  - symlink to dotfiles settings.json
- raycast
- rectangle
- aldente
- hiddenbar
- betterdisplay
- logitech-options
- hyperkey
- fliqlo
- notion
- figma
- zoom
- microsoft-word

## App Specific Confirugation

#### Wezterm
- Custom theme and colors
- Font: FiraCode Nerd Font Mono
- Window settings
- Native multiplexer
- Neovim integration

#### ZSH
- zprofile
    - XDG_CONFIG_HOME
    - ZDOTDIR
    - homebrew
    - nvm
    - GPG_TTY
- Sensible aliases
- Modern replacements
    - cd -> z (zoxide)
    - ls -> eza
    - cat -> bat
    - find -> fd
    - ...
- zinit plugin manager
- Plugins:
    - zsh-syntax-highlighting
    - zsh-autosuggestions
    - zsh-completions
    - fzf-tab
- History configuration
- Emacs keybindings

#### Raycast

- Keyboard shortcuts to launch applications
- Extensions
  - Arc: open new blank window
  - Brew
  - VSCode

#### Browser Extensions

- uBlock Origin
- Video Speed Controller
- Refined Github
- Leethub v2
- Simplify
- Better Canvas
- Dark Reader

