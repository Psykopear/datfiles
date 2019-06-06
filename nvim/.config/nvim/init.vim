call plug#begin('~/.config/nvim/plugged')

" Debug
" Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
" Plug 'idanarye/vim-vebugger'
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}

Plug 'liuchengxu/vista.vim'

" Let's try
Plug 'Psykopear/neovim-package-info', { 'do': './install.sh' }

" Trim whitespaces
Plug 'ntpeters/vim-better-whitespace'

" Close buffer
Plug 'rbgrouleff/bclose.vim'

" Indent line
" Too heavy since it uses highlight column
" Keep track of:
" - https://github.com/neovim/neovim/issues/1767
" - https://github.com/neovim/neovim/issues/8538
" Once those two tickets are closed, implement a better plugin in Rust
" Plug 'Yggdroot/indentLine'

" Autocomplete
Plug 'Valloric/YouCompleteMe'

" Linter
" Plug 'w0rp/ale'

" Searcher
Plug 'mhinz/vim-grepper'

" Git stuff
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'

" Test stuff
Plug 'janko-m/vim-test'

" Tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Code and tpope stuff
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-abolish'
" Plug 'tpope/vim-projectionist'
Plug 'luochen1990/rainbow'
Plug 'stephpy/vim-yaml'
Plug 'ctrlpvim/ctrlp.vim'

" Colors
Plug 'joshdick/onedark.vim'

" SuperCollider stuff
Plug 'supercollider/scvim'

" Virtualenv
" Plug 'jmcantrell/vim-virtualenv'

" Neoterm
Plug 'kassio/neoterm'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Javascript del cazzo
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'leafgarland/typescript-vim'

" QML
Plug 'peterhoeg/vim-qml'

" Python send to buffer
Plug 'Vigemus/iron.nvim'
Plug 'vim-python/python-syntax'

" Python formatter
Plug 'ambv/black'

" Vim airline again?
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" And startify again?
Plug 'mhinz/vim-startify'

" Moar fancy icons
" Plug 'ryanoasis/vim-devicons'

call plug#end()

"""""""""""""""""""""""""
" Neovim general settings
"""""""""""""""""""""""""
set encoding=utf8

" Map Leader and localleader
let mapleader=","
let maplocalleader=","

" Spaces & Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
set noshowmode

" Wrap lines
set nowrap

" Keep cursor vertically centered
nnoremap j jzz
nnoremap k kzz
nnoremap G Gzz
" set scrolloff=999
" augroup VCenterCursor
"   au!
"   au BufEnter,WinEnter,WinNew,VimResized *,*.*
"         \ let &scrolloff=winheight(win_getid())/2
" augroup END

" Various settings
set shell=/bin/zsh
set noswapfile
set showmatch
set incsearch
set history=2000
set hlsearch
set hidden
set nocompatible
set cursorline
set lazyredraw
set number
" set cursorcolumn
" set synmaxcol=256
" syntax sync minlines=256

" Set virtualenv
let g:python_host_prog = '/home/docler/.virtualenvs/neovim-python2/bin/python'
let g:python3_host_prog = '/home/docler/.virtualenvs/neovim/bin/python'

" Autoread (reload the file if it has been modified by another source)
set autoread

" Colors
set termguicolors
syntax enable
set background=dark
colorscheme onedark

" airline configs
let g:airline_theme='onedark'
" let g:lightline = {
"       \ 'colorscheme': 'one',
"       \ }

" Esc with jj
inoremap jj <C-O>:stopinsert<CR>

" Use system clipboard
set clipboard+=unnamedplus

" UI Config
set showcmd                  " show command in bottom bar
set wildmenu                 " visual autocomplete for command menu
set showmatch                " highlight matching brace
set nobackup
set noswapfile

" Search
set incsearch                " search as characters are entered
set hlsearch                 " highlight matche
set ignorecase               " ignore case when searching
set smartcase                " ignore case if search pattern is lower case case-sensitive otherwise

