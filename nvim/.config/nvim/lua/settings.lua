local set = require('utils')

-----------------------
-- Commands
-----------------------
vim.cmd 'filetype plugin indent on'
set.o('termguicolors', true)
-- vim.cmd 'colorscheme one-nvim'
-- vim.g.tokyonight_style = "storm"
-- local utils = require("tokyonight.util")
-- local colors = require("tokyonight.colors").setup({})
-- vim.g.tokyonight_colors = { comment = utils.brighten(colors.comment, 0.4) }
-- vim.g.tokyonight_colors = { bg_sidebar = "#282C34", bg = "#282C34" }
-- vim.cmd 'colorscheme tokyonight'
-- vim.cmd 'colorscheme nord'
-- Nord config
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_italic = true
require('nord').set()


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
vim.g.pumheight = 10
vim.o.completeopt = "menuone,noselect"
set.o('showmode', false)
set.o('scrolloff', 900)
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
set.b('smartindent', true)
-- No swapfile
set.b('swapfile', false)
