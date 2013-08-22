
# access to cli version of currently installed modules for a project
export PATH="./node_modules/.bin:$PATH"

NPM_BIN=$(which npm)
if [ -f "$NPM_BIN" ]; then
    NPM_LINK=$(readlink "$NPM_BIN")
    # resolve link path
    if [[ "$NPM_LINK" == .* ]]; then
        NPM_BIN="$(dirname "$NPM_BIN")/$(dirname "$NPM_LINK")"
        #NPM_BIN="$(cd "$(dirname "$NPM_BIN/")/"; pwd)/completion.sh"
    fi
    if [ -f "$NPM_BIN/../lib/utils/completion.sh" ]; then
        . "$NPM_BIN/../lib/utils/completion.sh"
    fi
    unset NPM_LINK
fi
unset NPM_BIN
