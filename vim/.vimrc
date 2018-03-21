let mapleader=" "
"clear the regex buffer so disable highlight
:map <leader>q :let @/=""<CR> 
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

" set auto close filenames
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.php'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx, *.php'

" Autosave
let g:auto_save = 1  " enable AutoSave on Vim startup"
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode"

