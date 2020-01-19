call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }  " ColorScheme
Plug 'mhinz/vim-startify'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'neovimhaskell/haskell-vim'
call plug#end()

let mapleader=','

" use ctrl + h/j/k/l to switch window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" for easymotion
nmap ss <Plug>(easymotion-s2)

" for vim-instant-markdown
let g:instant_markdown_autostart = 0

" for ctrlp
let g:ctrlp_map = '<c-p>'

" for vimtex
let g:tex_flavor='latex'

" for ultisnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<tab>'

" for vim-airline
let g:airline_powerline_fonts = 1  
let g:airline#extensions#tabline#enabled = 1
set laststatus=2 

" for nerdtree
nmap <leader>g :NERDTreeToggle<cr>
nmap <leader>v :NERDTreeFind<cr>

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
set backspace=indent,eol,start

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

" Background
set background=dark

" Mouse Mode
set mouse=a

" haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
