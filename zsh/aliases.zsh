#!/bin/sh

# zsh
alias src='source $ZDOTDIR/.zshrc'

# list (use exa instead of ls)
# man 5 exa_colors to customize colors and LS_COLORS
alias ls='exa -s=type' # alias ls='ls -CF --color=auto'
alias ll='exa -lah --icons -s=type --no-user' # alias ll='ls -alF --color=auto'
alias la='exa -lah --icons -s=type --no-user' # alias la='ls -A --color=auto'
alias l='exa -lh --icons -s=type --no-user' # alias l='ls -ltrF --color=auto'

# cat/bat
alias bat='cat'

# vim
alias nv='nvim'

# git
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
