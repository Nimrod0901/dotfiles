call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }  " ColorScheme
Plug 'mhinz/vim-startify'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py'  }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
call plug#end()

"for vim-instant-markdown
let g:instant_markdown_autostart = 0

" use Ctrl + h/j/k/l to switch window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"for vimtex
let g:tex_flavor='latex'

"for ultisnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<tab>'


"for nerdtree
nmap ,g :NERDTreeToggle<cr>
nmap ,v :NERDTreeFind<cr>

" for vim-easymotion
map ss <Plug>(easymotion-s2)

" Show line numbers
set number

" Enables us Vim specific features
set nocompatible

" color scheme
syntax enable
set background=dark
colo gruvbox

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

set background=dark


let g:ycm_server_keep_logfiles = 1

let g:ycm_server_log_level = 'debug'

let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

" vim-airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
