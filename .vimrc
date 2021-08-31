set rtp+=~/.fzf

set term=screen-256color

call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'git pull && ./install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let mapleader = ','
set tags=./.tags;,.tags,./tags,tags

" for vim-easymotion
map s <Plug>(easymotion-prefix)
map ss <Plug>(easymotion-s2)

" use ctrl + h/j/k/l to switch windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-=> <C-w>=

" fzf
noremap <C-p> :FZF<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildmode=longest,full
set wildmenu

nnoremap <leader>h :helpgrep<space>

"for nerdtree
nmap <leader>t :NERDTreeToggle<cr>
nmap <leader>v :NERDTreeFind<cr>

cnoremap <c-n> <down>
cnoremap <c-p> <up>

nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
nnoremap <leader>m :! display<Space>

" Show line numbers
set number

" modifiable
set modifiable

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
set cursorline

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

set mouse-=a

" vim-fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>ga :Gcommit --amend<CR>
nnoremap <leader>gt :Gcommit -v -q %<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! 0Glog<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>


"fzf.vim
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

augroup scons
  au!
  autocmd BufNewFile,BufRead SCon* set syntax=python
augroup END
