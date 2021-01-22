call plug#begin('~/.config/nvim/plugged')
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/lsp_extensions.nvim'
" Plug 'nvim-lua/completion-nvim'
" Plug 'nvim-lua/diagnostic-nvim'
" Plug 'nvim-treesitter/nvim-treesitter'

" OpenSCAD syntax
Plug 'sirtaj/vim-openscad'

Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'jamessan/vim-gnupg'
" Useless stuff
Plug 'itchyny/calendar.vim'
Plug 'danilamihailov/beacon.nvim'
Plug 'liuchengxu/vista.vim'
Plug 'kkvh/vim-docker-tools'
" Plug 'chriskempson/base16-vim'

" Gdscript syntax
Plug 'clktmr/vim-gdscript3'

" SQL Formatter and uppercaser (I just invented the word)
Plug 'mattn/vim-sqlfmt'
Plug 'alcesleo/vim-uppercase-sql'

" Various languages syntax styles
let g:polyglot_disabled = ['python', 'csv']
Plug 'sheerun/vim-polyglot'
Plug 'pest-parser/pest.vim'

" Supercollider
Plug 'supercollider/scvim'

" Colorizer
Plug 'norcalli/nvim-colorizer.lua'

" Auto closing stuff
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Coding stuff
Plug 'ncm2/float-preview.nvim'
Plug 'Shougo/echodoc.vim'
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" FZF
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" My own plugin
Plug 'Psykopear/neovim-package-info', { 'do': './install.sh' }

" Trim whitespaces
Plug 'ntpeters/vim-better-whitespace'

" Close buffer
Plug 'rbgrouleff/bclose.vim'

" Git stuff
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'samoshkin/vim-mergetool'

" Test stuff
Plug 'janko-m/vim-test'

" Tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'

" File explorer
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'

" Code and tpope stuff
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-sandwich'

" Colors
Plug 'joshdick/onedark.vim'

" Neoterm
Plug 'kassio/neoterm'

" Javascript del cazzo
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'leafgarland/typescript-vim'

" Python
Plug 'Vigemus/iron.nvim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'python/black'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" Moar fancy icons
Plug 'ryanoasis/vim-devicons'
function! BuildComposer(info)
    if a:info.status != 'unchanged' || a:info.force
        !cargo build --release
    endif
endfunction
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
call plug#end()

"""""""""""""""""""""""""""
" Neovim general settings "
"""""""""""""""""""""""""""
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
set nonumber
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
" set signcolumn=no
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
set completeopt=noinsert,menuone,noselect
" set ttimeout
" set ttimeoutlen=0

" Keep cursor vertically centered
" nnoremap j }zz
" nnoremap k {zz
" nnoremap <space> za
" nnoremap <M-space> {
set scrolloff=900
nnoremap G Gzz
nnoremap n nzz

" Set virtualenv
let g:python_host_prog = '/home/docler/.virtualenvs/neovim-python2/bin/python'
let g:python3_host_prog = '/home/docler/.virtualenvs/neovim/bin/python'
" let g:black_virtualenv = '/home/docler/.virtualenvs/neovim'
" let g:python_host_prog = '/usr/bin/python'
" let g:python3_host_prog = '/usr/bin/python2'
" let g:black_virtualenv = '/home/docler/.virtualenvs/neovim'

" Colors
set termguicolors
set background=dark
syntax enable
filetype plugin indent on
set synmaxcol=200
let g:onedark_terminal_italics=1
" let base16colorspace=256
" colorscheme base16-onedark
colorscheme onedark
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

" Esc with jj
inoremap jj <Esc>

