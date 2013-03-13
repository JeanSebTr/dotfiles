
function _after_cd_projects()
{
    export WORKSPACE=""
    export PROJECT=""
    local _path="$PWD"
    if [ ! -d "$_path" ]; then
        _path=$(dirname "$_path")
    fi
    while [ "$_path" != "/" ]; do
        if [ -d "$_path/.project" ] && [ "$PROJECT" == "" ]; then
            export PROJECT="$_path/.project"
            export PROJECT_NAME=$(cat "$PROJECT/name")
        fi
        if [ -d "$_path/.workspace" ] && [ "$WORKSPACE" == "" ]; then
            export WORKSPACE="$_path/.workspace"
            export WORKSPACE_NAME=$(cat "$WORKSPACE/name")
        fi
        _path=$(dirname "$_path")
    done
}
export AFTER_DIRECTORY_CHANGE="$AFTER_DIRECTORY_CHANGE _after_cd_projects"
