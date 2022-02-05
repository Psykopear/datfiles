-- setup lspconfig
require'lspsaga'.init_lsp_saga()

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'ga', '<Cmd>Lspsaga code_action<CR>', opts)
  -- buf_set_keymap('n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
  -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Add lspkind config
  require('lspkind').init({})
  -- Lsp Signature
  local cfg = {
    -- This is mandatory, otherwise border config won't get registered.
    -- If you want to hook lspsaga or other signature handler, pls set to false
    bind = true,
    doc_lines = 2, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
    -- set to 0 if you DO NOT want any API comments be shown
    -- This setting only take effect in insert mode, it does not affect signature help in normal
    -- mode, 10 by default

    floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
    hint_enable = true, -- virtual hint enable
    hint_prefix = "",  -- Panda for parameter
    hint_scheme = "String",
    use_lspsaga = true,  -- set to true if you want to use lspsaga popup
    hi_parameter = "Search", -- how your parameter will be highlight
    max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
    -- to view the hiding contents
    max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
    handler_opts = {
      border = "shadow"   -- double, single, shadow, none
    },
    -- extra_trigger_chars = {} -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  }
  require('lsp_signature').on_attach(cfg)
end

-- Configure lua language server for neovim development
local lua_settings = {
  Lua = {
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {'vim', 'use'},
    },
  }
}

local function setup_servers()
  -- require'lspinstall'.setup()

  local servers = require'lspinstall'.installed_servers()
  -- manually installed servers are added here
  table.insert(servers, 'gdscript')
  table.insert(servers, 'pylsp')
  table.insert(servers, 'omnisharp')

  local lspconfig = require'lspconfig'
  local configs = require'lspconfig/configs'
  if not lspconfig.sixtyfps then
    configs.sixtyfps = {
      default_config = {
        cmd = {'sixtyfps-lsp'};
        on_attach = on_attach,
        filetypes = {'sixty'};
        root_dir = lspconfig.util.root_pattern("Cargo.toml", ".git");
        settings = {};
      };
    }
  end
  lspconfig.sixtyfps.setup{}


  -- table.insert(servers, 'jedi_language_server')

  for _, server in pairs(servers) do
    -- map buffer local keybindings when the language server attaches
    local config = { on_attach = on_attach }

    -- here customize config for different servers
    if server == 'lua' then
      config.settings = lua_settings
    end
    if server == 'omnisharp' then
      local pid = vim.fn.getpid()
      -- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
      local omnisharp_bin = "/home/docler/workspace/omnisharp/run"
      config.cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
      -- config.root_dir = lspconfig.util.root_pattern("*.csproj","*.sln");
      config.root_dir = lspconfig.util.root_pattern("*.csproj");
      -- config.cmd = { "/usr/bin/mono", "./omnisharp/OmniSharp.exe", "--languageserver" , "--hostPID", tostring(vim.fn.getpid()) }
      -- config.cmd = { '/usr/bin/mono', '/home/docler/tmp/omnisharp/OmniSharp.exe', '--languageserver', 'hostPID', tostring(vim.fn.getpid()) }
    end
    require'lspconfig'[server].setup(config)
  end
end

-- setup_servers()
--
require('nvim-lsp-installer').on_server_ready(function(server)
    local opts = { on_attach = on_attach }

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
-- require'lspinstall'.post_install_hook = function ()
--   setup_servers() -- reload installed servers
--   vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
-- end

