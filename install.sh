#!/bin/bash
touch ~/.vimrc
touch ~/.bashrc
touch ~/.dircolors

rm ~/.vimrc
rm ~/.bashrc
rm ~/.dircolors

ln -s .vim/.vimrc ~/.vimrc
ln -s .vim/.bashrc ~/.bashrc
ln -s .vim/.dircolors ~/.dircolors

