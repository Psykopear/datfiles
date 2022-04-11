vim.g.mapleader = " "

vim.g.neovide_cursor_vfx_mode = "pixiedust"
-- Set the colorscheme
vim.opt.termguicolors = true
-- vim.cmd([[colorscheme adwaita]])
-- vim.cmd("colorscheme nightfox")
vim.cmd("colorscheme paper")
-- Nord config
-- vim.g.nord_contrast = true
-- vim.g.nord_borders = true
-- vim.g.nord_disable_background = false
-- vim.g.nord_italic = true
-- require('nord').set()

-- Indentation options
local indent = 2
vim.opt.tabstop = indent
vim.opt.shiftwidth = indent
vim.opt.expandtab = true
vim.opt.autoindent = true

-- vim.opt.clipboard = { "unnamedplus", "unnamed" }

-- Allow modified buffers in background
vim.opt.hidden = true

-- DO NOT SHOW THE FUCKING TILDE at the end of the buffer, thanks
vim.o.fcs = "eob: "

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

vim.opt.laststatus = 3
