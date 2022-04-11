-- See Telescope default settings here:
-- https://github.com/nvim-telescope/telescope.nvim#telescope-defaults
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "node_modules", "%.meta$", "%.sql" },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<c-t>"] = trouble.open_with_trouble,
      },
      n = {
        ["<c-t>"] = trouble.open_with_trouble,
      },
    },
  },
  pickers = {
    lsp_code_actions = {
      theme = "cursor",
    }
  },
  extensions = {
    project = {
      base_dirs = {
        { '~/src', max_depth = 2 },
        { '~/workspace', max_depth = 2 },
        { '~/repos', max_depth = 2 },
      },
    }
  }
})

-- load extensions
-- require("telescope").load_extension("flutter")
-- require("telescope").load_extension("scdoc")
-- require("telescope").load_extension('project')
-- require("telescope").load_extension('file_browser')
