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
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
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
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
      "mxsdev/nvim-dap-vscode-js",
    },
    config = function()
      require("extensions.dap")
    end,
  },
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
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("extensions.null_ls")
    end,
  },
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
  {
    "github/copilot.vim",
    lazy = false,
  },
  --}}}

  --Rest  {{{
  {
    'rest-nvim/rest.nvim',
    config = function()
      require("extensions.rest")
    end,
  },
  --}}}

  {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    { 'tpope/vim-dotenv' },
    { 'hrsh7th/nvim-compe' },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    require('extensions.dadbod')
  end,
  }
}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
