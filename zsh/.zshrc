# tmux
export TMUX_CONF=~/.config/tmux/tmux.conf

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

alias c='clear'

# batcat
export BAT_THEME="OneHalfDark"
alias cat='bat'

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

# git
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr "*"
zstyle ':vcs_info:*' stagedstr "+"
# zstyle ':vcs_info:git*' formats "%F{blue}%r/%S %F{green}%b%F{yellow}%u%c%f"
zstyle ':vcs_info:git*' formats "%F{#555}%b%u%c%f"
zstyle ':vcs_info:git*' actionformats "%F{green}%b%F{yellow}%u%c%f(%F{red}%a%f)"

# function to format directory in prompt
fmt_vcs_dir() {
    local git_path
    git_path=$(git rev-parse --show-toplevel 2>/dev/null) || {
        # not in a git repo
        print -r -- "%~"
        return
    }

    local root_dir sub_dirs
    root_dir=${git_path:t}
    if [[ "$PWD" == "$git_path" ]]; then
        # at root of repo
        print -n -- "%B${root_dir}%b"
    else
        # in subdirectory of repo
        sub_dirs=${PWD#$git_path/}
        print -n -- "%B${root_dir}%b/${sub_dirs}"
    fi

    # if in git repo, display vcs_info_msg_0_
    [[ -n $vcs_info_msg_0_ ]] && print -n -- " ${vcs_info_msg_0_}"
}

# prompt
precmd() { 
    print ""
    vcs_info
}
setopt prompt_subst

NEWLINE=$'\n'
# export PS1='%F{blue}${vcs_info_msg_0_:-%~}%f %(?.. %F{red}%?)%f${NEWLINE}%F{magenta}❯%f '
export PS1='%F{blue}$(fmt_vcs_dir)%f%(?.. %F{red}%?)%f${NEWLINE}%F{magenta}❯%f '
export PS2='%F{#555}❯❯%f '

# plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

zinit light "Aloxaf/fzf-tab"
zinit light "zsh-users/zsh-syntax-highlighting"
zinit light "zsh-users/zsh-autosuggestions"
zinit light "zsh-users/zsh-completions"

# completions
autoload -Uz compinit && compinit
zinit cdreplay -q

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

export FZF_DEFAULT_OPTS="--height=-10% --reverse"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# zoxide
eval "$(zoxide init --cmd cd zsh)"
