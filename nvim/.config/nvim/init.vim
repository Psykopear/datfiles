call plug#begin('~/.config/nvim/plugged')

" Trim whitespaces
Plug 'ntpeters/vim-better-whitespace'

" Close buffer
Plug 'rbgrouleff/bclose.vim'

" Linter
Plug 'w0rp/ale'

" Flash line
Plug 'inside/vim-search-pulse'

" Indent line
Plug 'Yggdroot/indentLine'

" Autocomplete
Plug 'Valloric/YouCompleteMe'

" Searcher
Plug 'mhinz/vim-grepper'

" Git stuff
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

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
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-abolish'
Plug 'luochen1990/rainbow'
Plug 'stephpy/vim-yaml'
Plug 'ctrlpvim/ctrlp.vim'

" Colors
Plug 'joshdick/onedark.vim'

" SuperCollider stuff
Plug 'supercollider/scvim'

" Virtualenv
Plug 'jmcantrell/vim-virtualenv'

" Neoterm
Plug 'kassio/neoterm'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Interface
Plug 'vim-ctrlspace/vim-ctrlspace'

" Javascript del cazzo
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'leafgarland/typescript-vim'

" QML
Plug 'peterhoeg/vim-qml'

" Python send to buffer
Plug 'jalvesaq/vimcmdline'

" Python formatter
Plug 'ambv/black'

" Vim airline again?
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" And startify again?
Plug 'mhinz/vim-startify'

" Incsearch
Plug 'haya14busa/incsearch.vim'

" Moar fancy icons
Plug 'ryanoasis/vim-devicons'

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

" Wrap lines
set nowrap

" Keep cursor vertically centered
nnoremap j jzz
nnoremap k kzz
nnoremap G Gzz

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
syntax enable
set background=dark

colorscheme onedark
let g:airline_theme='onedark'
" let base16colorspace=256
" colorscheme base16-materia

" Esc with jj
imap jj <Esc>

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
set foldenable
set foldlevelstart=10        " default folding level when buffer is opened
set foldnestmax=10           " maximum nested fold
set foldmethod=syntax        " fold based on indentation

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
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor-blinkon1,r-cr:hor20-Cursor/lCursor

" When you go from insert mode to normal mode, the cursor generally goes back
" one character. This code fix this behaviour
let CursorColumnI = 0 " The cursor column position in INSERT
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

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
au FileType python map <silent> <leader>b oimport ipdb; ipdb.set_trace()<esc>
au FileType python map <silent> <leader>B Oimport ipdb; ipdb.set_trace()<esc>

" tab switching map
nmap <S-Tab> :bprevious!<CR>
nmap <Tab> :bnext!<CR>

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

" CTRLSpace
" nnoremap <silent><C-space> :CtrlSpace<CR>
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
let g:CtrlSpaceSymbols = { "CS": "#", "All": "ALL" }

" Ripgrep
" nnoremap <Leader>a :Rg<CR>
" let g:rg_highlight=1
" nnoremap <leader>a :GrepperRg<cr>
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)
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
let g:sclangTerm = "termite -e"
let g:scFlash = 1
let g:sclangPipeApp     = "~/.config/nvim/plugged/scvim/bin/start_pipe"
let g:sclangDispatcher  = "~/.config/nvim/plugged/scvim/bin/sc_dispatcher"

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

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
set runtimepath+=~/.config/nvim/docler_snippets

" Ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_user_command = 'fd -t f'

" Map send to repl
" nmap <C-c> :TREPLSendLine<CR><Plug>Pulse
" imap <C-c> <Esc>:TREPLSendLine<CR><Plug>Pulse<CR>i
nnoremap <silent> <C-CR> :TREPLSendLine<cr>
nnoremap <silent> <C-CR> mm(V):TREPLSendSelection<cr>'m
vnoremap <silent> <C-CR> :TREPLSendSelection<cr>

" Do not lint or fix minified files.
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\ '/home/docler/Music/': {'ale_linters': [], 'ale_fixers': []},
\}

" fix js files with eslint
let g:ale_fixers = { 'javascript': ['eslint'] }
nmap <F8> <Plug>(ale_fix)

" FoxDot specific
" nmap <C-x> :T Clock.clear()<CR>

" Autocomp
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:ycm_python_binary_path = 'python'
nnoremap <silent> K :YcmCompleter GetDoc<CR>
nmap <leader>d :YcmComplete GoTo<CR>
let g:ycm_auto_trigger = 0
let g:ycm_min_num_of_chars_for_completion = 2
set completeopt-=preview

" set completeopt+=preview
" let g:ycm_add_preview_to_completeopt = 1

" folds
nnoremap <space> za
set foldmethod=indent

" startify
let g:startify_list_order = [['== Projects =='], 'sessions', ['== Recent =='], 'files']
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_enable_unsafe = 1
let g:startify_custom_indices = ['a','s','d','f']
autocmd User Startified nmap <buffer> o <plug>(startify-open-buffers)

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Testing something
" syntax on
" autocmd WinEnter * set syntax=on
" autocmd WinLeave * set syntax=off
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

" airline configs
let g:airline_statusline_ontop=0
