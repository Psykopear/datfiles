call plug#begin('~/.config/nvim/plugged')

" Trim whitespaces
Plug 'ntpeters/vim-better-whitespace'

" Close buffer
Plug 'rbgrouleff/bclose.vim'

" Linter
"
Plug 'w0rp/ale'

" Flash line
Plug 'inside/vim-search-pulse'

" Autocomplete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Searcher
Plug 'mileszs/ack.vim'

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
Plug 'tpope/vim-surround'
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

" Interface
Plug 'gcavallanti/vim-noscrollbar'
Plug 'vim-ctrlspace/vim-ctrlspace'

" Moar fancy icons
Plug 'ryanoasis/vim-devicons'

" Javascript del cazzo
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'MaxMEllon/vim-jsx-pretty'

" Tidal
Plug 'munshkr/vim-tidal'
Plug 'SirVer/ultisnips'

" QML
Plug 'peterhoeg/vim-qml'

" Python send to buffer
Plug 'jalvesaq/vimcmdline'

" Solidity syntax
Plug 'tomlion/vim-solidity'

" Vim airline again?
Plug 'vim-airline/vim-airline'

" And startify again?
Plug 'mhinz/vim-startify'

" Incsearch
Plug 'haya14busa/incsearch.vim'

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

" Autoread (reload the file if it has been modified by another source)
set autoread

" Colors
syntax enable
set background=dark

let g:onedark_color_overrides = {
\ "black": {"gui": "#301624", "cterm": "235", "cterm16": "0" },
\ "red": { "gui": "#FF217C", "cterm": "204", "cterm16": "1" },
\ "blue": { "gui": "#20B8C3", "cterm": "39", "cterm16": "4" },
\ "purple": { "gui": "#C320C1", "cterm": "170", "cterm16": "5" },
\ "green": { "gui": "#A7DD1E", "cterm": "114", "cterm16": "2" },
\}

colorscheme onedark

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

" Gui font
" autocmd VimEnter * GuiFont! OperatorMono Nerd Font:h12
" Guifont! "OperatorMono Nerd Font"

""""""""""""""""""
" Status line
""""""""""""""""""
" Function: display errors from Ale in statusline
" function! LinterStatus() abort
"    let l:counts = ale#statusline#Count(bufnr(''))
"    let l:all_errors = l:counts.error + l:counts.style_error
"    let l:all_non_errors = l:counts.total - l:all_errors
"    return l:counts.total == 0 ? '' : printf(
"    \ 'W:%d E:%d',
"    \ l:all_non_errors,
"    \ l:all_errors
"    \)
" endfunction

" set laststatus=2
" set statusline=
" set statusline+=\ %*
" set statusline+=%3*\ \ %{expand('%:h')}\/
" set statusline+=%1*%t%*
" set statusline+=%1*%m
" set statusline+=%=
" set statusline+=%3*\ %{LinterStatus()}
" set statusline+=\ %#keyword#%l/%L\:%c
" set statusline+=%1*\ %{noscrollbar#statusline()}

" hi User1 ctermfg=4
" hi User2 ctermbg=grey ctermfg=black
" hi User3 ctermfg=3

" Gonvim
let g:gonvim_draw_statusline = 0

""""""""""""""""""
" Plugins configs
""""""""""""""""""
" Neoterm
tnoremap <Esc> <C-\><C-n>

" CTRLSpace
nnoremap <silent><C-space> :CtrlSpace<CR>
let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
let g:CtrlSpaceSymbols = { "CS": "#", "All": "ALL" }

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

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
nnoremap <silent> ,th :call neoterm#close()<cr>
nnoremap <silent> ,tl :call neoterm#clear()<cr>
nnoremap <silent> ,tc :call neoterm#kill()<cr>
map <F4> :Ttoggle<CR>
let g:neoterm_keep_term_open = 0

" Supercollider
let g:sclangTerm = "urxvt -e"
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

" tidal
let g:tidal_default_config = {"socket_name": "default", "target_pane": "1"}

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
set runtimepath+=~/.config/nvim/docler_snippets

" Ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Map send to repl
nmap <C-c> :TREPLSendLine<CR><Plug>Pulse

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
nmap <C-x> :T Clock.clear()<CR>

" LSP autocompletion
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

imap <c-space> <Plug>(asyncomplete_force_refresh)
nmap <leader>d :LspDefinition<CR>

let g:lsp_async_completion = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_remove_duplicates = 1

set completeopt+=preview

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

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

" Set gui font on focus (because on enter didn't work)
autocmd FocusGained * GuiFont! OperatorMono Nerd Font:h12

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
