vim.g.mapleader = " "

vim.g.neovide_cursor_vfx_mode = "pixiedust"
-- Set the colorscheme
vim.opt.termguicolors = true
-- Nord config
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_italic = true
require('nord').set()

-- Indentation options
local indent = 2
vim.opt.tabstop = indent
vim.opt.shiftwidth = indent
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.clipboard = { "unnamedplus", "unnamed" }

-- Allow modified buffers in background
vim.opt.hidden = true

-- Show trailing spaces and tabs
-- vim.opt.list = true
-- vim.opt.listchars = { trail = "·", tab = "»·" }

-- Enable mouse support on all modes
vim.opt.mouse = "a"

-- No swapfile
vim.opt.swapfile = false

-- Folding
vim.opt.foldenable = true
vim.opt.foldlevelstart = 10
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- use treesitter for folding

-- numbering
vim.opt.number = true

vim.opt.updatetime = 500
