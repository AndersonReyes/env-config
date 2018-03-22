function! GitInfo()
    let git = fugitive#head()
    if git != ''
        return '->'.fugitive#head()." "
    else
        return ''
    endfunction


" current buffer's size and output it.
function! FileSize()
    let bytes = getfsize(expand('%:p'))
    if (bytes >= 1024)
        let kbytes = bytes / 1024
    endif
    if (exists('kbytes') && kbytes >= 1000)
        let mbytes = kbytes / 1000
    endif

    if bytes <= 0
        return '0'
    endif

    if (exists('mbytes'))
        return mbytes . 'MB '
    elseif (exists('kbytes'))
        return kbytes . 'KB '
    else
        return bytes . 'B '
    endif
endfunction

" Keymappings
"clear the regex buffer so disable highlight
let mapleader=" "
:map <leader>q :let @/=""<CR>
:map <leader>g :bn<CR>
:map <leader>v :bp<CR>
map <F7> gg=G

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
" set mouse=""

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
set statusline+=%#function#\ buffer#:%n\ line:%l\ col:%v
set statusline+=%=
set statusline+=%#identifier#\ \"%f\"
set statusline+=\ %m
set statusline+=\ %LL
set statusline+=\ %{FileSize()}
set statusline+=%#keyword#\ branch:%{GitInfo()}

" set auto close filenames
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.php'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx, *.php'

" Autosave
let g:auto_save = 1  " enable AutoSave on Vim startup"
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode"

