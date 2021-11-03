runtime! partials/plugins.vim
runtime! partials/settings.vim
runtime! partials/maps.vim

set foldmethod=indent
"" Disabled due to a bug that makes this really slow, should be solved on
"" master though
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=99

set title
let &titlestring='%t - nvim'

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
autocmd Filetype javascript,cucumber,openscad,lua setlocal ts=2 sts=2 sw=2
let g:jsx_ext_required = 0
let g:used_javascript_libs = 'underscore,react'
let g:vim_jsx_pretty_colorful_config = 1

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

" Visualize diagnostics
let g:diagnostic_enable_virtual_text = 0
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
autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }

" nnoremap <silent><C-p> <cmd>:lua require'config.telescope'.project_files({cwd = vim.fn.expand('%:p:h')})<cr>
" nnoremap <silent><C-p> <cmd>:FZF<CR>
nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>
nnoremap <c-space> <cmd>lua require('fzf-lua').buffers()<CR>
nnoremap <c-s> <cmd>lua require('fzf-lua').live_grep()<cr>
nnoremap <leader>a <cmd>lua require('fzf-lua').grep_cWORD()<cr>
" nnoremap <leader>a :Telescope grep_string search=<C-R><C-W><CR>
" nnoremap <silent><C-s> <cmd>Telescope live_grep<cr>
" nnoremap <silent><C-space> <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>

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

" Vim coverage
let g:coverage_json_report_path = 'coverage/coverage-final.json'
let g:coverage_sign_covered = ''
let g:coverage_sign_uncovered = ''

" echodoc
let g:echodoc#enable_at_startup = 1
" highlight link EchoDocFloat Pmenu
let g:echodoc#events = ['CompleteDone', 'InsertEnter']

" Hide ~ on blank lines
highlight EndOfBuffer guifg=bg

let g:vim_markdown_conceal_code_blocks = 0

" Picom config file as dosini
au BufRead,BufNewFile picom.conf set filetype=dosini

" " Floating Term
" let s:float_term_border_win = 0
" let s:float_term_win = 0
" function! FloatTerm(...)
"     " Configuration
"     let height = float2nr((&lines - 2) * 0.6)
"     let row = float2nr((&lines - height) / 2)
"     let width = float2nr(&columns * 0.6)
"     let col = float2nr((&columns - width) / 2)
"     " Border Window
"     let border_opts = {
"                 \ 'relative': 'editor',
"                 \ 'row': row - 1,
"                 \ 'col': col - 2,
"                 \ 'width': width + 4,
"                 \ 'height': height + 2,
"                 \ 'style': 'minimal'
"                 \ }
"     " Terminal Window
"     let opts = {
"                 \ 'relative': 'editor',
"                 \ 'row': row,
"                 \ 'col': col,
"                 \ 'width': width,
"                 \ 'height': height,
"                 \ 'style': 'minimal'
"                 \ }
"     let top = "╭" . repeat("─", width + 2) . "╮"
"     let mid = "│" . repeat(" ", width + 2) . "│"
"     let bot = "╰" . repeat("─", width + 2) . "╯"
"     let lines = [top] + repeat([mid], height) + [bot]
"     let bbuf = nvim_create_buf(v:false, v:true)
"     call nvim_buf_set_lines(bbuf, 0, -1, v:true, lines)
"     let s:float_term_border_win = nvim_open_win(bbuf, v:true, border_opts)
"     let buf = nvim_create_buf(v:false, v:true)
"     let s:float_term_win = nvim_open_win(buf, v:true, opts)
"     " Styling
"     call setwinvar(s:float_term_border_win, '&winhl', 'Normal:Normal')
"     call setwinvar(s:float_term_win, '&winhl', 'Normal:Normal')
"     if a:0 == 0
"         terminal
"     else
"         " Add a prompt so the user has to press something to close the window
"         " otherwise it closes itself as soon as the job is over
"         call termopen(a:1 . "; echo 'Press anything to close' && read")
"     endif
"     startinsert
"     " Close border window when terminal window close
"     autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_border_win, v:true)
" endfunction
" nnoremap <Leader>ta :call FloatTerm()<CR>

" Vim tests
nmap <leader>tt :UltestNearest<CR>
nmap <leader>ta :Ultest<CR>
nmap <leader>ts :UltestSummary<CR>
" let g:test#strategy = 'vimux'
" let g:test#custom_strategies = {'float-term': function('FloatTerm')}
" let g:test#strategy = 'float-term'
let test#strategy = 'neoterm'
let test#python#runner = 'pytest'
let test#python#pytest#options = '-s -vv --no-cov'

" Calendar settings
" let g:calendar_google_calendar = 1
" let g:calendar_google_task = 1
let g:nv_search_paths = ['~/notes']

