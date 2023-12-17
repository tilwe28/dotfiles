#!/bin/sh

# get git information
autoload -Uz vcs_info
precmd() { vcs_info }

# aliases
source $ZDOTDIR/aliases.zsh

# exports
source $ZDOTDIR/exports.zsh

# git branch
zstyle ':vcs_info:git:*' formats '%b'

# prompt
setopt prompt_subst
PROMPT='%F{magenta}%n%f:%F{blue}%~%f %(?.%F{green}.%F{red})$%f '
RPROMPT='%(?..%F{red}%?%f) %F{green}${vcs_info_msg_0_}'
