execute pathogen#infect()
syntax on
filetype plugin indent on
"set runtimepath^=~/.vim/bundle/ctrlp.vim
"set runtimepath+=~/.vim/bundle/nerdtree
"set rtp+=~/.vim/bundle/vim-flake8
"set rtp+=~/.vim/bundle/vim-fugitive
"set rtp+=~/.vim/bundle/vim-gitgutter

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim

"https://github.com/VundleVim/Vundle.vim#quick-start
call vundle#begin()
Plugin 'Valloric/YouCompleteMe'
call vundle#end()

set number "line numbers
set tabstop=4 "a tab is 4 spaces
set shiftwidth=4 "number of spaces for autoindenting
set autoindent
set expandtab
set showmatch "show matching brackets
set hidden

"search moves on keypress, case insensitive except if you capitalize
"hl = highlight
set incsearch
set hlsearch
set ignorecase
set smartcase "ignore case if all lowercase, otherwise case

" color scheme
colo desert

" new leader key = ,
let mapleader = ","

" close buffer quicker with ,bd "
" nnoremap <leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <leader>bd :bp <bar> bd #<CR>

" Shortcut to drop ipdb
:command Ipdb :normal O import ipdb;ipdb.set_trace()<ESC><bar>0<bar>x
nnoremap <leader>ipdb :Ipdb<CR>

" shortcut to clear current search highlight
nnoremap <leader>noh :noh<CR>

" shortcut to run Flake8() for PEP
nnoremap <leader>pep :call Flake8()<CR>

" shortcut to launch NERDTree
nnoremap <leader>nt :NERDTree<CR>

" Display cursor position in status line "
set ruler

" always display status line "
set laststatus=2

" custom status line [buffer #]\ lines in file\ truncate %filepath %help %3 modified flags
set statusline=[%n]\ %L\ Lines\ %<%f%h\ %m%m%m

" The Silver Searcher
if executable('ag')
    " use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " use ag in CtrlP for listing files, respects .gitignore
    " let g:ctrlp_user_command = 'ag %s -l --nocolor -g "'

    " ag is fast enough that CtrlP doesn't need to cache
    " let g:ctrlp_use_caching = 0

    if !exists(":Ag")
        command -nargs=+ -complete=file -bar Ag silent! grep! <args><bar>cwindow<bar>redraw!
        nnoremap <leader>ag :Ag<SPACE>
        nnoremap <leader>agw :Ag <cword><CR>
    endif
endif

" tell ctrl-p not to search .pyc files or node modules
let g:ctrlp_custom_ignore = 'node_modules\|\.pyc\|env\/\|env_'

" tell ctrlp to search current dir only
let g:ctrlp_working_path_mode = 0

" autostart nerdtree
"autocmd vimenter * NERDTree
" nerd tree ignore .pyc files
let NERDTreeIgnore = ['\.pyc$']

" draws a line at column 100
" set colorcolumn=100 " draws a line at column 100
" highlight ColorColumn

" highlights characters at column 100
call matchadd('ColorColumn', '\%100v', 100)

" Closes preview window in youcompleteme on insert leave / move
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" force .djhtml, .hbs to html syntax
au BufRead,BufNewFile *.djhtml setfiletype html
au BufRead,BufNewFile *.hbs setfiletype html
