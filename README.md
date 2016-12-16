.vim
====

Although it's called .vim, this repository also contains a few other 
dotfiles - .bashrc and .dircolors to be exact. 

Included in the repository is an install script that "installs" the 
dotfiles as symlinks into the repository.

The install script works by touching each of the dotfiles (to ensure
their existence), removing each of the dotfiles, then creating a 
symlink for each dotfile. 

This all happens inside of the user's home directory, so if you are
going to run the script make sure that whatever already exists in 
those three locations (~/.vimrc, ~/.bashrc, ~/.dircolors) has been
backed up somewhere.
