-- These are handful mappings to encode strings in base64 and viceversa
vim.api.nvim_set_keymap("v", "<F2>", 'c<c-r>=system("base64 -w 0", @")<cr><esc>', { noremap = true })
vim.api.nvim_set_keymap("v", "<F3>", 'c<c-r>=system("base64 -d", @")<cr>', { noremap = true })

-- Splits
vim.api.nvim_set_keymap("n", "<leader>h", ":<C-u>split<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>v", ":<C-u>vsplit<CR>", { silent = true })
-- Resize panes
vim.api.nvim_set_keymap("", "<A-h>", "<C-w><", { silent = true })
vim.api.nvim_set_keymap("", "<A-j>", "<C-w>-", { silent = true })
vim.api.nvim_set_keymap("", "<A-k>", "<C-w>+", { silent = true })
vim.api.nvim_set_keymap("", "<A-l>", "<C-w>>", { silent = true })

-- Fast actions
vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>x", ":x<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", { silent = true })
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { silent = true })

-- move through wrapped lines with j/k
vim.api.nvim_set_keymap("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { noremap = true, silent = true, expr = true })

-- disable highlight when esc is pressed
vim.api.nvim_set_keymap("n", "<Esc>", ":noh <CR>", { noremap = true, silent = true })

-- Set guifont for neovide
-- Font size change
-- local font = "MonoLisa"
local font = "Inconsolata"
-- local font = "FiraCode"
local fontSize = 15
vim.opt.guifont = font .. ':h' .. fontSize

local function setCurrentFont()
  vim.o.guifont = font .. ':h' .. fontSize
  vim.cmd [[sleep 200m]]
  vim.cmd [[redraw]]
end

function BiggerFont()
  fontSize = fontSize + 1
  setCurrentFont()
end

function SmallerFont()
  fontSize = fontSize - 1
  setCurrentFont()
end

vim.api.nvim_set_keymap('', '<C-=>', '<cmd>lua BiggerFont()<cr>', {})
vim.api.nvim_set_keymap('', '<C-->', '<cmd>lua SmallerFont()<cr>', {})
