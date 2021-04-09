require'bufferline'.setup{
  options = {
    -- separator_style = "slant",
    show_close_icon = false,
  },
  highlights = {
    fill = {
      guibg = {
        attribute = "fg",
        highlight = "Pmenu"
      }
    }
  }
}
