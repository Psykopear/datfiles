call plug#begin('~/.config/nvim/plugged')

" Various languages syntax styles
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'ruanyl/coverage.vim'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Let's try
Plug 'Psykopear/neovim-package-info', { 'do': './install.sh' }

" Trim whitespaces
Plug 'ntpeters/vim-better-whitespace'

" Close buffer
Plug 'rbgrouleff/bclose.vim'

" Git stuff
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'samoshkin/vim-mergetool'

" Test stuff
Plug 'janko-m/vim-test'

" Tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'

" Nerdtree
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'

" Code and tpope stuff
Plug 'tpope/vim-commentary'
Plug 'luochen1990/rainbow'

" Colors
Plug 'joshdick/onedark.vim'

" Neoterm
Plug 'kassio/neoterm'

" Javascript del cazzo
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'leafgarland/typescript-vim'

" Python send to buffer
Plug 'Vigemus/iron.nvim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Python formatter
Plug 'python/black'

" Moar fancy icons
Plug 'ryanoasis/vim-devicons'

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
  endif
endfunction
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

call plug#end()

"""""""""""""""""""""""""
" Neovim general settings
"""""""""""""""""""""""""
set encoding=utf8

" Map Leader and localleader
let mapleader=","
let maplocalleader=","

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
set noswapfile
set showmatch
set incsearch
set history=2000
set hlsearch
set hidden
" set cursorline
set lazyredraw
set number
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
set signcolumn=yes
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
set completeopt=noinsert,menuone,noselect
" set ttimeout
" set ttimeoutlen=0

" Keep cursor vertically centered
" nnoremap j }zz
" nnoremap k {zz
nnoremap <space> }
" nnoremap <M-space> {
set scrolloff=900
nnoremap G Gzz

" Set virtualenv
let g:python_host_prog = '/home/docler/.virtualenvs/neovim-python2/bin/python'
let g:python3_host_prog = '/home/docler/.virtualenvs/neovim/bin/python'
let g:black_virtualenv = '/home/docler/.virtualenvs/neovim'

" Colors
set termguicolors
set background=dark
syntax enable
set synmaxcol=200
colorscheme onedark

" airline configs
let g:airline_theme='onedark'

" Esc with jj
inoremap jj <Esc>

" Folding
" set foldlevelstart=1        " default folding level when buffer is opened
" set foldnestmax=10           " maximum nested fold
" set foldmethod=indent
" nmap ]] ]]zz
" nmap [[ [[zz

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
" set guicursor=n-v-c:block/lCursor-blinkon0,i-ci:ver25/lCursor-blinkon1,r-cr:hor20/lCursor

" When you go from insert mode to normal mode, the cursor generally goes back
" one character. This code fix this behaviour
" let CursorColumnI = 0 " The cursor column position in INSERT
" autocmd InsertEnter * let CursorColumnI = col('.')
" autocmd CursorMovedI * let CursorColumnI = col('.')
" autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

" Split
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

" Switching windows
" noremap <C-j> <C-w>j
" noremap <C-S-J> <C-w>J
" noremap <C-k> <C-w>k
" noremap <C-S-K> <C-w>K
" noremap <C-l> <C-w>l
" noremap <C-S-L> <C-w>L
" noremap <C-h> <C-w>h
" noremap <C-S-H> <C-w>H

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l


" Delete previous character with backspace in normal mode
noremap <BS> hx


" tab switching map
nmap <S-Tab> :bprevious!<CR>
nmap <Tab> :bnext!<CR>

" Close buffer
noremap <leader>c :Bclose <CR>
noremap <leader>bd :1,100bd<CR>

" Automatically trim whitespaces on save
" autocmd BufWritePost * StripWhitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" Resize
map <silent> <A-h> <C-w><
map <silent> <A-j> <C-W>-
map <silent> <A-k> <C-W>+
map <silent> <A-l> <C-w>>

" Open in new tab
nmap tb :tabclose<CR>
function! OpenCurrentAsNewTab()
    let l:currentPos = getcurpos()
    tabedit %
    call setpos(".", l:currentPos)
