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

"let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ag_prg = "ag --vimgrep"
let g:ag_working_path_mode="r"

" Disable swap files
set noswapfile
set nobackup
set nowritebackup

" Unmap ex mode
nnoremap Q <nop>

" Set lazymacro to enable screen buffering during macro play
set lazyredraw

" Set dark background
set bg=dark

" Skip the intro message
set shortmess=atI

" Use modified style for navigation on the command-line
" move to start of line
:cnoremap <C-a>		<Home>
" move to end of line
:cnoremap <C-e>		<End>
" move forward one character
:cnoremap <C-f>		<Right>
" move backward one character
:cnoremap <C-s>		<Left>
" move forward one word
:cnoremap <C-l>	<S-Right>
" move backward one word
:cnoremap  <S-Left>
" delete one character under cursor
:cnoremap <C-d>		<Del>
" delete word to the right of the cursor
:cnoremap <C-q> <S-Right><C-w>
" recall newer command-line
:cnoremap <C-n>		<Down>
" recall previous (older) command-line
:cnoremap <C-p> <Up>

" Set list chars - toggle using F1
set listchars=tab:→,,space:·,nbsp:⎵,trail:•,eol:¶,precedes:«,extends:»
nnoremap <F1> :set list! list?<ENTER>
inoremap <F1> <C-O>:set list! list?<ENTER>
vnoremap <F1> <ESC>:set list! list?<ENTER>gv

" Set line numbers 
" F2 - toggle off/on
set number relativenumber
nnoremap <F2> :set number! relativenumber!<ENTER>
inoremap <F2> <C-O>:set number! relativenumber!<ENTER>
vnoremap <F2> <ESC>:set number! relativenumber!<ENTER>gv

" Set tabstops and shiftwidth 
" F3 - cycle common ts/sw
set tabstop=2 shiftwidth=2 expandtab textwidth=79
function! CycleTabstop()
  let s:map = { "2": "4", "4": "8", "8": "2" }
  let s:curr = &tabstop
  let s:next = s:map[s:curr]
  let &tabstop=s:next 
  let &shiftwidth=s:next 
  set tabstop? shiftwidth? expandtab?
endfunction
nnoremap <F3> :call CycleTabstop()<ENTER>
inoremap <F3> <C-O>:call CycleTabstop()<ENTER>
vnoremap <F3> <ESC>:call CycleTabstop()<ENTER>gv

" Set noexpandtab
" F4 - toggle on/off
set expandtab
function! ToggleExpandtab()
  set expandtab!
  set tabstop? shiftwidth? expandtab?
endfunction
nnoremap <F4> :call ToggleExpandtab()<ENTER>
inoremap <F4> <C-O>:call ToggleExpandtab()<ENTER>
vnoremap <F4> <ESC>:call ToggleExpandtab()<ENTER>gv

" Set nopaste
" F5 - toggle on/off
set nopaste
nnoremap <F5> :set nopaste! paste?<ENTER>
inoremap <F5> <C-O>:set nopaste! paste?<ENTER>
vnoremap <F5> <ESC>:set nopaste!<ENTER>gv

" Set nowordwrap 
" F6 - toggle toggle on/off
set nowrap
nnoremap <F6> :set nowrap!<ENTER>:set wrap?<ENTER>
inoremap <F6> <C-O>:set nowrap!<ENTER>:set wrap?<ENTER>
vnoremap <F6> <ESC>:set nowrap!<ENTER>gv


" Toggle 'rolodex mode' using F11
function! CycleRolodexMode()
  let s:map = { "1": "999", "999": "1" }
  let s:curr = &winheight
  let s:next = s:map[s:curr]
  let &winheight=s:next
  if s:next == 1
    wincmd =
  endif
endfunction
nnoremap <F9> :call CycleRolodexMode()<ENTER>
inoremap <F9> <C-O>:call CycleRolodexMode()<ENTER>
vnoremap <F9> <ESC>:call CycleRolodexMode()<ENTER>gv


" Re-source .vimrc (this file) using F12
nnoremap <F12> :so ~/.vimrc<ENTER>
inoremap <F12> <C-O>:so ~/.vimrc<ENTER>
vnoremap <F12> <ESC>:so ~/.vimrc<ENTER>gv

" Set the ruler
set ruler

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

" Highlight the current line number 
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

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

" Setup Termdebug
packadd termdebug

" Create digraph shortcuts for some alpha chars
execute "digraphs ks " . 0x2096 
execute "digraphs as " . 0x2090
execute "digraphs es " . 0x2091
execute "digraphs hs " . 0x2095
execute "digraphs is " . 0x1D62
execute "digraphs ks " . 0x2096
execute "digraphs ls " . 0x2097
execute "digraphs ms " . 0x2098
execute "digraphs ns " . 0x2099
execute "digraphs os " . 0x2092
execute "digraphs ps " . 0x209A
execute "digraphs rs " . 0x1D63
execute "digraphs ss " . 0x209B
execute "digraphs ts " . 0x209C
execute "digraphs us " . 0x1D64
execute "digraphs vs " . 0x1D65
execute "digraphs xs " . 0x2093