" Base64 decode/encode
vnoremap <leader>64d c<c-r>=system('base64 --decode', @")<cr><esc>
vnoremap <leader>64e c<c-r>=system('base64', @")<cr><esc>

" Folding
set foldlevelstart=10        " default folding level when buffer is opened
set foldnestmax=10           " maximum nested fold
set foldmethod=indent

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
let g:indentLine_char = '▏'
let g:indentLine_fileType = ['python', 'javascript', 'rust']

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

tnoremap jj <C-\><C-n>
" tnoremap <C-h> <C-\><C-n><C-w>h
" tnoremap <C-j> <C-\><C-n><C-w>j
" tnoremap <C-k> <C-\><C-n><C-w>k
" tnoremap <C-l> <C-\><C-n><C-w>l

" Delete previous character with backspace in normal mode
noremap <BS> hx

" Close buffer
noremap <leader>c :Bclose <CR>
" noremap <leader>bd :1,100bd<CR>

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

""""""""""""""""""
" Plugins configs
""""""""""""""""""

" Automatically trim whitespaces on save
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" Neoterm
" tnoremap <Esc> <C-\><C-n>
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
" autocmd! gitgutter CursorHold,CursorHoldI
" autocmd BufWritePost * GitGutter
let g:gitgutter_terminal_reports_focus=0

" fuGITive
nmap <silent><Leader>g :G<CR><C-w>L:vertical resize 80<CR>

" Vista
map <F8> :Vista lcn<CR>
let g:vista_sidebar_width = 40
let g:vista_echo_cursor_strategy = "floating_win"
let g:vista_icon_indent = ['- ', '- ']

" Rainbow
let g:rainbow_active = 1

" Supercollider
let g:sclangTerm = "kitty -e"
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
autocmd Filetype javascript,cucumber,openscad setlocal ts=2 sts=2 sw=2
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
au FileType python map <leader>ds :call luaeval('require("iron").core.send(_A[1],_A[2])', [&ft, getline(line("'{"), line("'}"))])<CR>
au FileType python imap <leader>ds <Esc> :call luaeval('require("iron").core.send(_A[1],_A[2])', [&ft, getline(line("'{"), line("'}"))])<CR>
" let g:iron_repl_open_cmd = "split"
" let g:iron_repl_open_cmd = 'topright horizontal 100 split'

""""""""""""""
" COMPLETION "
""""""""""""""

" Language client
nnoremap <leader>l :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition({'gotoCmd': 'vsplit'})<CR>
nnoremap <silent> gD :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> gq :call LanguageClient#textDocument_formatting()<CR>
nnoremap <silent> s :call LanguageClient#textDocument_signatureHelp()<CR>

" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
" Visualize diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_trimmed_virtual_text = '40'
" Don't show diagnostics while in insert mode
let g:diagnostic_insert_delay = 1

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
" autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>PrevDiagnosticCycle<cr>
nnoremap <silent> g] <cmd>NextDiagnosticCycle<cr>

" Enable type inlay hints
" autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
" \ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }

" augroup markdown_language_client_commands
"     autocmd!
"     autocmd WinLeave __LanguageClient__ ++nested call <SID>fixLanguageClientHover()
" augroup END

" function! s:fixLanguageClientHover()
"     setlocal modifiable
"     setlocal conceallevel=2
"     normal i
"     setlocal nonu nornu
"     setlocal nomodifiable
" endfunction

" let g:float_preview#docked = 0
let g:LanguageClient_hoverPreview="Always"
let g:LanguageClient_signatureHelpOnCompleteDone=1
let g:LanguageClient_diagnosticsSignsMax=0
let g:LanguageClient_useVirtualText="No"
let g:LanguageClient_settingsPath = "/home/docler/.config/nvim/settings.json"
let g:LanguageClient_serverCommands = {
            \ 'rust': ['rust-analyzer'],
            \ 'c': ['clangd'],
            \ 'cpp': ['clangd'],
            \ 'python': ['python', '-m', 'pyls'],
            \ 'javascript': ['typescript-language-server', '--stdio'],
            \ }
" Configure LSP
" https://github.com/neovim/nvim-lspconfig#rust_analyzer
" lua <<EOF
"
" -- nvim_lsp object
" local nvim_lsp = require'nvim_lsp'
"
" -- function to attach completion and diagnostics
" -- when setting up lsp
" local on_attach = function(client)
"     require'completion'.on_attach(client)
"     require'diagnostic'.on_attach(client)
" end
"
" -- Enable rust_analyzer
" nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })
" nvim_lsp.pyls.setup{}
" nvim_lsp.tsserver.setup{}
" nvim_lsp.clangd.setup{}
"
" EOF

" Defx
au FileType defx call s:defx_my_settings()
map <leader>f :Defx -toggle -listed -resume -columns=indent:git:icons:filename <CR>

function! s:defx_my_settings() abort
    setlocal scrolloff=0
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
" hi link DefxIconsMarkIcon Statement
" hi link DefxIconsDirectory Error
" hi link DefxIconsParentDirectory Type
" hi link DefxIconsSymlinkDirectory Type
" hi link DefxIconsOpenedTreeIcon Error
" hi link DefxIconsNestedTreeIcon Error
" hi link DefxIconsClosedTreeIcon Error
call defx#custom#column('filename', {
            \ 'root_marker_highlight': 'Ignore',
            \ 'min_width': 40,
            \ 'max_width': 100
            \ })
