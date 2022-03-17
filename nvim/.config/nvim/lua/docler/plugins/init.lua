-- Automatically install Packer if it does not exist
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
end

vim.cmd([[packadd packer.nvim]])

require("packer").startup(function()
  use { "wbthomason/packer.nvim", opt = true }
  -- themes, ux and style
  use { "shaunsingh/nord.nvim" }
  use { "windwp/windline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require('wlsample.evil_line')
    end
  }
  use {
    "akinsho/nvim-bufferline.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("docler.plugins.configs.bufferline")
    end,
    setup = function()
      require("docler.plugins.mappings.bufferline")
    end,
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("docler.plugins.configs.blankline")
    end,
  }
  use {
    "norcalli/nvim-colorizer.lua",
    -- Lazy loading
    cmd = { "ColorizerToggle", "ColorzedAttachToBuffer", "ColorizerDetachFromBuffers", "ColorizerReloadAllBuffers" },
    config = function()
      require("colorizer").setup()
    end,
  }
  use {
    "sunjon/shade.nvim",
    config = function()
      require("shade").setup({
        overlay_opacity = 60,
      })
    end,
  }

  -- Git utilities
  use {
    "lewis6991/gitsigns.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("docler.plugins.configs.gitsigns")
    end,
  }

  use {
    "TimUntersberger/neogit",
    -- Lazy loading
    cmd = { "Neogit" },
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("docler.plugins.configs.neogit")
    end,
  }

  use {
    'pwntester/octo.nvim',
    -- Lazy loading
    cmd = { "Octo", "OctoAddReviewComment", "OctoAddReviewSuggestion" },
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function ()
      require"octo".setup()
    end
  }

  -- highlighting
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("docler.plugins.configs.treesitter")
    end,
  }

  -- completion
  use {
    "hrsh7th/nvim-cmp",
    requires = { "onsails/lspkind-nvim" },
    config = function()
      require("docler.plugins.configs.cmp")
    end,
  }

  use {
    "neovim/nvim-lspconfig",
    requires = "williamboman/nvim-lsp-installer",
    config = function()
      require("docler.plugins.configs.lspconfig")
    end,
  }

  use {
    "folke/lua-dev.nvim",
  }
  use {
    "simrat39/rust-tools.nvim",
  }

  -- -- completion sources
  use { "habamax/vim-godot" }
  use { "saadparwaiz1/cmp_luasnip" }
  use { "hrsh7th/cmp-nvim-lua" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }

  use {
    'saecki/crates.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  }

  -- file managing , picker, fuzzy finder
  use {
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons" },
    -- Lazy load
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require("docler.plugins.configs.nvimtree")
    end,
    setup = function()
      require("docler.plugins.mappings.nvimtree")
    end,
  }
  use { "knubie/vim-kitty-navigator" }

  -- Telescope stuff
  use{
    "nvim-telescope/telescope.nvim",
    -- cmd = "Telescope",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("docler.plugins.configs.telescope")
    end,
    setup = function()
      require("docler.plugins.mappings.telescope")
    end,
  }
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
  }
  use {
    "nvim-telescope/telescope-project.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end,
    setup = function()
      require("docler.plugins.mappings.trouble")
    end,
  }

  use {
    "startup-nvim/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function()
      require("docler.plugins.configs.startup")
    end
  }

  -- Trim traling spaces and whitelines at the end of files
  use {
    "cappyzawa/trim.nvim",
    config = function()
      require("trim").setup({
        disable = { "markdown" },
        patterns = {
          [[%s/\s\+$//e]],
          [[%s/\($\n\s*\)\+\%$//]],
          [[%s/\%^\n\+//]],
        },
      })
    end,
  }
  use {
    "terrortylor/nvim-comment",
    config = function()
      require("docler.plugins.configs.nvimcomment")
    end,
  }
  -- Testing
  use {
    "rcarriga/vim-ultest",
    requires = {"vim-test/vim-test"},
    run = ":UpdateRemotePlugins"
  }
  -- Supercollider
  use { 'davidgranstrom/scnvim' }
  use { 'davidgranstrom/telescope-scdoc.nvim' }
  -- Terminal
  use {
    's1n7ax/nvim-terminal',
    config = function()
      vim.o.hidden = true
      require('nvim-terminal').setup()
    end,
  }
  use { 'nyngwang/NeoRoot.lua', cmd = "NeoRoot" }
  -- Debug startup time
  use {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  }
end)

-- Auto compile when there are changes in plugins.lua
vim.api.nvim_command("augroup PackerCompileOnWrite")
vim.api.nvim_command("autocmd!")
vim.api.nvim_command("autocmd BufWritePost init.lua source <afile> | PackerSync")
vim.api.nvim_command("augroup END")
