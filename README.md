# MacOS Setup

## Settings

1. Finder settings
1. OS Settings
1. Keyboard

## Homebrew

1. Install Homebrew

1. Formulae (CLI tools and applications)

   - git
   - exa
   - bat
   - ripgrep
   - fzf
   - zoxide
   - neovim
   - tmux
   - wget
   - tldr
   - lazygit
   - neofetch
   - tree

1. Casks (GUI applications)

   - arc
   - discord
   - firefox-developer-edition
   - fliqlo
   - google-chrome
   - hiddenbar
   - hyperkey
   - iterm2
   - microsoft-excel
   - microsoft-word
   - miniconda
   - notion
   - notion-calendar
   - obsidian
   - raycast
   - slack
   - visual-studio-code
   - zoom

## Terminal

1. Iterm2

   - Settings
   - Theme
   - Nerd font: MesloLGS

1. Zsh

   - zprofile
     - ZDOTDIR
     - eval: brew, conda
   - zshrc
     - setopt: autocd, cdsilent
     - source: aliases, exports, completions
     - vi mode
     - plugins: zsh-syntax-highlighting, zsh-autosuggestions
     - eval: fzf, zoxide, starship
   - aliases
     - src
     - showfiles/hidefiles
     - l/la/ls/ll
     - cat
     - nv/vim/vi/v
     - g/gs/ga/gc/gp
   - exports
     - HISTFILE/HISTSIZE/SAVEHIST
     - EDITOR/VISUAL
     - XDG_CONFIG_HOME
     - LS_COLORS/EXA_COLORS
     - PATH: brew, conda

1. Starship prompt

## Neovim

1. init.lua

   - leader key
   - core.options
   - Lazy
   - plugins
   - core.keymaps
   - ftplugin
   - core.custom

1. options.lua

   - number, relative number
   - sync system clipboard, mouse, backspace
   - expandtab, tabstop, shiftwifth, softtabstop, breakindent, autoindent, smartindent
   - incsearch, hlsearch, ignorecase, smartcase
   - inccommand = 'split'
   - termguicolors, splitright, splitbelow, signcolumn, showmode
   - scrolloff, cursorline
   - updatetime, timeoutlen
   - undodir, undofile
   - virtualedit
   - completeopt
   - iskeyword
   - errorbells, swapfile, backup, autochdir

1. plugins

   - onedark
   - vim-tmux-navigator
   - whichkey
   - autopairs
   - indent-blankline
   - Comment, todo-comments
   - lualine, nvim-tree, nvim-web-devicons
   - treesitter
     - nvim-treesitter, nvim-treesitter-textobjects, nvim-ts-autotag
   - lsp
     - nvim-lspconfig
     - mason, mason-lspconfig
     - neodev
     - fidget
   - cmp
     - nvim-cmp, cmp-nvim-lsp, cmp-buffer, cmp-path, cmp-cmdline
     - LuaSnip, cmp_luasnip, friendly-snippets
     - lspkind
   - telescope, plenary, telescope-fzf-native
   - noice
   - tabout
   - Try: visual line multi, barbecue

1. keymaps.lua

   - Remove 'Q' and 'Space'
   - C-s to save
   - Esc to remove highlight
   - Line wrapping
   - Window resize
   - S-l & S-h for buffer navigation
   - <> for indenting
   - Moving lines
   - Don't copy into register
   - +- to change numbers
   - Close windows and buffers
   - Split vertical and horizontal
   - nn to disable noice
   - C-b to toggle tree
   - Telescope keybinds
   - LSP keybinds

1. ftplugin

   - Makefile: use actual tabs
   - Python: colorcolumn
   - Tabsize for different files

1. custom

   - highlight on yank

## Tmux

- Mouse
- Window numbering
- Shift arrow for window switching
- C-a prefix
- Splitting panes
- Resize panes
- Zoom pane
- Status line
- Plugins:
  - tpm
  - tmux-sensible
  - vim-tmux-navigator
  - tmux-resurrect, tmux-continuum

## Browsers

- Arc
- Firefox Developer Edition
- Google Chrome
- Extensions:
  - uBlock Origin
  - Video Speed Controller
  - Dark Reader
  - Better Canvas
  - Refined Github
  - Leethub
  - Simplify

## VSCode

- General:
  - Atom One Darker Theme
  - vscode-icons
  - Reload
  - TabOut
  - Better Comments
  - Vim
- Python:
  - Python
  - Pylance
  - Python Debugger
  - Pylint
  - Black Formatter
  - isort
  - Python Indent
  - autoDocstring
- C/C++:
  - C/C++
  - CodeLLDB
  - clangd
  - Clang-Format
- Remote:
  - Docker
  - Remote - SSH
  - Remote Explorer
  - Dev Containers
  - Live Share
- Web:
  - Live Preview
  - Prettier
  - Color Highlight
  - ESLint
- Rust:
  - Even Better TOML
