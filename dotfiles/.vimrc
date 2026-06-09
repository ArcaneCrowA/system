" ==========================================================================
"  MINIMAL VIM CONFIG (.vimrc)
" ==========================================================================

" 1. Essential Behavior
set nocompatible            " Use Vim defaults instead of Vi
filetype plugin indent on   " Enable filetype detection and plugins
syntax on                   " Enable syntax highlighting
set encoding=utf-8          " Standard encoding
set mouse=a                 " Mouse support for scrolling/clicking

" 2. UI / Visuals
set number                  " Show line numbers
set relativenumber          " Relative numbers for fast movement
set cursorline              " Highlight the current line
set showmode                " Show current mode (Insert, Visual, etc.)
set showcmd                 " Show partial commands in bottom bar
set wildmenu                " Visual autocomplete for command menu

" 3. Indentation & Tabs
set tabstop=4               " Number of visual spaces per TAB
set softtabstop=4           " Number of spaces in tab when editing
set shiftwidth=4            " Number of spaces for auto-indent
set expandtab               " Tabs are spaces

" 4. Searching
set hlsearch                " Highlight search results
set incsearch               " Search as you type
set ignorecase              " Case insensitive search...
set smartcase               " ...unless I use a capital letter

" 5. Quality of Life
let mapleader = " "         " Space as leader key
set clipboard=unnamed       " Use system clipboard (requires +clipboard)
set backspace=indent,eol,start " Fix backspace behavior

" Clear search highlights with Leader + Space
nnoremap <leader><space> :noh<cr>

" Fast save and quit
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

" 6. Custom Status line
set laststatus=2            " Always show the status line
set statusline=
set statusline+=\ %f        " File path
set statusline+=\ %m        " Modified flag [+]
set statusline+=\ %r        " Read-only flag [RO]
set statusline+=\ %y        " Filetype [python/lua/etc]
set statusline+=%=          " Alignment separator (left/right)
set statusline+=\ %c:%l     " Column : Line
set statusline+=\ /%L       " Total lines
set statusline+=\ %P        " Percentage through file
set statusline+=\           " Ending space
