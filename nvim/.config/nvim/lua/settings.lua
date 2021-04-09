local set = require('utils')

-----------------------
-- Commands
-----------------------
vim.cmd 'filetype plugin indent on'
set.o('termguicolors', true)
vim.cmd 'colorscheme one-nvim'

-- Not sure why, but using vim.g.showmode = false does not work
vim.cmd 'set noshowmode'
-- vim.g.noshowmode = true
-- vim.g.showmode = false

-- Mouse, same as above
vim.cmd 'set mousemodel=popup'
vim.cmd 'set mouse=a'
-- vim.g.mousemodel = 'popup'
-- vim.g.mouse = 'a'

vim.cmd 'set clipboard+=unnamedplus'
-- vim.g.clipboard = 'unnamedplus'

vim.cmd 'set shortmess+=c'
-- vim.g.shortmess = 'filnxtToOFc'

-----------------------
-- Global options
-----------------------
vim.g.completeopt = "menuone,noselect"
vim.g.encoding = 'utf8'
vim.g.splitbelow = true
vim.g.splitright = true
vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.g.updatetime = 100
vim.g.shell = '/bin/zsh'
vim.g.history = 2000
vim.g.hlsearch = true
vim.g.hidden = true
vim.g.lazyredraw = true
vim.g.showcmd = true
vim.g.wildmenu = true
vim.g.showmatch = true
vim.g.backup = false
vim.g.swapfile = false
vim.g.pumheight = 10
vim.g.scrolloff = 900
-- Search
set.o('incsearch', true)
-- vim.g.incsearch = true
set.o('hlsearch', true)
-- vim.g.hlsearch = true
set.o('ignorecase', true)
-- vim.g.ignorecase = true
set.o('smartcase', true)
-- vim.g.smartcase = true
set.o('autoread', true)
-- vim.g.autoread = true

-- Things that might not be needed but I'm not sure
-- vim.g.fillchars = 'eob: ,vert:│'


-----------------------
-- Window local options
-----------------------
set.w('number', true)
-- Do not wrap by default
set.w('wrap', false)
set.w('conceallevel', 3)
set.w('signcolumn', 'yes')

-----------------------
-- Buffer local options
-----------------------
set.b('synmaxcol', 200)
-- Tabs
local indent = 4
set.b('expandtab', true)
set.b('tabstop', indent)
set.b('softtabstop', indent)
set.b('shiftwidth', indent)
-- Indent
set.b('autoindent', true)
set.b('copyindent', true)
