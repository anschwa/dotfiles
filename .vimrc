set nocompatible
set backspace=2
set textwidth=72

syntax on
set background=light

" Filetypes
filetype on
filetype plugin on
filetype indent on

" Other Customizations
set ruler
set number
set laststatus=2
set statusline=%f%m%r%h\ %y\ %p%%\ (%l\,%v)

set incsearch
set ignorecase
set smartcase
set showmatch
set showmode
set hlsearch

" Usefull for hlsearch
hi Search cterm=NONE ctermfg=black ctermbg=magenta
