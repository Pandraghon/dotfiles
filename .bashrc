#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.bashrc.colors ]] && . ~/.bashrc.colors

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# System info
# `pacman -S neofetch`
[[ -f /usr/bin/neofetch ]] && echo && /usr/bin/neofetch -w

# Pseudorandom message
# `pacman -S fortune-mod`
[[ -f /usr/bin/fortune ]] && echo && /usr/bin/fortune -a

alias ls='ls --color=auto'

function customize_prompt {
	local __last_status='`if [ \$? = 0 ]; then echo \[\e[33m\]✔\[\e[0m\]; else echo \[\e[31m\]✘\[\e[0m\]; fi`'
	local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/─[\[\e[1\;32m\]\\\\\1\[\e[0m\]]\ /`'
	export PS1="┌─[$__last_status]\n├─[\[\e[36m\]\t\[\e[0m\]]—[\[\e[1;28m\]\u\[\e[0m\]@\[\e[1;34m\]\h\[\e[0m\]]—[\[\e[34m\]\w\[\e[0m\]]$__git_branch\n└▶ \[\e[37m\]\$\[\e[0m\] "
}
customize_prompt

if [ -e ~/.bashrc.aliases ] ; then
   source ~/.bashrc.aliases
fi

BROWSER=/usr/bin/firefox
EDITOR=/usr/bin/vim

#export PATH="$PATH:~/bin"

# Autocomplete for tldr
complete -W "$(tldr 2>/dev/null --list)" tldr

eval "$(dircolors)"
