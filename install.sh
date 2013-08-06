#!/bin/env bash

pushd $(dirname $0) &> /dev/null

for dot in $(ls); do
    if [ ! $dot == "README.rst" -a ! $dot == "install.sh" ]; then
        target="$HOME/.$dot"

        # Make a .bak of a file or dir
        if [ ! -h $target ]; then
            if [ -d $target -o -f $target ]; then
                mv $target $target.bak
            fi
        fi

        echo "Setting $dot"
        ln -sf "$PWD/$dot" "$target"
    fi
done

mkdir -p "$HOME/.vim/{bundle,swap,backup,undo}"

if [ ! -d "$HOME/.vim/bundle/vundle" ]; then
    echo "Installing vundle"
    git clone https://github.com/gmarik/vundle.git "$HOME/.vim/bundle/vundle" &> /dev/null
    echo "Now start vim and run:"
    echo ":BundleInstall"
else
    echo "Vundle already installed"
fi

popd &> /dev/null
