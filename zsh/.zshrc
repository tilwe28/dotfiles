#!/bin/sh

ZDOTDIR=~/.config/zsh

# fallback prompt
# local NEWLINE=$'\n'
# PROMPT='${NEWLINE}  %F{012}%~ %(?.%F{green}.%F{red})$%f %E'

# aliases and exports
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/exports.zsh

# plugins
function zsh_add_plugin() {
    local PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
        source "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
            source "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}

zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-autosuggestions"

# completions
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' '' 'r:|[._-]=*r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)EZA_COLORS}"
zmodload zsh/complist
_comp_options+=(globdots) # hidden dot files

# history
HISTFILE=~/.cache/zsh/history
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# fzf
if [[ ! "$PATH" == */home/tilwe/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/tilwe/.fzf/bin"
fi
source <(fzf --zsh)

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# starship
eval "$(starship init zsh)"
