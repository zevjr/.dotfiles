--[[
  File: trouble.lua
  Description: Configuration of trouble.nvim
  See: https://github.com/folke/trouble.nvim
]]

local trouble = require("trouble")
trouble.setup({
	modes = {
		preview_float = {
			mode = "diagnostics",
			preview = {
				type = "float",
				relative = "editor",
				border = "rounded",
				title = "Preview",
				title_pos = "center",
				position = { 0, -2 },
				size = { width = 0.3, height = 0.3 },
				zindex = 200,
			},
		},
	},
})
