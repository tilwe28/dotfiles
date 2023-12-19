#!/bin/sh

# git
autoload -Uz vcs_info
precmd() { 
    vcs_info 
}

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%b%u%c'
zstyle ':vcs_info:*' check-for-changes true

# prompt
setopt prompt_subst
NEWLINE=$'\n'
# normal colors:
# black, red, green, yellow, blue, magenta, cyan, white
#   000, 001,   002,    003,  004,     005,  006,   007
# bright colors just add 8
PROMPT='${NEWLINE}%F{012}%~ %(?.%F{green}.%F{red})$%f '
RPROMPT='%(?..%F{red}%?%f) %F{green}${vcs_info_msg_0_}'

# aliases
source $ZDOTDIR/aliases.zsh

# exports
source $ZDOTDIR/exports.zsh

# tab completion
source $ZDOTDIR/completions.zsh

# plugins
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
