"Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox', {'as': 'gruvbox'}
Plug 'vim-scripts/vim-auto-save'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neomake/neomake'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
call plug#end()

" Neomake, automaticall run on normal edit, reading and writing
call neomake#configure#automake('nrw', 200)
let g:neomake_open_list = 2

set t_Co=256
set termguicolors
set background=dark
colorscheme onehalfdark

let mapleader=" "
:map <leader>c :let @/=""<CR> " Clear the regex buffer
" moving between the buffers
:map <leader>g :bn<CR>
:map <leader>v :bp<CR>
:map <leader>c :bd<CR> " Delete buffer
imap jj <Esc>
tnoremap jj <C-\><C-n> " Terminal escape

" Map arrow keys to move between split windows
nnoremap <right> <C-w><right>
nnoremap <left> <C-w><left>
nnoremap <up> <C-w><up>
nnoremap <down> <C-w><down>
nnoremap <CR> G " Enter lines by typing number and hit enter


" Resizing windows
nnoremap <leader><left> <C-W>5<<CR>
nnoremap <leader><right> <C-W>5><CR>
nnoremap <leader><down> <C-W>5+<CR>
nnoremap <leader><up> <C-W>5-<CR>

" remap the untab
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" deoplete tab complete
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"

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

" Insert new line without leaving normal mode
nnoremap o o<Esc>k
nnoremap O O<Esc>l

filetype on
syntax on

augroup CursorLineOnlyActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

set cursorline
set hidden
filetype indent on
set wrap
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set showmode
set noswapfile
set guicursor=

" auto remove unncesary white space
autocmd BufWritePre * :%s/\s\+$//e
" matching parenthesis
set showmatch

" line numbers
set number

set laststatus=2
set statusline=
set statusline+=%#Statement#\ #%n
set statusline+=%#Identifier#\ %p%%
set statusline+=%#Number#\ %l:%c
set statusline+=%#Function#\ \"%f\"
set statusline+=%#Constant#%m
set statusline+=%#String#\ %{fugitive#statusline()}

" set auto close filenames
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.php, *.js'
" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx, *.php, *.js'

" Autosave
let g:auto_save = 1  " enable AutoSave on Vim startup"
let g:auto_save_silent = 1
let g:auto_save_write_all = 1
let g:auto_save_in_insert_mode = 0

" deoplete
let g:deoplete#enable_at_startup = 1
