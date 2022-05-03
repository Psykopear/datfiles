require("indent_blankline").setup({
  indentLine_enabled = 1,
  char = "▏",
  filetype_exclude = {
    "help",
    "terminal",
    "startup",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "CHADTree",
  },
  buftype_exclude = { "terminal" },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  char_highlight_list = {'FloatBorder'}
})
