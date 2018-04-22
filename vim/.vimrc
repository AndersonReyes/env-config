" Keymappings
"clear the regex buffer so disable highlight
let mapleader=" "
:map <leader>q :let @/=""<CR>
:map <leader>g :bn<CR>
:map <leader>v :bp<CR>
map <F7> gg=G

" Map arrow keys to move between split windows
nnoremap <right> <C-w><right>
nnoremap <left> <C-w><left>
nnoremap <up> <C-w><up>
nnoremap <down> <C-w><down>

" l is up
" k is down(j)
" h is left
" j is right(l)
noremap h <left>
noremap j <right>
noremap k <down>
noremap l <up>

" move lines/blocks up and down using Crtl-j for up and Crtl-k for down
nnoremap <C-k> :m .+1<CR>==
nnoremap <C-l> :m .-2<CR>==
inoremap <C-k> <Esc>:m .+1<CR>==gi
inoremap <C-l> <Esc>:m .-2<CR>==gi
vnoremap <C-k> :m '>+1<CR>gv=gv
vnoremap <C-l> :m '<-2<CR>gv=gv

filetype on
syntax on
colorscheme dracula
" set background=dark

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
set mouse=""

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
set statusline+=%#string#\ %y\ \"%f\"
set statusline+=\ %m
set statusline+=\ \|
set statusline+=%#keyword#\ window:%n
set statusline+=\ \|
set statusline+=%#number#\ line:%l\ col:%v
set statusline+=\ %LL
set statusline+=\ \|
set statusline+=%#function#\ %{fugitive#statusline()}

" set auto close filenames
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.php, *.js'
" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx, *.php, *.js'

" Autosave
let g:auto_save = 1  " enable AutoSave on Vim startup"
let g:auto_save_silent = 0
let g:auto_save_write_all = 1