call defx#custom#column('git', 'indicators', {
            \ 'Modified'  : '',
            \ 'Staged'    : '+',
            \ 'Untracked' : '#',
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
" nnoremap <silent><C-space> :Buffers<CR>
" nnoremap <silent><C-p> :FZF<CR>
" nnoremap <silent><C-t> :Tags<CR>
nnoremap <silent><C-space> :Clap buffers<CR>
nnoremap <silent><C-p> :Clap files<CR>
nnoremap <silent><C-t> :call LanguageClient#textDocument_documentSymbol()<CR>
" Rg has problems right now (04/12/2019), it
" hangs and seems to have a memory leak. I'm going to
" use Ag for now, but change it back in the future
nnoremap <leader>a :Rg <C-R><C-W><cr>
noremap <silent><C-s> :Rg<CR>

" Generate tags for :Tags command only using filtered files (no hiddend
" directories and no gitignored files)
let g:fzf_tags_command = 'rg --files | ctags --links=no -L-'
let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:11,bg:8,hl:1,fg+:3,bg+:8,hl+:5 --color=info:3,prompt:3,pointer:3,marker:4,spinner:11,header:6 --layout=reverse  --margin=1,4'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
function! FloatingFZF()
    let height = &lines - 3
    let width = float2nr(&columns - (&columns * 2 / 10))
    let col = float2nr((&columns - width) / 2)
    let opts = {
                \ 'relative': 'editor',
                \ 'row': 1,
                \ 'col': col,
                \ 'width': width,
                \ 'height': height - 3
                \ }

    let buf = nvim_create_buf(v:false, v:true)
    let win = nvim_open_win(buf, v:true, opts)
    call setwinvar(win, '&winhl', 'Normal:Pmenu')

    setlocal
          \ buftype=nofile
          \ nobuflisted
          \ bufhidden=hide
          \ nonumber
          \ norelativenumber
          \ signcolumn=no
endfunction


" Markdown
let g:markdown_composer_browser = 'qutebrowser'
let g:markdown_composer_open_browser = 0

" Closetag config
let g:closetag_filenames = '*.html,*.js,*.jsx'
let g:closetag_xhtml_filenames = '*.js,*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,javascript,jsx'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_close_shortcut = '<leader>>'

" Airline
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 0
" let g:airline_section_c = ''
let g:airline_left_sep = "\uE0B8"
let g:airline_right_sep = "\uE0BA"
let g:airline_left_alt_sep = "\uE0B9"
let g:airline_right_alt_sep = "\uE0BB"

" Vim coverage
let g:coverage_json_report_path = 'coverage/coverage-final.json'
let g:coverage_sign_covered = ''
let g:coverage_sign_uncovered = ''

