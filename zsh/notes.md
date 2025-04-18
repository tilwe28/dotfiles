# PROMPT
- %m hostname
- %n username
- %? return status
- %~ cwd relative to home
    - num after '%' specified number of trailing dirs
- PS3 used in select command
- %B bold, %U underline, %S standout, %F fg color, %K bg color, %E clear
    - lowercase to end style
- %(x.T.F) is a ternary

precmd() { print "" }
NEWLINE=$'\n'
PS1="%F{blue}%~%f%(?.. %F{red}%?)%f${NEWLINE}%F{magenta}❯%f "
directory: %F{blue}%~%f
exit code: %(?.. %F{red}%?%f)
git branch
exec time
prompt char: ${NEWLINE}%F{magenta}❯%f 


# INTERACTIONS
bindkey -v
bindkey -M vicmd '^Y' redo
alias -g ...='../..'

HISTFILE
HISTSIZE
SAVEHIST

- !! repeats previous command
- !str refers to most recent command starting with str

# OPTIONS
- prefix with 'no' to invert or do 'unsetopt'

- auto_cd changes into dir without specifying cdpath
- auto_pushd makes cd push old dir onto dir stack 
- cd_silent
- pushd_ignore_dups

- glob_dots include dotfiles in glob pattern

- append_history
- hist_ignore_all_dups
- hist_ignore_dups
- hist_ignore_space
- hist_save_no_dups
- share_history

- correct
- correct_all
- interactive_comments

- beep

# BUILTINS
- exec replaces current shell process with command
- whence (where = whence -ca) (which = -c)

# HOOK FUNCTIONS
- chpwd: before cwd is changed
- precmd: before each prompt
- preexec: before command is executed

# COMPLETIONS

# ZLE

# SHELL PARAMETERS
- ! PID of last bg command
- '#' length
- $ PID of current shell
- 0 name of shell
- _ last argument of previous command
- CPUTYPE, HOST, LOGNAME, MACHTYPE, OSTYPE, VENDOR
- OLDPWD, PWD
- RANDOM random int from 0 to 32767 (2^15 - 1)
- signals

- cdpath
- fc builtin to quickly edit the previous command


# MATH
- $(( )) does math
- let "" or (( )) assigns a variable to a value
- zmodload zsh/mathfunc


# REDIRECTION
### HERE-DOC
```bash
$ cat << EOF
line1
line2
EOF
```
- ignoring tabs
```bash
$ cat <<- EOF
line1
    line2
EOF
```

- supports substitution
- parameter substitution using ${}
- command substitution using $()
- $, \, and ` are special characters and must be escaped
    - to always escape these (which disables substitution)
    1. << 'EOF' (or "EOF")
    2. << \EOF

- HERE-STRINGs are similar but w/o delimeter `<<<`

- quickly read or write to a file
```bash
$ < file_r
This is the contents of "file_r"

$ > file_w
I am currently writing this to the file
```

### NULL COMMAND
- does nothing and always returns success
```bash
$ :
```
- can be used to as a block comment
```bash
: << 'DISABLED'
echo foo
echo bar
DISABLED
```

# TRAP FUNCTIONS
- TRAP___ to run commands on certain signals (Ex: TRAPINT for SIGINT)
- TRAPZERR whenever a command returns non-zero

