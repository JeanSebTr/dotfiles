
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
    RED="\[\033[31m\]"
    YELLOW="\[\033[33m\]"
    GREEN="\[\033[32m\]"
    # enable ls colors
    alias ls='ls -G'
    # enable grep color
    alias grep='grep --colour=auto'
fi

if [[ ${EUID} == 0 ]] ; then
        PS1="$RED\$(date +%H:%M) \w$YELLOW\$(__git_ps1) $GREEN#\[\033[m\] "
else
        PS1="$RED\$(date +%H:%M) \w$YELLOW\$(__git_ps1) $GREEN\$\[\033[m\] "
fi

# Try to keep environment pollution down, EPA loves us.
unset use_color
unset RED
unset YELLOW
unset GREEN
