local M = {}

M.setup = function()
  local actions = require('telescope.actions')
  require('telescope').setup{
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = actions.close,
        },
      },
      sorting_strategy = "descending",
      layout_defaults = {
        horizontal = {
          mirror = false,
        },
      },
      winblend = 0,
    }
  }
end


M.project_files = function(opts)
  -- local opts = { cwd = vim.fn.getcwd() } -- define here if you want to define something
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

return M


