call plug#begin('~/.config/nvim/plugged')
Plug 'CaffeineViking/vim-glsl'
Plug 'rafamadriz/friendly-snippets'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'folke/tokyonight.nvim'
Plug 'shaunsingh/nord.nvim'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Test stuff
Plug 'janko-m/vim-test'
Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'tami5/lspsaga.nvim', {'branch': 'nvim51'}
Plug 'ray-x/lsp_signature.nvim'
Plug 'folke/trouble.nvim'

"Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'TimUntersberger/neogit'
" Plug 'samoshkin/vim-mergetool'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate all'}
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'saecki/crates.nvim'

" FZF
Plug 'ibhagwan/fzf-lua'
Plug 'vijaymarupudi/nvim-fzf'

Plug 'knubie/vim-kitty-navigator'

" OpenSCAD syntax
Plug 'sirtaj/vim-openscad'

Plug 'jamessan/vim-gnupg'

" Useless stuff
Plug 'danilamihailov/beacon.nvim'
Plug 'kkvh/vim-docker-tools'

Plug 'davidgranstrom/scnvim', { 'do': {-> scnvim#install() } }
" Colorizer
Plug 'norcalli/nvim-colorizer.lua'

" Auto closing stuff
Plug 'windwp/nvim-autopairs'
Plug 'alvan/vim-closetag'

" Statusline
Plug 'windwp/windline.nvim'
Plug 'akinsho/nvim-bufferline.lua'

" Coding stuff
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'lukas-reineke/headlines.nvim'

" Trim whitespaces
Plug 'ntpeters/vim-better-whitespace'

" Close buffer
" XXX: Change with famiu/bufdelete.nvim
Plug 'rbgrouleff/bclose.vim'

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

"Dart/Flutter
Plug 'akinsho/flutter-tools.nvim'
Plug 'elkowar/yuck.vim'
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
Plug 'simrat39/rust-tools.nvim'

" Old plugins
" Plug 'jiangmiao/auto-pairs' THIS IS EVIL DO NOT USE IT
" Plug 'jbyuki/instant.nvim'
" Plug 'Psykopear/neovim-package-info', { 'do': './install.sh' }
" Plug 'ncm2/float-preview.nvim'
" Plug 'Shougo/echodoc.vim'
" Plug 'romgrk/barbar.nvim'
" Plug 'glepnir/galaxyline.nvim', {'branch': 'main'}
" Plug 'clktmr/vim-gdscript3'
" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
" Plug 'Th3Whit3Wolf/one-nvim'
" Plug 'hrsh7th/nvim-compe'
" Plug 'tpope/vim-fugitive'
" Plug 'junegunn/gv.vim'
" Plug 'ahmedkhalf/lsp-rooter.nvim'
" Plug 'glepnir/lspsaga.nvim'
" Plug 'kabouzeid/nvim-lspinstall'
" Plug 'L3MON4D3/LuaSnip'
" Plug 'madskjeldgaard/SCFormatter'
" Plug 'mattn/vim-sqlfmt'
" Plug 'alcesleo/vim-uppercase-sql'
" Plug 'NoahTheDuke/vim-just'
" Plug 'pest-parser/pest.vim'
" Plug 'supercollider/scvim'
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'thosakwe/vim-flutter'
" Plug 'natebosch/vim-lsc'
" Plug 'natebosch/vim-lsc-dart'
" Plug 'Shatur/neovim-session-manager'
" Plug 'ryanoasis/vim-devicons'
" Plug 'mfussenegger/nvim-dap'
" Plug 'rcarriga/nvim-dap-ui'
call plug#end()
