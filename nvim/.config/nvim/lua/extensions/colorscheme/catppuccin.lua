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
  transparent_background = false, -- disables setting the background color.
  show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
})

cmd("color " .. theme)
