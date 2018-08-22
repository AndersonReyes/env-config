if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugins')
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-fugitive'
Plug '/usr/local/opt/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-scripts/vim-auto-save'
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer --rust-completer --clang-completer' }
Plug 'scrooloose/nerdcommenter'
call plug#end()

filetype on
syntax on
set t_Co=256
set termguicolors
set background=dark
colorscheme dracula
highlight Normal ctermbg=None


let mapleader=" "
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
noremap h <left>
noremap j <right>
noremap k <down>
noremap l <up>
" Moving lines up and down"
nnoremap <C-k> :m .+1<CR>==
nnoremap <C-l> :m .-2<CR>==
nnoremap + o<Esc>k
nnoremap - O<Esc>l

" Resizing buffers"
nnoremap <leader><left> <C-W>5<<CR>
nnoremap <leader><right> <C-W>5><CR>
nnoremap <leader><down> <C-W>5+<CR>
nnoremap <leader><up> <C-W>5-<CR>

inoremap <S-Tab> <C-d>
inoremap <C-k> <Esc>:m .+1<CR>==gi
inoremap <C-l> <Esc>:m .-2<CR>==gi

vnoremap <C-k> :m '>+1<CR>gv=gv
vnoremap <C-l> :m '<-2<CR>gv=gv

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
set showcmd
set autoread
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
set statusline+=%#Function#\ \"%f\"
set statusline+=%#Statement#\ #%n
set statusline+=%=
set statusline+=%#Identifier#\ %p%%
set statusline+=%#Number#\ %l:%c
set statusline+=%#Constant#%m
set statusline+=%#String#\ %{fugitive#head(7)}
set statusline+=%#warningmsg#\ %{SyntasticStatuslineFlag()}

" set auto close filenames
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.php, *.js'
" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx, *.php, *.js'
" Autosave
let g:auto_save = 1  " enable AutoSave on Vim startup"
let g:auto_save_silent = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_write_all = 1



let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = "--ignore=E265,E266,F401"

let g:ycm_global_ycm_extra_conf = '~/Apps/env-config/vim/ycm_extra_conf.py'
"" turn on completion in comments
let g:ycm_complete_in_comments=1
"" load ycm conf by default
let g:ycm_confirm_extra_conf=0
"" turn on tag completion
let g:ycm_collect_identifiers_from_tags_files=1
"" only show completion as a list instead of a sub-window
set completeopt-=preview
"" start completion from the first character
let g:ycm_min_num_of_chars_for_completion=1
"" don't cache completion items
let g:ycm_cache_omnifunc=0
"" complete syntax keywords
let g:ycm_seed_identifiers_with_syntax=1

