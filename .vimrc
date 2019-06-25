call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }  " ColorScheme
Plug 'mhinz/vim-startify'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()

"for vim-instant-markdown
let g:instant_markdown_autostart = 0


"for vimtex
let g:tex_flavor='latex'

"for ultisnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<tab>'


"for nerdtree
"
nmap ,g :NERDTreeToggle<cr>
nmap ,v :NERDTreeFind<cr>

" Show line numbers
set number

" Enables us Vim specific features
set nocompatible

" color scheme
syntax enable

" Show position
set ruler

filetype on
filetype plugin indent on
filetype plugin on

" show mode
set showmode

" show cmd
set showcmd

" show cursorline
" set cursorline

" set default encoding to utf-8
set encoding=utf-8

" Enable autoindent
set autoindent

" Show matching brackets
" set showmatch

" Show the match when typing
set incsearch

" Highlight found searchs
set hlsearch

" Dont use swapfile
set noswapfile

" Dont use backup
set nobackup

" Set tab
set tabstop=4

" Set shiftwidth
set shiftwidth=4

" Enable expandtab
set expandtab


