#!/bin/sh

ZDOTDIR=~/.config/zsh/

# prompt
eval "$(starship init zsh)"
export PS2='%F{#555}❯❯%f '

# aliases, exports, and completions
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
zsh_add_plugin "zsh-users/zsh-completions"

# completions
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=*r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)EZA_COLORS}"
zmodload zsh/complist
_comp_options+=(globdots) # hidden dot files

# history
HISTSIZE=5000
HISTFILE=$XDG_CONFIG_HOME/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# keybindings
# emacs keybind cheat sheet:
#   C-a move to beginning of line
#   C-e move to end of line
#   M-b move back a word
#   M-f move forward one word
#   C-x C-u undo
#   C-u delete line
#   C-w delete back a word
#   M-d delete forward a word
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# fzf
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi
source <(fzf --zsh)

# zoxide
eval "$(zoxide init --cmd cd zsh)"
