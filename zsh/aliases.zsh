#!/bin/sh

# zsh
alias src='source $ZDOTDIR/.zshrc'

# macos
alias ofd='open $PWD'
alias showfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# eza
alias ls='eza'
alias ll='eza -alhF --icons -s=type --no-user --group-directories-first --git --total-size'
alias la='eza -alhF --icons -s=type --group-directories-first --git --no-permissions --no-filesize --no-user --no-time'
alias l='eza -lhF --icons -s=type --group-directories-first --git --git-ignore --no-permissions --no-filesize --no-user --no-time'
alias ld='eza -F -D'

# batcat
alias cat='bat --theme OneHalfDark'

# vim
alias nv='nvim'
alias vi='nvim'
alias vim='nvim'

# git
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
