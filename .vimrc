" UNMAP ARROW KEYS
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop

set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces

set number          " show line numbers
set showcmd         " show command in bottom bar
filetype indent on  " load filetype-specific indent files
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when we need to
set showmatch       " highlight matching [{()}

" move vertically by visual line
nnoremap j gj
nnoremap k gk

set incsearch      " search as characters are entered
set hlsearch       " highlight matches
