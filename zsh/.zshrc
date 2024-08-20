# prompt
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"
export PS2='%F{#555}❯❯%f '

# macos
alias ofd='open $PWD'
alias showfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# eza
export EZA_COLORS="\
di=01;38;5;39:fi=00:ex=03;92:\
ln=38;5;91:lp=95:or=09;38;5;91:\
ur=90:uw=90:ux=90:ue=90:\
gr=90:gw=90:gx=90:\
tr=90:tw=90:tx=90:\
sn=90:ng=38;5;124:nt=38;5;196:ug=38;5;124:ut=38;5;196:\
ga=38;5;124:gm=22;38;5;226:gd=09;38;5;124:gv=36:gi=90:gc=41:\
da=90:\
hd=04;37:\
im=38;5;117:vi=38;5;135:mu=38;5;225:lo=38;5;225:\
cr=38;5;98:\
do=38;5;166:\
co=38;5;130:\
tm=38;5;237:\
cm=38;5;88:bu=04:sc=38;5;214"
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

# environment variables
export EDITOR="nvim"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

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

autoload -Uz compinit && compinit

zsh_add_plugin "Aloxaf/fzf-tab"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-completions"


# completions
zstyle ':completion:*' menu no
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=*r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)EZA_COLORS}"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
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
