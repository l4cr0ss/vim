" Hide buffers instead of closing them
set hidden

" Remember undo history
set undofile
set undodir=$HOME/.vim/history/

" Maps for common typos
command! W w
command! Q q
command! WQ wq
command! Wq wq

" Default tabstop/shiftwidth/tab settings
set ts=2 sw=2 expandtab

" Perform autoindent
set autoindent

" Turn on line numbers by default
set number

" Configure pathogen for plugins
execute pathogen#infect()

" Set the leader key combo
let mapleader=""

" Key combo for editing .vimrc and automatically reloading
nnoremap <leader>ev :e ~/.vimrc<CR>
augroup automaticallySourceVimrc
  au!
  au bufwritepost .vimrc source ~/.vimrc
augroup END

" Maps for moving to the beginning/end of the line
nnoremap <leader>d $
nnoremap <leader>a 0

" Nop the help shortcut in all modes
nnoremap <F1> <nop>
inoremap <F1> <nop>
vnoremap <F1> <nop>

" Maps for adding empty lines above/below cursor in normal mode
nnoremap zj moo<esc>k`o
nnoremap zk moO<esc>`o

" Maps for saving the current buffer
nnoremap ;; :w<CR>
nnoremap <leader>; :wq<CR>

" Maps for quitting without saving
nnoremap <leader><Return> :q!<CR>

" Options for the FormatSQL plugin
let sqlutil_align_comma=1
let sqlutil_align_where=1
let sqlutil_align_first_word=1
vmap <leader>fsql :SQLUFormatter<CR>

" Maps for Elixir's mix utility
inoremap <leader>mc :!mix compile<CR>
nnoremap <leader>mc :!mix compile<CR>
inoremap <leader>mpr ^[:!mix phoenix.routes<CR>
nnoremap <leader>mpr ^[:!mix phoenix.routes<CR>

" Set hotkey for toggling 'paste' mode
set pastetoggle=<leader>p

" Maps for moving forward/backward between buffers based on last file edited
nnoremap <leader>q :BufSurfBack<CR>
nnoremap <leader>w :BufSurfForward<CR>

syntax enable
