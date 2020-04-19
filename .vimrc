call plug#begin('~/.vim/plugged')
" color scheme
Plug 'morhetz/gruvbox'

Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'sirver/ultisnips'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neovimhaskell/haskell-vim'
Plug 'ludovicchabant/vim-gutentags'

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" text object
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim'] }
Plug 'sgur/vim-textobj-parameter'
Plug 'tpope/vim-surround'

" finder
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" completion
Plug 'ervandew/supertab'
call plug#end()

let mapleader=','

" use ctrl + h/j/k/l to switch window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" for easymotion
nmap ss <Plug>(easymotion-s2)

" for leaderF
let g:Lf_PopupColorscheme = 'gruvbox'
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_PreviewInPopup = 1
let g:Lf_WindowPosition = 'popup'
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_NormalMap = {
	\ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
	\ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
	\ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
	\ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
	\ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
	\ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
	\ }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>fc :<C-U><C-R>=printf("Leaderf colorscheme %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" copy to buffer
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/.vimbuffer<CR>
" paste from buffer
map <C-p> :r ~/.vimbuffer<CR>

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

" for ctags
set tags=./.tags;,.tags

" for vim-gutentags
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

" debug
let g:gutentags_define_advanced_commands = 1

" Show absolute line numbers
set relativenumber

" Enables us Vim specific features
set nocompatible

" color scheme
colorscheme gruvbox
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
set cursorline

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

" hide buffer if it is modified
set hidden

" haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" json highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

