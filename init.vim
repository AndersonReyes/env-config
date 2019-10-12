if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()
Plug 'rbgrouleff/bclose.vim'
Plug 'ervandew/supertab'
Plug 'neomake/neomake'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/vim-auto-save'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
call plug#end()

let python_highlight_all=1
let g:dracula_colorterm = 0
let g:dracula_italic = 0
filetype on
syntax on
set t_Co=256
set termguicolors
set background=dark
colorscheme dracula

let mapleader=" "
map <leader>n :NERDTreeToggle<CR>
map <leader>t :NERDTreeFind<CR>
:map <leader>q :let @/=""<CR>
:map <leader>g :bn<CR>
    :map <leader>v :bp<CR>
map <F8> :so ~/.config/nvim/init.vim<CR>
map <F7> gg=G
:imap jj <ESC>
nnoremap <right> <C-w><right>
nnoremap <left> <C-w><left>
nnoremap <up> <C-w><up>
nnoremap <down> <C-w><down>
nnoremap <CR> G

" Resizing buffers"
nnoremap <leader><left> <C-W>5<<CR>
nnoremap <leader><right> <C-W>5><CR>
nnoremap <leader><down> <C-W>5+<CR>
nnoremap <leader><up> <C-W>5-<CR>

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
set laststatus=0
"set laststatus=2
"set statusline=
"set statusline+=\ col:%c
"set statusline+=\ #%n\ [%Y]
"set statusline+=\ %f

" Autosave
let g:auto_save = 1  " enable AutoSave on Vim startup"
let g:auto_save_silent = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_write_all = 1

let g:python3_host_prog = "/Users/andersonreyes/miniconda3/envs/python3/bin/python"
let g:python2_host_prog = "/Users/andersonreyes/miniconda3/envs/python2/bin/python"

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1


" neomake
 let g:neomake_python_enabled_makers = ['pylint', 'flake8']
 let g:neomake_open_list = 2
