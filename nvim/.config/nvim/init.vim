runtime! partials/plugins.vim
runtime! partials/settings.vim
runtime! partials/maps.vim

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

" nnoremap <leader>tf <cmd>Telescope find_files<cr>
" nnoremap <silent><C-p> <cmd>Telescope find_files cwd=%:p:h<cr>
nnoremap <silent><C-p> <cmd>:lua require'config.telescope'.project_files({cwd = vim.fn.expand('%:p:h')})<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <silent><C-s> <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <silent><C-space> <cmd>Telescope buffers<cr>
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

" I only use beacon for livecoding
let g:beacon_enable = 0

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

set guifont=FiraCode\ Nerd\ Font\ Mono:h16
let g:neovide_refresh_rate=75
let g:neovide_cursor_animation_length=0.03
let g:neovide_cursor_vfx_mode = "sonicboom"
let g:neovide_cursor_vfx_particle_lifetime=0.2

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
map <silent> <C-h> :KittyNavigateLeft<cr>
map <silent> <C-j> :KittyNavigateDown<cr>
map <silent> <C-k> :KittyNavigateUp<cr>
map <silent> <C-l> :KittyNavigateRight<cr>

" file explorer
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_hide_dotfiles = 1
let g:nvim_tree_auto_close = 1
nnoremap <leader>f :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" Treesitter
lua require'config.treesitter'
" Telescope configs
lua require'config.telescope'.setup{}
" bufferline
lua require'config.bufferline'
" galaxyline
lua require'config.galaxyline'
" Configure LSP
lua require'config.lsp'
" gitsigns
lua require'config.gitsigns'
let g:indent_blankline_char = '│'
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_filetype_exclude = ['help']
let g:indent_blankline_buftype_exclude = ['terminal']

" Do not add default neoterm maps
let g:neoterm_automap_keys = 0

" ultest
let g:ultest_max_threads = 1
let g:ultest_output_on_line = 0
