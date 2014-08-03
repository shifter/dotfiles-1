" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/Auto-Pairs'
Bundle 'vim-scripts/HTML5-Syntax-File'
Bundle 'vim-scripts/cscope_plus.vim'
Bundle 'vim-scripts/html5.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/php.vim'


" Settings
set autoindent
set colorcolumn=80
set cursorline
set expandtab
set hlsearch
set ignorecase
set incsearch
set number
set ruler
set shiftwidth=4
set showcmd
set smartindent
set t_Co=256
set tabstop=4

" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

"source ~/.vim/theme_jellybeans.vim

autocmd FileType python setlocal et sta sw=4 sts=4
"autocmd FileType html setlocal et sw=2 sts=2
"autocmd FileType php setlocal et sw=2 sts=2
"autocmd FileType js setlocal et sw=2 sts=2
"autocmd FileType jade setlocal et sw=2 sts=2

" Key Mapping
nnoremap <c-l> :noh<CR>
nnoremap <silent> <F10> :NERDTree<CR>
map <c-t>e :tabedit 
map <c-t>n :tabnew<CR>
map t gt
map T gT
"map :tab :tabedit 

map :Q :q

" Run files
autocmd BufRead *.py nmap <F5> :w !python % <CR>
autocmd BufRead *.lisp nmap <F5> :w !clisp % <CR>
autocmd BufRead *.sh nmap <F5> :w !bash % <CR>
autocmd BufRead *.php nmap <F5> :w !php % <CR>

" Ctags
let g:ctags_statusline = 1
"let g:ctags_regenerate = 0

" Emmet
let g:user_emmet_expandabbr_key = '<c-e>'

" Theme
let g:rehash256 = 1
color molokai

"color ron
"blue       delek      evening    murphy     ron        torte
"darkblue   desert     koehler    pablo      shine      zellner
"default    elflord    morning    peachpuff  slate

" Fix backspace in iTerm2
set backspace=indent,eol,start
