lua require('plugins')

" If installed using Homebrew
set rtp+=/usr/local/bin/fzf

set showmatch               " show matching
set ignorecase              " case insensitive
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=2               " number of columns occupied by a tab
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
set mouse=a                 " enable mouse click
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set noswapfile            " disable creating swap file
set backupdir=~/.cache/vim " Directory to store backup files.

set background=dark
colorscheme gruvbox

let mapleader=" "
:map <leader>q :let @/=""<CR>
:map <leader>g :bn<CR>
:map <leader>v :bp<CR>

" Press i to enter insert mode, and ii to exit insert mode.
:inoremap jk <Esc>

" Scala
autocmd FileType json syntax match Comment +\/\/.\+$+
" Help Vim recognize *.sbt and *.sc as Scala files
au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
