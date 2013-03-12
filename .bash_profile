#!/usr/bin/env bash

if [ -d "$HOME/.dotfiles/bash_config" ]; then
    for file in $HOME/.dotfiles/bash_config/*; do
        # is a file, not a directory : allow scripts to be divided in directories :)
        if [ -f $file ]; then
            . $file
        fi
    done
fi
unset file
