-- setup lspconfig
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua require[[telescope.builtin]].lsp_definitions{}<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua require[[telescope.builtin]].lsp_references{}<CR>", opts)
  buf_set_keymap("n", "gws", "<cmd>lua require[[telescope.builtin]].lsp_workspace_symbols{}<CR>", opts)
  buf_set_keymap("n", "gwd", "<cmd>lua require[[telescope.builtin]].lsp_workspace_diagnostics{}<CR>", opts)
  buf_set_keymap("n", "gos", "<cmd>lua require[[telescope.builtin]].lsp_document_symbols{}<CR>", opts)
  buf_set_keymap("n", "god", "<cmd>lua require[[telescope.builtin]].lsp_document_diagnostics{}<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<space>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  -- buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>fm", "<cmd>lua vim.lsp.buf.format()<CR>", opts)

  -- Set some keybinds conditional on server capabilities
  -- if client.resolved_capabilities.document_formatting then
  -- if client.server_capabilities.document_formatting then
  --   buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
  -- -- elseif client.resolved_capabilities.document_range_formatting then
  -- elseif client.server_capabilities.document_range_formatting then
  --   buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  -- end
end
-- local enhance_server_opts = {
--   -- None of this works, I was trying to disable proc_macro in rust_analyzer
--   -- so I wouldn't get all the "proc_macro not expanded" warnings on external proc macros
--   ["rust_analyzer"] = function(opts)
--     opts.settings = {
--       ["rust-analyzer"] = {
--         procMacro = { enable = false },
--       }
--     }
--   end,
-- }

local coq = require("coq")
require('nvim-lsp-installer').on_server_ready(function(server)
  local opts = { on_attach = on_attach }
  -- if enhance_server_opts[server.name] then
  --   enhance_server_opts[server.name](opts)
  -- end

  if server.name == "sumneko_lua" then
    opts = require("lua-dev").setup(coq.lsp_ensure_capabilities({
      lspconfig = {
        on_attach = on_attach,
        diagnostics = { globals = { "use" } },
        --       settings = {
        --
        -- format = {
        --   enable = true,
        --   -- Put format options here
        --   -- NOTE: the value should be STRING!!
        --   defaultConfig = {
        --     indent_style = "space",
        --     indent_size = "2",
        --   }
        -- },
        -- }
      },
    }))
  end
  if server.name == "arduino_language_server" then

    local arduino_lsp_path = "/home/docler/.local/share/nvim/lsp_servers/arduino_language_server/"
    server:setup(coq.lsp_ensure_capabilities({
      on_attach = on_attach,
      cmd = {
        arduino_lsp_path .. "arduino-language-server",
        "-fqbn",
        "esp32:esp32:esp32",
        "-cli-config",
        "/home/docler/.config/arduino-cli/arduino-cli.yaml",
        "-cli-daemon-addr",
        "127.0.0.1:50051",
        "-cli-daemon-instance",
        "1",
        -- "-cli",
        -- arduino_lsp_path .. "arduino-cli/arduino-cli",
        "-clangd",
        arduino_lsp_path .. "/home/docler/.local/share/nvim/lsp_servers/clangd/clangd/bin/clangd",
      } }))
    -- something
    -- server:setup(coq.lsp_ensure_capabilities({
    --   cmd = {
    --     "/home/docler/.local/share/nvim/lsp_servers/arduino_language_server/arduino-language-server",
    --     "-cli-config", "/home/docler/.config/arduino-cli/arduino-cli.yaml",
    --   }
    -- }))
  elseif server.name == "rust_analyzer" then
    -- Initialize the LSP via rust-tools instead
    require("rust-tools").setup(coq.lsp_ensure_capabilities({
      -- The "server" property provided in rust-tools setup function are the
      -- settings rust-tools will provide to lspconfig during init.
      -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
      -- with the user's own settings (opts).
      server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
      -- tools = { inlay_hints = { highlight = "Todo" } }
    }))
    server:attach_buffers()
    -- Only if standalone support is needed
    require("rust-tools").start_standalone_if_required()
  else
    server:setup(coq.lsp_ensure_capabilities(opts))
  end
  vim.cmd [[ do User LspAttachBuffers ]]
end)

-- define custom diagnostics
vim.fn.sign_define("DiagnosticSignWarn", { text = "", numhl = "DiagnosticSignWarn", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignError", { text = "", numhl = "DiagnosticSignError", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", numhl = "DiagnosticSignInfo", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", numhl = "DiagnosticSignHint", texthl = "DiagnosticSignHint" })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = { prefix = "", spacing = 0, },
  signs = true,
  underline = true,
  update_in_insert = false, -- update diagnostics insert mode
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single", })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single", })
