local cmp = require("cmp")
local lspkind = require("lspkind")

require('lspconfig').gdscript.setup({
  capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  )
})

local types = require('cmp.types');

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")

cmp.setup({
  sorting = {
    comparators = {
      -- Snippets last
      function(entry1, entry2)
        local kind1 = entry1:get_kind()
        kind1 = kind1 == types.lsp.CompletionItemKind.Text and 100 or kind1
        local kind2 = entry2:get_kind()
        kind2 = kind2 == types.lsp.CompletionItemKind.Text and 100 or kind2
        if kind1 ~= kind2 then
          -- if kind1 == types.lsp.CompletionItemKind.Snippet then
          --   return false
          -- end
          -- if kind2 == types.lsp.CompletionItemKind.Snippet then
          --   return true
          -- end
          local diff = kind1 - kind2
          if diff < 0 then
            return true
          elseif diff > 0 then
            return false
          end
        end
      end,
      cmp.config.compare.score,
      -- cmp.config.compare.locality,
      -- cmp.config.compare.kind,
    }
  },
  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
      -- set a name for each source
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
        -- luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        path = "[Path]",
      })[entry.source.name]

      return vim_item
    end,
  },
  -- You can set mappings if you want
  mapping = {
    -- ["<C-p>"] = cmp.mapping.select_prev_item(),
    -- ["<C-n>"] = cmp.mapping.select_next_item(),
    -- ['<Tab>'] = function(fallback)
    --   if not cmp.select_next_item() then
    --     if vim.bo.buftype ~= 'prompt' and has_words_before() then
    --       cmp.complete()
    --     else
    --       fallback()
    --     end
    --   end
    -- end,
    --
    -- ['<S-Tab>'] = function(fallback)
    --   if not cmp.select_prev_item() then
    --     if vim.bo.buftype ~= 'prompt' and has_words_before() then
    --       cmp.complete()
    --     else
    --       fallback()
    --     end
    --   end
    -- end,

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),



    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },
  snippet = {
    -- We recommend using *actual* snippet engine.
    -- It's a simple implementation so it might not work in some of the cases.
    expand = function(args)
      local line_num, col = unpack(vim.api.nvim_win_get_cursor(0))
      local line_text = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, true)[1]
      local indent = string.match(line_text, '^%s*')
      local replace = vim.split(args.body, '\n', true)
      local surround = string.match(line_text, '%S.*') or ''
      local surround_end = surround:sub(col)

      replace[1] = surround:sub(0, col - 1) .. replace[1]
      replace[#replace] = replace[#replace] .. (#surround_end > 1 and ' ' or '') .. surround_end
      if indent ~= '' then
        for i, line in ipairs(replace) do
          replace[i] = indent .. line
        end
      end

      vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, true, replace)
    end,
  },

  -- You should specify your *installed* sources.
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "crates" },
  },
})