endfunction
nmap tt :call OpenCurrentAsNewTab()<CR>

" set guifont=Operator\ Mono\ Nerd\ Font\ Mono

""""""""""""""""""
" Plugins configs
""""""""""""""""""

" Neoterm
tnoremap <Esc> <C-\><C-n>
map <F4> :Ttoggle<CR>
let g:neoterm_keep_term_open = 0
let g:neoterm_default_mod = 'rightbelow'
let g:neoterm_size = '10'
let g:neoterm_autoinsert = 1
" function! s:neoterm_settings() abort
"     let &l:statusline='%#NonText#'
"     let &l:laststatus=0
" endfunction
" au FileType neoterm call s:neoterm_settings()

" Gitgutter
let g:gitgutter_realtime=1

" fuGITive
nmap <silent><Leader>g :G<CR><C-w>L:vertical resize 50<CR>
" nmap <silent><Leader>g :Gina status<CR>

" Vista
" map <F8> :Vista!!<CR>

" Python highlights
" let python_highlight_all=1

" Rainbow
let g:rainbow_active = 1

" Vim tests
nmap <silent><Leader>t <Esc>:TestNearest<CR>
let test#strategy = 'neoterm'
let test#python#runner = 'pytest'
let test#python#pytest#options = '-s -vv'

" Supercollider
let g:sclangTerm = "alacritty -e"
let g:scFlash = 1
let g:sclangPipeApp = "~/.config/nvim/plugged/scvim/bin/start_pipe"
let g:sclangDispatcher = "~/.config/nvim/plugged/scvim/bin/sc_dispatcher"

" Devicons
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ' '
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0

" Js configs
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
let g:jsx_ext_required = 0
let g:used_javascript_libs = 'underscore,react'
let g:vim_jsx_pretty_colorful_config = 1


" Prettier
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#parser = 'babylon'
let g:prettier#config#config_precedence = 'prefer-file'
let g:prettier#config#prose_wrap = 'preserve'

" Rust config
let g:racer_cmd = "/home/docler/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1
let g:rustfmt_autosave = 1

" Python REPL
au FileType python map <leader>d :call luaeval('require("iron").core.send(_A[1],_A[2])', [&ft, getline(line("'{"), line("'}"))])<CR>
au FileType python imap <leader>d <Esc>:call luaeval('require("iron").core.send(_A[1],_A[2])', [&ft, getline(line("'{"), line("'}"))])<CR>
" let g:iron_repl_open_cmd = "split"
" let g:iron_repl_open_cmd = 'topright horizontal 100 split'

""""""""""""""
" COMPLETION "
""""""""""""""

" Language client
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:LanguageClient_useVirtualText=0
let g:LanguageClient_diagnosticsSignsMax=10
let g:LanguageClient_settingsPath = "/home/docler/.config/nvim/settings.json"
let g:LanguageClient_serverCommands = {
    \ 'rust': ['/usr/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['python', '-m', 'pyls'],
    \ 'c': ['clangd'],
    \ 'gluon': ['gluon_language-server'],
    \ 'javascript': ['typescript-language-server', '--stdio'],
    \ 'reason': ['/home/docler/.local/bin/reason-language-server'],
    \ }


" Defx
au FileType defx call s:defx_my_settings()
map <leader>f :Defx -toggle -listed -resume -columns=indent:git:icons:filename <CR>

function! s:defx_my_settings() abort
    setlocal signcolumn=no
    setlocal statusline='%#NonText#'
    " Define mappings
    nnoremap <silent><buffer><expr> <CR>
                \ defx#do_action('drop')
    nnoremap <silent><buffer><expr> c
                \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
                \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
                \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> o
                \ defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('drop')
    nnoremap <silent><buffer><expr> K
                \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
                \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M
                \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> S
                \ defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d
                \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
                \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> !
                \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
                \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
                \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
                \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;
                \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> H
                \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> q
                \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
                \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
                \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> <C-g>
                \ defx#do_action('print')
    nnoremap <silent><buffer><expr> C
                \ defx#do_action('change_vim_cwd')
endfunction

" Here I use a different unicode space character as root_marker,
" because it breaks with a normal space or empty string
call defx#custom#option('_', {
            \   'direction': 'topleft',
            \   'root_marker': ' ',
            \   'split': 'vertical',
            \   'winwidth': 30,
            \ })
