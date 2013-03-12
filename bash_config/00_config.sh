
# improve bash history ;)
shopt -s histappend
PROMPT_COMMAND=$PROMPT_COMMAND';history -a'
# Store 10000 commands in bash history
export HISTFILESIZE=100000
export HISTSIZE=100000
# Don't put duplicate lines in the history
export HISTCONTROL=ignoredups

export EDITOR=nano
