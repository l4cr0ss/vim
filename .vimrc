filetype on

" Remember cursor location
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Tab settings
set expandtab
set tabstop=2
set shiftwidth=2
:set autoindent
:set number

" Color settings
color desert

" Remaps
command Q q
command W w
command WQ wq
command Wq wq

" Switch between different indent styles 
nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" Toggle line wrap
nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>
