--[[
  File: toggleterm.lua
  Description: A neovim plugin to persist and toggle multiple terminals during an editing session
  See: https://github.com/akinsho/toggleterm.nvim
]]
require "helpers/globals"

local toggleterm = require("toggleterm")
toggleterm.setup({
  size = 10,
  direction = 'horizontal'
});

local Remap = require("helpers/keyboard")
local nnoremap = Remap.nnoremap
local tnoremap = Remap.tnoremap

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
})

function _lazygit_toggle()
  lazygit:toggle()
end

nnoremap("<leader>lz", "<cmd>lua _lazygit_toggle()<CR>")
tnoremap("<c-t>", "<c-\\><c-n>")
