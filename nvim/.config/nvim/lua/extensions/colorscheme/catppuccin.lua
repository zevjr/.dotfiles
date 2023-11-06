--[[
  File: catppuccin.lua
  Description: Catppuccin Theme
  See: https://github.com/catppuccin/nvim
]]

local catppuccin = require('catppuccin')

catppuccin.setup({
 flavour = "macchiato",
 integrations = {
    cmp = true,
    gitsigns = true,
    neotree = true,
    treesitter = true,
    telescope = true,
 },
  background = {
    dark = "mocha",
  },
  transparent_background = true, -- disables setting the background color.
  show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
  term_colors = true,
  dim_inactive = {
      enabled = false, -- dims the background color of inactive window
      shade = "dark",
      percentage = 0.95, -- percentage of the shade to apply to the inactive window
  },
})

cmd("color " .. theme)
