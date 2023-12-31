#!/bin/sh

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' '' 'r:|[._-]=*r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
_comp_options+=(globdots) # hidden dot files