let g:defx_icons_enable_syntax_highlight = 1
" Change default colors
hi link DefxIconsMarkIcon Statement
hi link DefxIconsDirectory Type
hi link DefxIconsParentDirectory Type
hi link DefxIconsSymlinkDirectory Type
hi link DefxIconsOpenedTreeIcon Type
hi link DefxIconsNestedTreeIcon Type
hi link DefxIconsClosedTreeIcon Type
call defx#custom#column('filename', {
            \ 'root_marker_highlight': 'Ignore',
            \ 'min_width': 30,
            \ 'max_width': 300
            \ })
call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : '',
  \ 'Staged'    : '',
  \ 'Untracked' : '',
  \ 'Renamed'   : '',
  \ 'Unmerged'  : '',
  \ 'Ignored'   : '',
  \ 'Deleted'   : '',
  \ 'Unknown'   : '?'
  \ })

" Python highlight
let g:semshi#excluded_hl_groups=['local', 'global', 'imported', 'parameter', 'free', 'attribute']
let g:semshi#simplify_markup=v:true
let g:semshi#error_sign=v:false
let g:semshi#update_delay_factor=0.0001
function MyCustomHighlights()
    hi semshiParameterUnused guifg=#c8ccd4 cterm=underline gui=underline
    hi semshiBuiltin         guifg=#56b6c2
    hi semshiSelf            guifg=#56b6c2
    hi semshiUnresolved      guifg=#c8ccd4 cterm=underline gui=underline
    hi semshiSelected        guifg=#c8ccd4 guibg=#282c34
endfunction
autocmd FileType python call MyCustomHighlights()

" FZF configs
nnoremap <leader>a :Rg <C-R><C-W><cr>
nnoremap <silent> <C-space> :Buffers<CR>
nnoremap <silent><C-p> :FZF<CR>
nnoremap <silent><C-t> :Tags<CR>
nnoremap <silent><C-s> :Rg<CR>

" Generate tags for :Tags command only using filtered files (no hiddend
" directories and no gitignored files)
let g:fzf_tags_command = 'rg --files | ctags --links=no -L-'

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
            \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)
  let opts = {
        \ 'relative': 'editor',
        \ 'row': 1,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }
  call nvim_open_win(buf, v:true, opts)
endfunction

" Polyglot
let g:polyglot_disabled = ['python']

" Markdown
let g:markdown_composer_browser = 'qutebrowser'
let g:markdown_composer_open_browser = 0

" Statusline
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'   '.l:branchname.'  ':''
endfunction

function! Filename()
    let l:filename = expand('%f')
    return strlen(l:filename) > 0 ? '   '.l:filename.' ' : '   Empty '
endfunction

function! RightStatus()
    return '  '.line('.').':'.col('.').' '
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#DiffAdd#
set statusline+=%{Filename()}
set statusline+=%#CursorColumn#
set statusline+=%m
set statusline+=%=
set statusline+=%#QuickFixLine#
set statusline+=\ %p%%
set statusline+=%{RightStatus()}

" Function to toggle hiding of the statusline
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <S-h> :call ToggleHiddenAll()<CR>

" Closetag config
let g:closetag_filenames = '*.html,*.js,*.jsx'
let g:closetag_xhtml_filenames = '*.js,*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,javascript,jsx'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_close_shortcut = '<leader>>'

" Lightline
let g:lightline = {
            \ 'colorscheme': 'one',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ],
            \   'right': [ [ 'lineinfo' ],
            \            [ 'percent' ],
            \            [ 'filetype' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head'
            \ },
            \ }

" Vim coverage
let g:coverage_json_report_path = 'coverage/coverage-final.json'
let g:coverage_sign_covered = ''
let g:coverage_sign_uncovered = ''
" let g:coverage_auto_start = 0
" let g:coverage_enabled = 0
