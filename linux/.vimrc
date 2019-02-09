if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugins')
Plug 'rbgrouleff/bclose.vim'
Plug 'vim-python/python-syntax'
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/vim-auto-save'
Plug 'scrooloose/nerdcommenter'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'sheerun/vim-polyglot'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'kien/ctrlp.vim'
call plug#end()

let python_highlight_all=1
filetype on
syntax on
set t_Co=256
set termguicolors
colorscheme onehalfdark
set background=dark

let mapleader=" "
map <leader>n :NERDTreeToggle<CR>
:map <leader>q :let @/=""<CR>
:map <leader>g :bn<CR>
:map <leader>v :bp<CR>
map <F8> :so ~/.vimrc<CR>
map <F7> gg=G
:imap jj <ESC>
nnoremap <right> <C-w><right>
nnoremap <left> <C-w><left>
nnoremap <up> <C-w><up>
nnoremap <down> <C-w><down>
nnoremap <CR> G
nnoremap <S-Tab> <<
nnoremap <Tab> >>

" Resizing buffers"
nnoremap <leader><left> <C-W>5<<CR>
nnoremap <leader><right> <C-W>5><CR>
nnoremap <leader><down> <C-W>5+<CR>
nnoremap <leader><up> <C-W>5-<CR>

inoremap <S-Tab> <C-d>

augroup CursorLineOnlyActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

set cursorline
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
set noswapfile

" auto remove unncesary white space
autocmd BufWritePre * :%s/\s\+$//e
" search highlight
set hlsearch
set incsearch
" matching parenthesis
set showmatch

" line numbers
set number
set relativenumber
set encoding=utf-8

set laststatus=2
set statusline=
set statusline+=\ col:%c
set statusline+=\ %f
set statusline+=\ %m
set statusline+=%=
set statusline+=\ Buffer[%n]

" Autosave
let g:auto_save = 1  " enable AutoSave on Vim startup"
let g:auto_save_silent = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_write_all = 1
let g:ycm_autoclose_preview_window_after_completion=1
