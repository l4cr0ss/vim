#!/bin/bash
set -e

DIR="$(cd "$(dirname "$0")" ; pwd -P)"

function status {
    echo "[*]" $@
}

# Setup symlinks
for file in $DIR/*; do
    filename=$(basename $file)
    if [[ "$filename" != "$(basename $0)" ]]; then
        if [ -e $HOME/.$filename ]; then
            if ! [[ -L $HOME/.$filename ]]; then
              # remove existing dotfile
              rm $HOME/.$filename
              status "deleted existing file $HOME/.$filename"
            else
              status "symlink for .$filename exists"
              continue
            fi
        fi
        status "installing $filename --> .$filename"
        ln -s $DIR/$filename $HOME/.$filename
    fi
done

