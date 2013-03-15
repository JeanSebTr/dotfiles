
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

if [ -d `brew --prefix`/bin ]; then
    PATH=`brew --prefix`/bin:$PATH
fi
