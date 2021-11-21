set nocompatible
set backspace=2
set textwidth=72

syntax on
set background=light

" Filetypes
filetype on
filetype plugin on
filetype indent on

" In Makefiles DO NOT use spaces instead of tabs
autocmd FileType make setlocal noexpandtab

" Use spaces everywhere else
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

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
