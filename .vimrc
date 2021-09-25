set nocompatible
syntax enable               " enable syntax processing
set number                  " show line number
set relativenumber          " show relative number
set showcmd                 " show command in bottom bar
set cursorline              " highlight current line

set wildmenu                " visual autocomplete for command menu
set showmatch               " highlight matching [{()}]

filetype indent on          " load filetype-specific indent files
filetype plugin indent on
syntax on

set incsearch               " search as characters are enterd
set hlsearch                " highlight matches

set tabstop=2               " number of visual spaces per tab
set softtabstop=2           " number of spaces in tab when editing
set shiftwidth=2            " indenting is 2 spaces
set expandtab               " tabs are spaces

" set leader+space to stop highligthing
nnoremap <leader><space> :nohlsearch<CR>

set foldenable              " enable folding"
set foldlevelstart=3        " open 3 first folds level by default
set foldmethod=indent       " fold based on indent level

" space open/close folds
nnoremap <space> za

nnoremap B ^
nnoremap E $

nnoremap gV '[v']

let mapleader=","

inoremap jk <esc> 

