call plug#begin('~/.config/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'glepnir/lspsaga.nvim'
" Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate all'}
Plug 'Th3Whit3Wolf/one-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'knubie/vim-kitty-navigator'

" OpenSCAD syntax
Plug 'sirtaj/vim-openscad'

" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'jamessan/vim-gnupg'
" Useless stuff
Plug 'danilamihailov/beacon.nvim'
Plug 'kkvh/vim-docker-tools'

" Gdscript syntax
Plug 'clktmr/vim-gdscript3'

" SQL Formatter and uppercaser (I just invented the word)
Plug 'mattn/vim-sqlfmt'
Plug 'alcesleo/vim-uppercase-sql'

" Various languages syntax styles
Plug 'pest-parser/pest.vim'

" Supercollider
Plug 'supercollider/scvim'

" Colorizer
Plug 'norcalli/nvim-colorizer.lua'

" Auto closing stuff
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

" Statusline
Plug 'glepnir/galaxyline.nvim', {'branch': 'main'}
Plug 'akinsho/nvim-bufferline.lua'

" Coding stuff
Plug 'ncm2/float-preview.nvim'
Plug 'Shougo/echodoc.vim'

Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }

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

" File explorer
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Code and tpope stuff
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-sandwich'

" Neoterm
Plug 'kassio/neoterm'

" Python
Plug 'Vigemus/iron.nvim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" Moar fancy icons
Plug 'ryanoasis/vim-devicons'
call plug#end()
