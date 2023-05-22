if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim  --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'morhetz/gruvbox'
call plug#end()

filetype on
syntax on

set background=dark
set t_Co=256
set termguicolors
colorscheme gruvbox

let mapleader=" "
augroup CursorLineOnlyActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" set cursorline
set ruler
set complete=.,b,w
set nocompatible
set hidden
set history=100
set wrap
set backspace=indent,eol,start
set ttyfast
set showmode
set noswapfile

" auto remove unncesary white space
autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

" search highlight
set hlsearch
set incsearch

" matching parenthesis
set showmatch
set number relativenumber
set encoding=utf-8
set nopaste

set laststatus=2
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=\ %F
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %l:%c

set rtp+=/usr/local/bin/fzf

:map <leader>q :let @/=""<CR>
:map <leader>g :bn<CR>
:map <leader>v :bp<CR>
map <F8> :so ~/.vimrc<CR>
map <F7> gg=G
inoremap <special> jk <ESC>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <CR> G
nnoremap <silent><leader>l :Buffers<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-f> :Files<CR>
nnoremap <C-g> :Rg<CR>
