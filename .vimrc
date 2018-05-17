set nocompatible
set backspace=2

" filetypes
filetype on
filetype plugin on
filetype indent on

" In Makefiles DO NOT use spaces instead of tabs
autocmd FileType make setlocal noexpandtab
" In Ruby files, use 2 spaces instead of 4 for tabs
autocmd FileType ruby setlocal sw=2 ts=2 sts=2

" My Variables

set background=dark

set ruler
" set hlsearch
set showmatch
set showmode
syntax on

" set virtualedit=all
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set paste
