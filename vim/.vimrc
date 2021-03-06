""" UI Config
set relativenumber    " show line numbers
set number
set ruler             " show line and column number
syntax on             " use syntax highlighting
set wildmenu          " visual autocomplete for command menu
set lazyredraw        " redraw screen only when we need to
set showmatch         " highlight matching [{( )}]

""" Highlighting rules
highlight CursorLineNr cterm=NONE
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

""" Spaces & Tabs
set wrap                          " don't wrap lines
set tabstop=2                     " number of visual spaces per tab
set softtabstop=2                 " number of spaces in tab when editing
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set nolist                        " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

""" Search
set incsearch                               " search as characters are entered
set hlsearch                                " highlight matches
set ignorecase                              " perform case insensitive search
" turn off search highlight using /<space>
nnoremap <leader><space> :nohlsearch<CR>

""" Folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=5       " 10 nested fold max
set foldmethod=indent   " fold based on ident level

" open/close folds using space
nnoremap <space> za

" toggle paste mode with f3
set pastetoggle=<F3>

""" copy
command Copy :set nonu nornu wrap
command Uncopy :set nu rnu nowrap

""" Persistent undo
set undofile
set undodir=~/.vim/undo
