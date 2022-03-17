local export = {}

export.setup = function()
  local actions = require('telescope.actions')
  local telescope = require('telescope')
  local trouble = require("trouble.providers.telescope")
  -- telescope.load_extension("flutter")
  telescope.setup{
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = actions.close,
          ["<c-t>"] = trouble.open_with_trouble
        },
        n = {
          ["<c-t>"] = trouble.open_with_trouble
        },
      },
    }
  }
end

export.project_files = function(opts)
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

return export
