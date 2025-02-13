--[[
  File: plugins.lua
  Description: This file needed for loading plugin list into lazy.nvim and loading plugins
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/folke/lazy.nvim
]]

require("helpers/globals")

return {
	-- Mason {{{
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"stevearc/conform.nvim",
			"b0o/SchemaStore.nvim",
			{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			require("extensions.mason")
		end,
	},
	-- }}}

	-- Neo Tree {{{
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("extensions.neotree")
		end,
	},
	-- }}}

	-- Telescope {{{
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"ahmedkhalf/project.nvim",
		},
		config = function()
			require("extensions.telescope")
		end,
	},
	-- }}}

	-- CMP {{{
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lua",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("extensions.cmp")
		end,
	},
	-- }}}

	-- LSP Kind {{{
	{
		"onsails/lspkind-nvim",
		lazy = true,
		config = function()
			require("extensions.lspkind")
		end,
	},
	-- }}}

	-- Git Signs{{{
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		config = function()
			require("extensions.gitsigns")
		end,
	},
	-- }}}

	-- Trouble {{{
	{
		"folke/trouble.nvim",
		lazy = false,
		dependencies = "kyazdani42/nvim-web-devicons",
		cmd = "Trouble",
		config = function()
			require("extensions.trouble")
		end,
	},
	-- }}}

	-- TreeSitter {{{
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("extensions.treesitter")
		end,
	},
	-- }}}

	-- Comment {{{
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("extensions.comment")
		end,
	},

	-- }}}

	-- Term {{{
	{
		"akinsho/toggleterm.nvim",
		lazy = false,
		version = "*",
		config = function()
			require("extensions.toggleterm")
		end,
	},
	-- }}}

	-- Dap {{{
	-- {
	--   "mfussenegger/nvim-dap",
	--   lazy = false,
	--   dependencies = {
	--     "rcarriga/nvim-dap-ui",
	--     "theHamsta/nvim-dap-virtual-text",
	--     "nvim-telescope/telescope-dap.nvim",
	--     "mxsdev/nvim-dap-vscode-js",
	--   },
	--   config = function()
	--     require("extensions.dap")
	--   end,
	-- },
	-- {
	--   "microsoft/vscode-js-debug",
	--   lazy = true,
	--   build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	-- },

	--}}}

	-- Theme: Catppuccin {{{
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("extensions.colorscheme.catppuccin")
		end,
	},
	-- }}}

	-- Illuminate {{{
	{
		"RRethy/vim-illuminate",
		config = function()
			require("extensions.illuminate")
		end,
	},

	--}}}

	-- Lualine {{{
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("extensions.lualine")
		end,
	},
	--}}}

	-- Navic {{{
	{
		"SmiteshP/nvim-navic",
		lazy = true,
		config = function()
			require("extensions.navic")
		end,
	},
	--}}}

	--Startuptime {{{
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			g.startuptime_tries = 10
		end,
	},
	--}}}

	--Null-LS {{{
	-- {
	--   "jose-elias-alvarez/null-ls.nvim",
	--   dependencies = { "nvim-lua/plenary.nvim" },
	--   config = function()
	--     require("extensions.null_ls")
	--   end,
	-- },
	--}}}

	--Neodev {{{
	{
		"folke/neodev.nvim",
		config = function()
			require("extensions.neodev")
		end,
	},
	--}}}

	--Copilot {{{
	-- {
	--   "github/copilot.vim",
	--   lazy = false,
	-- },
	--}}}
	--ChatGPT {{{
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("extensions.chatgpt")
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	--}}}

	--Rest  {{{
	-- {
	--   'rest-nvim/rest.nvim',
	--   config = function()
	--     require("extensions.rest")
	--   end,
	-- },
	--}}}

	--Database {{{
	-- {
	-- 	"tpope/vim-dadbod",
	-- 	opt = true,
	-- 	lazy = true,
	-- 	dependencies = {
	-- 		{ "kristijanhusak/vim-dadbod-ui" },
	-- 		{ "kristijanhusak/vim-dadbod-completion" },
	-- 		{ "tpope/vim-dotenv" },
	-- 		{ "hrsh7th/nvim-compe" },
	-- 	},
	-- 	cmd = {
	-- 		"DBUI",
	-- 		"DBUIToggle",
	-- 		"DBUIAddConnection",
	-- 		"DBUIFindBuffer",
	-- 		"DBUIRenameBuffer",
	-- 		"DBUILastQueryInfo",
	-- 	},
	-- 	init = function()
	-- 		require("extensions.dadbod")
	-- 	end,
	-- },
	-- }}}
	{
		"folke/flash.nvim",
		opts = {
			search = {
				forward = true,
				multi_window = false,
				wrap = false,
				incremental = true,
			},
		},
	},
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"gpanders/nvim-parinfer",
		config = function()
			vim.g.parinfer_filetypes = {
				"dune",
				"scheme",
			}
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		init = function()
			require("extensions.harpoon")
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("extensions.refactoring")
		end,
	},
	{
		"johmsalas/text-case.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("textcase").setup({})
			require("telescope").load_extension("textcase")
		end,
		keys = {
			"ga", -- Default invocation prefix
			{ "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" },
		},
		cmd = {
			-- NOTE: The Subs command name can be customized via the option "substitude_command_name"
			"Subs",
			"TextCaseOpenTelescope",
			"TextCaseOpenTelescopeQuickChange",
			"TextCaseOpenTelescopeLSPChange",
			"TextCaseStartReplacingCommand",
		},
		-- If you want to use the interactive feature of the `Subs` command right away, text-case.nvim
		-- has to be loaded on startup. Otherwise, the interactive feature of the `Subs` will only be
		-- available after the first executing of it or after a keymap of text-case.nvim has been used.
		lazy = false,
	},
	{
		"cuducos/yaml.nvim",
		ft = { "yaml" }, -- optional
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
		},
	},
}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
