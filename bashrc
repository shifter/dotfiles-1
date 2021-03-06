#!/usr/bin/env bash

# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

export HISTCONTROL=ignorespace

shopt -s histappend
shopt -s checkwinsize

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /usr/local/share/bash-completion/bash_completion ]; then
    . /usr/local/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

reset_color="\e[00m"
vt100_bold="\e[1m"
fg_black="\e[30m"
fg_red="\e[31m"
fg_green="\e[32m"
fg_yellow="\e[33m"
fg_blue="\e[34m"
fg_magenta="\e[35m"
fg_cyan="\e[36m"
fg_white="\e[37m"
bg_black="\e[40m"
bg_red="\e[41m"
bg_green="\e[42m"
bg_yellow="\e[43m"
bg_blue="\e[44m"
bg_magenta="\e[45m"
bg_cyan="\e[46m"
bg_white="\e[47m"
bg_gray="\e[100m"

parse_git_branch() {
    git branch --no-color 2> /dev/null | awk '{ if ($1 == "*" ) { print substr($0, 3) } }'
}

print_git_branch() {
    branch="$(parse_git_branch)"
    if [ -n "$branch" ]
    then
        echo -ne "${fg_green}(${branch})${reset_color}"
    else
        echo -ne "${fg_red}(N/A)${reset_color}"
    fi
}

PS1="\[${fg_yellow}\][ \$(date '+%m/%d %H:%M:%S') ] \[${fg_magenta}\]\u \[${reset_color}\]@ \[${fg_green}\]\h \[${fg_blue}\]\w \$(print_git_branch)\[${vt100_bold}\]\n\$\[${reset_color}\] "
if [ "$(uname)" = "Darwin" ]; then
    alias ls="ls -G"
else
    alias ls="ls --color=auto"
fi
alias tm='tmux -2'
alias tmux='tmux -2'
alias disasm="objdump -D -M intel"

if [ -f ~/.phpbrew/bashrc ]; then
    source ~/.phpbrew/bashrc
fi

if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi

[ -x rvm ] && export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
