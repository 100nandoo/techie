#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
COLOR1="$(tput setaf 15)"
COLOR2="$(tput setaf 5)"
RESET="$(tput sgr0)"

#default prompt
#PS1='[\u@\h \W]\$ '

PS1='\[$COLOR1\][\u]\[$COLOR2\] \W \[$COLOR1\]> $RESET'