" echodoc
let g:echodoc#enable_at_startup = 1
highlight link EchoDocFloat Pmenu
let g:echodoc#events = ['CompleteDone', 'InsertEnter']

" NCM2
autocmd BufEnter  *  call ncm2#enable_for_buffer()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Trigger completion with <Tab>
" inoremap <silent><expr> <TAB>
"   \ pumvisible() ? "\<C-n>" :
"   \ <SID>check_back_space() ? "\<TAB>" :
"   \ completion#trigger_completion()

" function! s:check_back_space() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" Hide ~ on blank lines
highlight EndOfBuffer guifg=bg

let g:vim_markdown_conceal_code_blocks = 0

" Picom config file as dosini
au BufRead,BufNewFile picom.conf set filetype=dosini

" Floating Term
let s:float_term_border_win = 0
let s:float_term_win = 0
function! FloatTerm(...)
  " Configuration
  let height = float2nr((&lines - 2) * 0.6)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns * 0.6)
  let col = float2nr((&columns - width) / 2)
  " Border Window
  let border_opts = {
        \ 'relative': 'editor',
        \ 'row': row - 1,
        \ 'col': col - 2,
        \ 'width': width + 4,
        \ 'height': height + 2,
        \ 'style': 'minimal'
        \ }
  " Terminal Window
  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  let top = "╭" . repeat("─", width + 2) . "╮"
  let mid = "│" . repeat(" ", width + 2) . "│"
  let bot = "╰" . repeat("─", width + 2) . "╯"
  let lines = [top] + repeat([mid], height) + [bot]
  let bbuf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(bbuf, 0, -1, v:true, lines)
  let s:float_term_border_win = nvim_open_win(bbuf, v:true, border_opts)
  let buf = nvim_create_buf(v:false, v:true)
  let s:float_term_win = nvim_open_win(buf, v:true, opts)
  " Styling
  call setwinvar(s:float_term_border_win, '&winhl', 'Normal:Normal')
  call setwinvar(s:float_term_win, '&winhl', 'Normal:Normal')
  if a:0 == 0
    terminal
  else
    " Add a prompt so the user has to press something to close the window
    " otherwise it closes itself as soon as the job is over
    call termopen(a:1 . "; echo 'Press anything to close' && read")
  endif
  startinsert
  " Close border window when terminal window close
  autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_border_win, v:true)
endfunction
nnoremap <Leader>ta :call FloatTerm()<CR>

" Vim tests
nmap <silent><Leader>tt <Esc>:TestNearest<CR>
let g:test#strategy = 'vimux'
" let g:test#custom_strategies = {'float-term': function('FloatTerm')}
" let g:test#strategy = 'float-term'
" let test#strategy = 'neoterm'
let test#python#runner = 'pytest'
let test#python#pytest#options = '-s -vv'

" Calendar settings
" let g:calendar_google_calendar = 1
" let g:calendar_google_task = 1
let g:nv_search_paths = ['~/notes']

" Set jinja filetype on files under templates dirs
augroup htmldjango_ft
  au!
  autocmd BufNewFile,BufRead */templates/*.html set ft=htmldjango
augroup END

" I only use beacon for livecoding
let g:beacon_enable = 0

" Clap
let g:clap_layout = { 'width': '70%', 'height': '70%', 'row': '15%', 'col': '15%', 'relative': 'editor' }
let g:clap_popup_border = 'sharp'
let g:clap_insert_mode_only = v:true
let g:clap_search_box_border_style = 'nil'

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

set guifont=FiraCode\ Nerd\ Font\ Mono:h16
let g:neovide_refresh_rate=75
let g:neovide_cursor_animation_length=0.03
let g:neovide_cursor_vfx_mode = "sonicboom"
let g:neovide_cursor_vfx_particle_lifetime=0.2

" Treesitter
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "all",     -- one of "all", "language", or a list of languages
"   highlight = {
"     enable = true,              -- false will disable the whole extension
"   },
" }
" EOF
