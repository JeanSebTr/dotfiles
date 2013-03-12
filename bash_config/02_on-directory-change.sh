
function directoryChange()
{
    # before hookts
    for cmd in $BEFORE_DIRECTORY_CHANGE; do
        $cmd "$@"
    done
    # do actual cd
    builtin cd "$@"
    # after hookts
    for cmd in $AFTER_DIRECTORY_CHANGE; do
        $cmd "$@"
    done

    unset cmd
}
alias cd="directoryChange"
