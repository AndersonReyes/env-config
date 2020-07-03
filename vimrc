if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim  --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/vim-auto-save'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'derekwyatt/vim-scala'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rbgrouleff/bclose.vim'
Plug 'hashivim/vim-terraform'
Plug 'ekalinin/Dockerfile.vim'
Plug 'tomasiser/vim-code-dark'
call plug#end()

filetype on
syntax on
set background=dark
set t_Co=256
set termguicolors
colorscheme codedark

let mapleader=" "
map <leader>n :NERDTreeToggle<CR>
map <leader>t :NERDTreeFind<CR>
:map <leader>q :let @/=""<CR>
:map <leader>g :bn<CR>
:map <leader>v :bp<CR>
map <F8> :so ~/.vimrc<CR>
map <F7> gg=G
:imap jj <ESC>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <CR> G

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
set smartindent

set cursorline
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
" search highlight
set hlsearch
set incsearch
" matching parenthesis
set showmatch
set relativenumber
set encoding=utf-8
set laststatus=2

au BufRead,BufNewFile *.sbt           set filetype=scala
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:> foldmethod=indent nofoldenable
autocmd FileType scala setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:> foldmethod=indent nofoldenable

" Autosave
let g:auto_save = 1  " enable AutoSave on Vim startup"
let g:auto_save_silent = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_write_all = 1

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore = ['\.pyc$']

let g:python_highlight_all = 1