" Set jinja filetype on files under templates dirs
augroup htmldjango_ft
    au!
    autocmd BufNewFile,BufRead */templates/*.html set ft=htmldjango
augroup END

" Set css and xml filetypes on unity's uss and uxml
augroup htmldjango_ft
    au!
    autocmd BufNewFile,BufRead *uss set ft=css
    autocmd BufNewFile,BufRead *uxml set ft=xml
augroup END

" I only use beacon for livecoding
let g:beacon_enable = 0

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" set guifont=FiraCode\ Nerd\ Font\ Mono:h14:style=Bold
" set guifont=FiraCode\ Nerd\ Font\ Mono:h14
set guifont=Monolisa,FiraCode\ Nerd\ Font\ Mono:h16:style=Bold
let g:neovide_refresh_rate=75
let g:neovide_cursor_animation_length=0.03
let g:neovide_cursor_trail_length=1.0
let g:neovide_cursor_vfx_mode = "sonicboom"
" let g:neovide_cursor_vfx_mode = "railgun"
let g:neovide_cursor_vfx_particle_lifetime=0.4

" Nvim compe
" let g:compe = {}
" let g:compe.enabled = v:true
" let g:compe.autocomplete = v:true
" let g:compe.debug = v:false
" let g:compe.min_length = 1
" let g:compe.preselect = 'enable'
" let g:compe.throttle_time = 80
" let g:compe.source_timeout = 200
" let g:compe.incomplete_delay = 400
" let g:compe.max_abbr_width = 100
" let g:compe.max_kind_width = 100
" let g:compe.max_menu_width = 100
" let g:compe.documentation = v:true
" let g:compe.source = {}
" let g:compe.source.path = v:true
" let g:compe.source.tags = v:true
" let g:compe.source.buffer = v:false
" " let g:compe.source.calc = v:false
" let g:compe.source.calc = v:true
" let g:compe.source.nvim_lsp = v:true
" let g:compe.source.nvim_lua = v:true
" let g:compe.source.luasnip = v:false
" let g:compe.source.vsnip = v:true
" let g:compe.source.emoji = v:false
" inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR>      compe#confirm('<CR>')
" inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
"

lua << EOF
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    cmp.setup {
        mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            },
        },
        formatting = {
            format = function(entry, vim_item)
                vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
                -- set a name for each source
                vim_item.menu = ({
                  buffer = "[Buffer]",
                  nvim_lsp = "[LSP]",
                  luasnip = "[LuaSnip]",
                  nvim_lua = "[Lua]",
                  latex_symbols = "[Latex]",
                })[entry.source.name]
                return vim_item
            end
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = "path" },
            { name = "buffer" },
            { name = "crates" },
        }
    }
EOF

" file explorer
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_hide_dotfiles = 1
let g:nvim_tree_highlight_opened_files = 2
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_show_icons = {
            \ 'git': 1,
            \ 'folders': 1,
            \ 'files': 1,
            \ 'folder_arrows': 1,
            \}
" let g:nvim_tree_auto_close = 1
nnoremap <leader>f :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
let g:nvim_tree_ignore = [ '*.meta' ]

" Treesitter
lua require'config.treesitter'
" Telescope configs
lua require'config.telescope'.setup{}
" bufferline
lua require'config.bufferline'
" galaxyline
" lua require'config.galaxyline'
" Winline
lua require('wlsample.evil_line')
" lua require('wlsample.bubble2')
" lua require('wlfloatline').setup()
" Configure LSP
lua require'config.lsp'
lua require'config.lspupdate'
" gitsigns
lua require'config.gitsigns'
" LSP rooter
" lua require'config.lsp-rooter'
" web devicons
lua require'config.nvim-web-devicons'
" lua require'config.iron'
let g:indent_blankline_char = '│'
let g:indent_blankline_use_treesitter = v:true
" let g:indent_blankline_show_current_context = v:true
let g:indent_blankline_filetype_exclude = ['help']
let g:indent_blankline_buftype_exclude = ['terminal']

" nvim-autopairs
lua require('nvim-autopairs').setup{}

" Do not add default neoterm maps
let g:neoterm_automap_keys = 0

" ultest
let g:ultest_max_threads = 1
let g:ultest_output_on_line = 0

let g:scnvim_scdoc = 1

" DAP and Dap-ui
" lua require'config.dap'
" nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
" nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
" nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
" nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
" nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
" nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
" nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
lua << EOF

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'ga', '<Cmd>Lspsaga code_action<CR>', opts)
  -- buf_set_keymap('n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
  -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Add lspkind config
  require('lspkind').init({})
end

require("flutter-tools").setup{
   lsp = { on_attach = on_attach }
}

EOF

lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

lua << EOF
require("headlines").setup()
EOF

lua << EOF
require("nvim-tree").setup()
EOF

let g:instant_username = "Docler"
