# /etc/bash/bashrc.d/99-gentoo-user.bash

if [[ ${TERM} == xterm* ]]; then
	PS1='\[\e[01;30m\]🔥\[\e[01;34m\] \w \$\[\e[00m\] '
else
	PS1='\[\e[01;31m\]\h\[\e[01;34m\] \w \$\[\e[00m\] '
fi

