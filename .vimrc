set nocompatible

filetype on
syntax on
set hlsearch

" Remember cursor location
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Tab settings
set tabstop=8
set shiftwidth=8
set autoindent
set number

" Color settings
color desert

" Remaps
command Q q
command W w
command WQ wq
command Wq wq

" Switch between different indent styles
nmap \n :set noexpandtab tabstop=8 shiftwidth=8<CR>
nmap \p :set noexpandtab tabstop=4 shiftwidth=4<CR>
nmap \P :set expandtab tabstop=4 shiftwidth=4<CR>
nmap \h :set expandtab tabstop=2 shiftwidth=2<CR>

" Toggle line wrap
nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>

set shell=bash\ --login
nnoremap <F12> :!deploy<CR>

