if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

if [ -d `brew --prefix`/bin ]; then
    PATH=`brew --prefix`/bin:$PATH
fi

if [ -d "$HOME/.dotfiles/bash_helpers" ]; then
    for file in $HOME/.dotfiles/bash_helpers/*; do
        if [ -f $file ]; then # is a file, not a directory
            echo $file;
        fi
    done
fi

export PATH=./node_modules/.bin:$PATH

# Change the window title of X terminals
case ${TERM} in
        xterm*|rxvt*|Eterm|aterm|kterm|gnome*|interix)
                PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
		use_color=true
                ;;
        screen)
                PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
		use_color=true
                ;;
esac

if ${use_color} ; then
	# set color prompt
        if [[ ${EUID} == 0 ]] ; then
                PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
        else
                PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
        fi

	# enable ls colors
        alias ls='ls -G'
	# enable grep color
        alias grep='grep --colour=auto'
else
        if [[ ${EUID} == 0 ]] ; then
                # show root@ when we don't have colors
                PS1='\u@\h \W \$ '
        else
                PS1='\u@\h \w \$ '
        fi
fi

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
PS1="$RED\$(date +%H:%M) \w$YELLOW\$(__git_ps1) $GREEN\$ \[\033[00m\]"

# Try to keep environment pollution down, EPA loves us.
unset use_color

# improve bash history ;)
shopt -s histappend
PROMPT_COMMAND=$PROMPT_COMMAND';history -a'
# Store 10000 commands in bash history
export HISTFILESIZE=100000
export HISTSIZE=100000
# Don't put duplicate lines in the history
export HISTCONTROL=ignoredups

export EDITOR=nano

