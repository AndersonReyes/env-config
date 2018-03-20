let mapleader="<Space>"

filetype on
syntax on
colorscheme gruvbox
set background=dark

set nocompatible
set hidden
set history=100
filetype indent on
set wrap
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set backspace=indent,eol,start
set ttyfast
set showmode
set showcmd

" auto remove unncesary white space
autocmd BufWritePre * :%s/\s\+$//e

" line highlight
set hlsearch
" matching parenthesis
set showmatch

" line numbers
set number
set encoding=utf-8

set laststatus=2
set statusline=
set statusline+=%#function#\ line:%l\ col:%v
set statusline+=%=
set statusline+=\ %f
set statusline+=\ %m
set statusline+=\ %y
