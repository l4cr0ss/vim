" Improvements from Vi
set nocompatible
set showcmd       " Show (partial) command in status line.
set showmatch     " Show matching brackets.
set ignorecase    " Do case insensitive matching
set smartcase     " Do smart case matching
set incsearch     " Incremental search
set autowrite     " Automatically save before commands like :next, :make
set hidden        " Hide buffers when they are abandoned                 
set mouse=        " Disable mouse tomfoolery
"set mouse=a       " Enable mouse usage (all modes)

" Disable swap files
set noswapfile
set nobackup
set nowritebackup

" Unmap ex mode
nnoremap Q <nop>

" Open new splits to the bottom-right
set splitbelow splitright

" Set lazymacro to enable screen buffering during macro play
set lazyredraw

" Set dark background
set bg=dark

" Skip the intro message
set shortmess=atI

" Set list chars - toggle using F1
set listchars=tab:→,,space:·,nbsp:⎵,trail:•,eol:¶,precedes:«,extends:»
nnoremap <F1> :set list! list?<ENTER>
inoremap <F1> <C-O>:set list! list?<ENTER>
vnoremap <F1> <ESC>:set list! list?<ENTER>gv

" Set line numbers - toggle using F2
set number relativenumber
nnoremap <F2> :set number! relativenumber!<ENTER>
inoremap <F2> <C-O>:set number! relativenumber!<ENTER>
vnoremap <F2> <ESC>:set number! relativenumber!<ENTER>gv

" Set textwidth=0 - toggle to 72 using F3
set nopaste
nnoremap <F3> :set nopaste! set paste?<ENTER>
inoremap <F3> <C-O>:set nopaste! set paste?<ENTER>
vnoremap <F3> <ESC>:set nopaste!<ENTER>gv

" Set noexpandtab - toglge using F4
set noexpandtab
nnoremap <F4> :set noexpandtab!<ENTER>:set expandtab?<ENTER>
inoremap <F4> <C-O>:set noexpandtab!<ENTER>:set expandtab?<ENTER>
vnoremap <F4> <ESC>:set noexpandtab!<ENTER>gv

" Re-source .vimrc (this file) using F12
nnoremap <F12> :so ~/.vimrc<ENTER>
inoremap <F12> <C-O>:so ~/.vimrc<ENTER>
vnoremap <F12> <ESC>:so ~/.vimrc<ENTER>gv

" Set the ruler
set ruler
set cc=80

" Set tabstops and text length
set tabstop=8 shiftwidth=8 noexpandtab textwidth=79

" Auto-wrap text using textwidth
" http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set formatoptions+=t

" Alias common typos
command! W w
command! Wa wa
command! WA wa
command! Wq wq
command! WQ wq
command! Wqa wqa
command! WQa wqa
command! WQA wqa
command! Vs vs
command! VS vs
command! Q q
command! Qa qa
command! QA qa
command! Set set
command! Term term

" Enable syntax highlighting by default
if has("syntax")
  syntax on
endif

if has("autocmd")
  " Jump to last position when reopening a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  " Load indentation rules and plugins according to detected filetype
  filetype plugin indent on
endif

" ~/.vim/ftplugin/gitcommit.vim
" when editing commit messages, jump to the end of the line and insert
au! VimEnter COMMIT_EDITMSG exec 'norm gg$'

" Persist undo history across sessions
set undofile
set undodir=$HOME/.vim/history/

" Mac OS X specific settings
if has("macunix")
  " Backspace over newlines
  set backspace=eol,indent,start
endif

" Don't reset the cursor when moving
set nostartofline

" Configure the statusline
" http://vimdoc.sourceforge.net/htmldoc/options.html#'statusline'
set statusline=%<%F%h%m%r\ -\ %b\ (0x%B)%=[%o\ (0x%O)/%{line2byte(line(\"$\")+1)-1}B]\ %l,%c\ %P laststatus=2
hi  StatusLineNC term=NONE cterm=NONE ctermfg=0 ctermbg=242 gui=NONE guibg=DarkGrey

" Start scrolling before the cursor reaches the bottom of the screen
set scrolloff=5
