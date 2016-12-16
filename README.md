.vim
====

Although it's called .vim, this repository also contains a few other dotfiles
(.bashrc and .dircolors).

Included in the repository is an install script that "installs" the dotfiles as
symlinks into the repository.

The install script works by touching each of the dotfiles (to ensure their
existence), removing each of the dotfiles, then creating a symlink for each
dotfile (Why does it do this? Because at the time, I didn't know about ln's
"-f" flag).

This all happens inside of the user's home directory, so if you are going to
run the script make sure that whatever already exists in those three locations
(~/.vimrc, ~/.bashrc, ~/.dircolors) has been backed up somewhere.
