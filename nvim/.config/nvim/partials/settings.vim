set encoding=utf8
" Default split directions
set splitbelow
set splitright
" Map Leader and localleader
let mapleader=","
let maplocalleader=","
set updatetime=100
"" Spaces & Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
set noshowmode
set nowrap          " Wrap lines
"" Various settings
set shell=/bin/zsh
set history=2000
set hlsearch
set hidden
" set cursorline
set lazyredraw
" set number
" set nonumber
" Use system clipboard
set clipboard+=unnamedplus
" UI Config
set showcmd " show command in bottom bar
set wildmenu " visual autocomplete for command menu
set showmatch " highlight matching brace
set nobackup
set noswapfile
" Search
set incsearch " search as characters are entered
set hlsearch " highlight matche
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is lower case case-sensitive otherwise
set autoread " Autoread (reload the file if it has been modified by another source)
" Mouse integration
set mousemodel=popup
set mouse=a
" Height of the popup window
set pumheight=10
" Conceal
set conceallevel=3
" Always draw the signcolumn.
" set signcolumn=yes
set signcolumn=no
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
" set completeopt=noinsert,menuone,noselect
set completeopt=menuone,noselect
" set ttimeout
" set ttimeoutlen=0

" Keep cursor vertically centered
" nnoremap j }zz
" nnoremap k {zz
" nnoremap <space> za
" nnoremap <M-space> {
set scrolloff=900

"
" Folding
" default folding level when buffer is opened
set foldlevelstart=10
" maximum nested fold
set foldnestmax=10
" treesitter folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" Colors
set termguicolors
set background=dark
" syntax enable
filetype plugin indent on
set synmaxcol=200
let g:onedark_terminal_italics=1
" let base16colorspace=256
" colorscheme base16-onedark
" colorscheme onedark
colorscheme one-nvim
" let g:palenight_terminal_italics=1
" colorscheme palenight
" colorscheme challenger_deep
" colorscheme base16-challenger-deep
" colorscheme rigel
" Transparent background
" hi Normal guibg=NONE ctermbg=NONE
" Hide tilde characters in the end of buffer.
" Thanks to Neovim, this is not possible in vim
" set fillchars=eob:\ ,vert:\│ " Adding a comment here so the whitespace is not removed on save
" set fillchars=eob:\ ,vert:░
set fillchars=eob:\ ,vert:│

