#!/bin/sh

# source
alias src='source $ZDOTDIR/.zshrc'

# eza
alias ls='eza'
alias ll='eza -alhF --icons -s=type --no-user --group-directories-first --git --total-size'
alias la='eza -alhF --icons -s=type --group-directories-first --git --no-permissions --no-filesize --no-user --no-time'
alias l='eza -lhF --icons -s=type --group-directories-first --git --git-ignore --no-permissions --no-filesize --no-user --no-time'
alias ld='eza -F -D'

# batcat
alias cat='batcat --theme OneHalfDark'

# neovim
alias nv='nvim'
alias vim='nvim'
alias vi='nvim'

# git
alias g='git'
alias ga='git add'
alias gs='git status'
alias gc='git commit'
alias gp='git push'
