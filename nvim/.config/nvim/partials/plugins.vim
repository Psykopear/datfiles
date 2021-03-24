call plug#begin('~/.config/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/lsp_extensions.nvim'
" Plug 'nvim-lua/completion-nvim'
" Plug 'nvim-lua/diagnostic-nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate all'}
Plug 'Th3Whit3Wolf/one-nvim'
" Plug 'omnisharp/omnisharp-vim'
" Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'knubie/vim-kitty-navigator'

" OpenSCAD syntax
Plug 'sirtaj/vim-openscad'

Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'jamessan/vim-gnupg'
" Useless stuff
" Plug 'itchyny/calendar.vim'
Plug 'danilamihailov/beacon.nvim'
" Plug 'liuchengxu/vista.vim'
Plug 'kkvh/vim-docker-tools'
" Plug 'chriskempson/base16-vim'

" Gdscript syntax
Plug 'clktmr/vim-gdscript3'

" SQL Formatter and uppercaser (I just invented the word)
Plug 'mattn/vim-sqlfmt'
Plug 'alcesleo/vim-uppercase-sql'

" Various languages syntax styles
" let g:polyglot_disabled = ['python', 'csv']
" Plug 'sheerun/vim-polyglot'
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
" Plug 'autozimu/LanguageClient-neovim', {
"             \ 'branch': 'next',
"             \ 'do': 'bash install.sh',
"             \ }
" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" FZF
" Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim'

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
" Plug 'benmills/vimux'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'tmux-plugins/vim-tmux-focus-events'
" Plug 'tmux-plugins/vim-tmux'

" File explorer
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'

" Code and tpope stuff
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-sandwich'

" Colors
" Plug 'joshdick/onedark.vim'

" Neoterm
Plug 'kassio/neoterm'

" Javascript del cazzo
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'leafgarland/typescript-vim'

" Python
Plug 'Vigemus/iron.nvim'
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Plug 'python/black'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" Moar fancy icons
Plug 'ryanoasis/vim-devicons'
" function! BuildComposer(info)
"     if a:info.status != 'unchanged' || a:info.force
"         !cargo build --release
"     endif
" endfunction
" Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
call plug#end()
