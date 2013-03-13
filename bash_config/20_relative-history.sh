
function _after_cd_relative_history()
{
    history -a
    # try to put history in project OR workspce OR userdir
    if [ -d "$PROJECT" ]; then
        touch "$PROJECT/bash_history" 2>/dev/null && export HISTFILE="$PROJECT/bash_history" || export HISTFILE="$HOME/.bash_history";
    elif [ -d "$WORKSPACE" ]; then
        touch "$WORKSPACE/bash_history" 2>/dev/null && export HISTFILE="$WORKSPACE/bash_history" || export HISTFILE="$HOME/.bash_history";
    else
        export HISTFILE="$HOME/.bash_history"
    fi
    history -c
    history -r
}
export AFTER_DIRECTORY_CHANGE="$AFTER_DIRECTORY_CHANGE _after_cd_relative_history"

shopt -s histappend
export HISTTIMEFORMAT='%F %T '
# Store 10000 commands in bash history
export HISTFILESIZE=100000
export HISTSIZE=100000
# Don't put duplicate lines in the history
export HISTCONTROL=ignoreboth
export PROMPT_COMMAND="$PROMPT_COMMAND; history -a"
