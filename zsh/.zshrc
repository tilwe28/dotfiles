#!/bin/sh

# git
autoload -Uz vcs_info
precmd() { 
    vcs_info 
}

setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats '%F{green}%B%b%F{yellow}%u%c'

# prompt
NEWLINE=$'\n'
# normal colors:
# black, red, green, yellow, blue, magenta, cyan, white
#   000, 001,   002,    003,  004,     005,  006,   007
# bright colors just add 8
PROMPT='${NEWLINE} %F{010}󰣭 %F{012}%~ %(?.%F{green}.%F{red})$%f %E'
RPROMPT='%(?..%F{red}%?%f) ${vcs_info_msg_0_}%b'

# options
setopt autocd
setopt cdsilent

# aliases, exports, and completions
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/exports.zsh
source $ZDOTDIR/completions.zsh

# plugins
function zsh_add_plugin() {
    # source $ZDOTDIR/plugins/$PLUGIN_NAME
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
        source "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        source "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}

zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
source $ZDOTDIR/plugins/dirhistory.plugin.zsh
