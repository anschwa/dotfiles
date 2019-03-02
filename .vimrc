set nocompatible
set backspace=2

syntax on

" filetypes
filetype on
filetype plugin on
filetype indent on

" In Makefiles DO NOT use spaces instead of tabs
autocmd FileType make setlocal noexpandtab

set ruler
set laststatus=2
set statusline=%F%m%r%h%y[%p%%](%l,%v)

set incsearch
set hlsearch
set showmatch
set showmode

set number
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set paste
