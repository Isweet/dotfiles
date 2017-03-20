" It's 2017
set nocompatible

syntax on
filetype plugin indent on
set history=1000
set t_Co=256

" UI
set number
set laststatus=2
set showcmd
set cmdheight=1
set showmode
set cursorline
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set number

" Tabs are two spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

" Search
set ignorecase
set smartcase
set incsearch

" Indentation
set smartindent
set autoindent

" Text Width
set nowrap
set textwidth=80

" Leader is space
let mapleader = "\<space>"

" To toggle insert/normal mode its Ctrl-Space
nnoremap <nul> i
inoremap <nul> <esc>

" Switch between windows
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Create windows
nnoremap <leader>- :split<cr>
nnoremap <leader>\| :vsplit<cr>

" Never type colon again
nnoremap <leader><cr> :

" Training
inoremap <esc> <NOP>
nnoremap i <NOP>
nnoremap : <NOP>

execute pathogen#infect()

colorscheme molokai