" Folding
" set foldlevelstart=1        " default folding level when buffer is opened
" set foldnestmax=10           " maximum nested fold
" set foldmethod=indent
nmap <space> ]mzz
nmap <s-space> [mzz


" Set unset wrap
nmap <leader>m :set wrap!<CR>zz

" Open in new tab fullscreen
nmap gaz :tab split<CR>

" Edit/reload vimrc
nmap <leader>ev :e $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>

" Fast save and close
nmap <leader>w :w<CR>
nmap <leader>x :x<CR>
nmap <leader>q :q<CR>

" insert blank line before current line without leaving insert mode
imap <leader>o <c-o><s-o>

" Fix indentation
nnoremap <leader>i gg=G``zz<CR>

" Turn off search highlights
nnoremap <leader><space> :nohlsearch<CR>

" Cursor is a block in normal mode and a blinking line in insert mode
" set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor-blinkon1,r-cr:hor20-Cursor/lCursor
set guicursor=n-v-c:block/lCursor-blinkon0,i-ci:ver25/lCursor-blinkon1,r-cr:hor20/lCursor

" When you go from insert mode to normal mode, the cursor generally goes back
" one character. This code fix this behaviour
" let CursorColumnI = 0 " The cursor column position in INSERT
" autocmd InsertEnter * let CursorColumnI = col('.')
" autocmd CursorMovedI * let CursorColumnI = col('.')
" autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Delete previous character with backspace in normal mode
noremap <BS> hx

" Mouse integration
set mousemodel=popup
set mouse=a

" Python breakpoints
" au FileType python map <silent> <leader>b oimport ipdb; ipdb.set_trace()<esc>
" au FileType python map <silent> <leader>B Oimport ipdb; ipdb.set_trace()<esc>

" tab switching map
" nmap <S-Tab> :bprevious!<CR>
" nmap <Tab> :bnext!<CR>

" Close buffer
noremap <leader>c :Bclose <CR>

" Automatically trim whitespaces on save
autocmd BufWritePost * StripWhitespace

" Resize
map <silent> <A-h> <C-w><
map <silent> <A-j> <C-W>-
map <silent> <A-k> <C-W>+
map <silent> <A-l> <C-w>>


""""""""""""""""""
" Status line
""""""""""""""""""

" Gonvim
let g:gonvim_draw_statusline = 0

""""""""""""""""""
" Plugins configs
""""""""""""""""""
" Neoterm
tnoremap <Esc> <C-\><C-n>

" CTRLSpace is slow so I'll just use ctrlp
nnoremap <silent><C-space> :CtrlPBuffer<CR>
" let g:CtrlSpaceDefaultMappingKey = "<C-space> "
" let g:CtrlSpaceGlobCommand = 'rg -l --nocolor -g ""'
" let g:CtrlSpaceSymbols = { "CS": "#", "All": "ALL" }
" let g:CtrlSpaceSearchTiming = 500

" Ripgrep
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
nnoremap <leader>a :Grepper -tool rg -cword -noprompt -highlight<cr>


" Gitgutter
let g:gitgutter_realtime=1

" NerdTree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', '\.qmlc$']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=0
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_autoclose = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeMapNextHunk = ''
let g:NERDTreeMapPrevHunk = ''
let g:NERDTreeStatusline="%3*%{matchstr(b:NERDTreeRoot.path.str(), '\\s\\zs\\w\\(.*\\)')}"
map <F3> :NERDTreeToggle<CR>
map <F8> :Vista!!<CR>

" Python highlights
let python_highlight_all=1

" Rainbow
let g:rainbow_active = 1

" Vim tests
nmap <silent><Leader>t <Esc>:TestNearest<CR>
let test#strategy = 'neoterm'
let test#python#runner = 'pytest'
let test#python#pytest#options = '-s -vv'

" Neoterm
map <F4> :Ttoggle<CR>
let g:neoterm_keep_term_open = 0
let g:neoterm_default_mod = 'rightbelow'
let g:neoterm_size = '10'
let g:neoterm_autoinsert = 1

" Supercollider
let g:sclangTerm = "alacritty -e"
let g:scFlash = 1
let g:sclangPipeApp = "~/.config/nvim/plugged/scvim/bin/start_pipe"
let g:sclangDispatcher = "~/.config/nvim/plugged/scvim/bin/sc_dispatcher"

" Devicons
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0

" Jedi
let g:jedi#show_call_signatures = "2"

" Js configs
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
let g:jsx_ext_required = 0
let g:used_javascript_libs = 'underscore,react'
let g:vim_jsx_pretty_colorful_config = 1

" Ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_user_command = 'fd -c never -t f'
let g:ctrlp_use_caching = 0

" Do not lint or fix minified files.
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}

" Autocomp
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:ycm_python_binary_path = 'python'
nnoremap <silent> K :YcmCompleter GetDoc<CR>
nmap gd :YcmComplete GoTo<CR>
let g:ycm_key_invoke_completion = '<C-x><C-o>'
let g:ycm_auto_trigger = 0
let g:ycm_min_num_of_chars_for_completion = 1
set completeopt-=preview

" startify
let g:startify_lists = [
            \ { 'header': [' == Projects =='], 'type': 'sessions' },
            \ { 'header': [' == Recent =='], 'type': 'files'},
            \ ]
let g:startify_change_to_vcs_root = 1
let g:startify_change_to_dir = 1
let g:startify_fortune_use_unicode = 1
let g:startify_enable_unsafe = 1
let g:startify_custom_indices = ['a','s','d','f']
autocmd User Startified nmap <buffer> o <plug>(startify-open-buffers)

" Ale
let g:ale_linters = {'javascript': ['eslint']}
" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'true'
" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'false'
" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'true'
" put > on the last line instead of new line
" Prettier default: false
let g:prettier#config#jsx_bracket_same_line = 'false'
" avoid|always
" Prettier default: avoid
let g:prettier#config#arrow_parens = 'avoid'
" none|es5|all
" Prettier default: none
let g:prettier#config#trailing_comma = 'none'
" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" Prettier default: babylon
let g:prettier#config#parser = 'babylon'
" cli-override|file-override|prefer-file
let g:prettier#config#config_precedence = 'prefer-file'
" always|never|preserve
let g:prettier#config#prose_wrap = 'preserve'
" let g:ycm_server_python_interpreter = '/usr/bin/python3.6'
let g:ycm_collect_identifiers_from_tags_files = 1

" Rust config
let g:racer_cmd = "/home/docler/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

au FileType rust nmap gd <Plug>(rust-def)

let g:rustfmt_autosave = 1

nmap tb :tabclose<CR>
function! OpenCurrentAsNewTab()
    let l:currentPos = getcurpos()
    tabedit %
    call setpos(".", l:currentPos)
endfunction
nmap tt :call OpenCurrentAsNewTab()<CR>

"" PYTHON REPL
au FileType python map <leader>d ctrap
au FileType python imap <leader>d <Esc>ctrapi
let g:iron_repl_open_cmd = "split"

set guifont=Operator\ Mono\ Nerd\ Font\ Mono

