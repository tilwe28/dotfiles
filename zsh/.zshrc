#!/bin/sh

ZDOTDIR=~/.config/zsh/

# git
autoload -Uz vcs_info
precmd() { 
    vcs_info 
    COURSE='%~'
    if [[ $PWD == ~/dev/umich/* ]] then
        local curr_dir=${PWD/#$HOME\//}
        local c_path=${curr_dir#dev/umich/}
        COURSE=${c_path#/}
    fi
}

setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats '%F{green} %B%b%F{yellow}%u%c'

# prompt
NEWLINE=$'\n'
# normal colors:
# black, red, green, yellow, blue, magenta, cyan, white
#   000, 001,   002,    003,  004,     005,  006,   007
# bright colors just add 8
PROMPT='${NEWLINE}  %F{012}${COURSE} %(?.%F{green}.%F{red})$%f %E'
RPROMPT='%(?..%F{red}%?%f) ${vcs_info_msg_0_}%b'

# options
setopt autocd
setopt cdsilent

# aliases, exports, and completions
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/exports.zsh
source $ZDOTDIR/completions.zsh

# cdpath
setopt auto_cd
cdpath=($HOME/dev/umich)

# vi mode
bindkey -v
export KEYTIMEOUT=1
# Change cursor shape for different vi modes
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
        [[ $1 = 'block' ]]; then
            echo -ne '\e[1 q'
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
                    echo -ne '\e[5 q'
    fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt

# plugins
function zsh_add_plugin() {
    # source $ZDOTDIR/plugins/$PLUGIN_NAME
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
        source "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
            source "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
                else
                    git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}

zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
