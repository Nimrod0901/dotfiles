set rtp+=~/.fzf

call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }  " ColorScheme
Plug 'mhinz/vim-startify'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'lervag/vimtex'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug '/home/dliu1/.fzf/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
call plug#end()

let mapleader = ','
set tags=./.tags;,.tags

" for vim-easymotion
map s <Plug>(easymotion-prefix)
map ss <Plug>(easymotion-s2)

"for vim-instant-markdown
let g:instant_markdown_autostart = 0

" use ctrl + h/j/k/l to switch windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l


"for vimtex
let g:tex_flavor='latex'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|jpg|png|jpeg)$',
  \ }

"for ultisnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTt = 0

" use ctrl + h/j/k/l to switch windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>kn
let g:instant_markdown_autostart = 0

" use ctrl + h/j/k/l to switch windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l


"for vimtex
let g:tex_flavor='latex'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|jpg|png|jpeg)$',
  \ }

"for ultisnips
let g:UltiSnipsExpandTrigger='<tab>'
noremap <C-l> <C-w>l

"for vimtex
let g:tex_flavor='latex'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|jpg|png|jpeg)$',
  \ }

"for ultisnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<tab>'

nnoremap <leader>h :helpgrep<space>

"for nerdtree
nmap <leader>g :NERDTreeToggle<cr>
nmap <leader>v :NERDTreeFind<cr>

cnoremap <c-n> <down>
cnoremap <c-p> <up>

nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
nnoremap <leader>m :! display<Space>

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

" vim-airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

set mouse=a
