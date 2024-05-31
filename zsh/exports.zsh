

export EDITOR="nvim"
export VISUAL="nvim"

export XDG_CONFIG_HOME="$HOME/.config"

export PATH="$PATH:/home/tilwe/.local/bin"

# starship
export STARTSHIP_CONFIG=$XDG_CONFIG_HOME/starship.toml

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

# node
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tilwe/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tilwe/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tilwe/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tilwe/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
