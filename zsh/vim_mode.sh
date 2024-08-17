#!/bin/zsh
#-------------------------------------------------------------
# This script enables vim mode & allows the cursor to
# change according to whether it is on vim mode or not
#-------------------------------------------------------------

bindkey -v

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

zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}

zle -N zle-keymap-select

zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

