runtime! partials/plugins.vim
runtime! partials/settings.vim
runtime! partials/maps.vim

" Set virtualenv
let g:python_host_prog = '/home/docler/.virtualenvs/neovim-python2/bin/python'
let g:python3_host_prog = '/home/docler/.virtualenvs/neovim/bin/python'

""""""""""""""""""
" Plugins configs
""""""""""""""""""

" Automatically trim whitespaces on save
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" Neoterm
map <F4> :Ttoggle<CR>
let g:neoterm_keep_term_open = 0
let g:neoterm_default_mod = 'rightbelow'
let g:neoterm_size = '10'
let g:neoterm_autoinsert = 1

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
" nnoremap <leader>l :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition({'gotoCmd': 'vsplit'})<CR>
" nnoremap <silent> gD :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" nnoremap <silent> gq :call LanguageClient#textDocument_formatting()<CR>
" nnoremap <silent> s :call LanguageClient#textDocument_signatureHelp()<CR>
" nnoremap <silent> <c-.> :call LanguageClient#textDocument_codeAction()<CR>

" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <space>f <cmd>lua vim.lsp.buf.formatting()<CR>

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
" let g:LanguageClient_hoverPreview="Always"
" let g:LanguageClient_signatureHelpOnCompleteDone=1
" let g:LanguageClient_diagnosticsSignsMax=0
" let g:LanguageClient_useVirtualText="No"
" let g:LanguageClient_settingsPath = "/home/docler/.config/nvim/settings.json"
" let g:LanguageClient_serverCommands = {
"             \ 'rust': ['rust-analyzer'],
"             \ 'c': ['clangd'],
"             \ 'cpp': ['clangd'],
"             \ 'python': ['python', '-m', 'pyls'],
"             \ 'javascript': ['typescript-language-server', '--stdio'],
"             \ }
" Configure LSP
lua <<EOF
require'lspconfig'.pyls.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.clangd.setup{}
local pid = vim.fn.getpid()
local omnisharp_bin = "/home/docler/tmp/run"
require'lspconfig'.omnisharp.setup{
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
}
EOF

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

" FZF configs
" nnoremap <silent><C-space> :Buffers<CR>
" nnoremap <silent><C-p> :FZF<CR>
" nnoremap <silent><C-t> :Tags<CR>
" nnoremap <silent><C-space> :Clap buffers<CR>
nnoremap <silent><C-p> :Clap files<CR>
autocmd FileType clap_input inoremap <silent> <buffer> <C-n> <C-R>=clap#navigation#linewise('down')<CR>
autocmd FileType clap_input inoremap <silent> <buffer> <C-p> <C-R>=clap#navigation#linewise('up')<CR>
" nnoremap <silent><C-t> :call LanguageClient#textDocument_documentSymbol()<CR>
" Rg has problems right now (04/12/2019), it
" hangs and seems to have a memory leak. I'm going to
" use Ag for now, but change it back in the future
" nnoremap <leader>a :Rg <C-R><C-W><cr>
" noremap <silent><C-s> :Rg<CR>

nnoremap <leader>tf <cmd>Telescope find_files<cr>
" nnoremap <silent><C-p> <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <silent><C-s> <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <silent><C-space> <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>

" Generate tags for :Tags command only using filtered files (no hiddend
" directories and no gitignored files)
" let g:fzf_tags_command = 'rg --files | ctags --links=no -L-'
" let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:11,bg:8,hl:1,fg+:3,bg+:8,hl+:5 --color=info:3,prompt:3,pointer:3,marker:4,spinner:11,header:6 --layout=reverse  --margin=1,4'
" let g:fzf_layout = { 'window': 'call FloatingFZF()' }
" function! FloatingFZF()
"     let height = &lines - 3
"     let width = float2nr(&columns - (&columns * 2 / 10))
"     let col = float2nr((&columns - width) / 2)
"     let opts = {
"                 \ 'relative': 'editor',
"                 \ 'row': 1,
"                 \ 'col': col,
"                 \ 'width': width,
"                 \ 'height': height - 3
"                 \ }

"     let buf = nvim_create_buf(v:false, v:true)
"     let win = nvim_open_win(buf, v:true, opts)
"     call setwinvar(win, '&winhl', 'Normal:Pmenu')

"     setlocal
"           \ buftype=nofile
"           \ nobuflisted
"           \ bufhidden=hide
"           \ nonumber
"           \ norelativenumber
"           \ signcolumn=no
" endfunction

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
" highlight link EchoDocFloat Pmenu
let g:echodoc#events = ['CompleteDone', 'InsertEnter']

" NCM2
" autocmd BufEnter  *  call ncm2#enable_for_buffer()
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}
EOF
" Nvim compe
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true
let g:compe.source = {}
let g:compe.source.path = v:false
let g:compe.source.buffer = v:false
let g:compe.source.calc = v:false
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:false
let g:compe.source.vsnip = v:false
let g:compe.source.emoji = v:false
" Kitty
" map <silent> <C-h> :KittyNavigateLeft<cr>
" map <silent> <C-j> :KittyNavigateDown<cr>
" map <silent> <C-k> :KittyNavigateUp<cr>
" map <silent> <C-l> :KittyNavigateRight<cr>
