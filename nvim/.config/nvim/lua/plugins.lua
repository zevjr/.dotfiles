--[[
  File: plugins.lua
  Description: This file needed for loading plugin list into lazy.nvim and loading plugins
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/folke/lazy.nvim
]]

require "helpers/globals"

return {
  -- Mason {{{
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require "extensions.mason"
    end
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
      require "extensions.neotree"
    end
  },
  -- }}}

  -- Telescope {{{
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ahmedkhalf/project.nvim",
    },
    config = function()
      require "extensions.telescope"
    end
  },
  -- }}}

  -- CMP {{{
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require "extensions.cmp"
    end
  },
  -- }}}

  -- LSP Kind {{{
  {
    'onsails/lspkind-nvim',
    lazy = true,
    config = function()
      require "extensions.lspkind"
    end
  },
  -- }}}

  -- Git Signs{{{
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    config = function()
      require "extensions.gitsigns"
    end
  },
  -- }}}

  -- Trouble {{{
  {
    "folke/trouble.nvim",
    lazy = true,
    config = function()
      require "extensions.trouble"
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
      require "extensions.treesitter"
    end
  },
  -- }}}

  -- Theme: Catppuccin {{{
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require "extensions.colorscheme.catppuccin"
    end
  },
  -- }}}

  -- Comment {{{
  {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
      require "extensions.comment"
    end
  },

  -- }}}

  -- Term { {{
  {
    'akinsho/toggleterm.nvim',
    lazy = false,
    version = '*',
    config = function()
      require "extensions.toggleterm"
    end
  },

  -- }}}

  -- Dap {{{
  -- {
  --   "mfussenegger/nvim-dap",
  --   lazy=false,
  --   dependencies = {
  --    "rcarriga/nvim-dap-ui",
  --    "theHamsta/nvim-dap-virtual-text",
  --    "nvim-telescope/telescope-dap.nvim",
  --    "folke/which-key.nvim",
  --    "jay-babu/mason-nvim-dap.nvim",
  --   },
  --   config = function()
  --     require "extensions.dap"
  --   end
  -- },
  --}}}

  {
    "mfussenegger/nvim-dap",

    dependencies = {

      -- fancy UI for the debugger
      {
        "rcarriga/nvim-dap-ui",
        -- stylua: ignore
        keys = {
          { "<leader>du", function() require("dapui").toggle({}) end,  desc = "Dap UI" },
          { "<leader>de", function() require("dapui").eval() end,      desc = "Eval",  mode = { "n", "v" } },
        },
        opts = {},
        config = function(_, opts)
          local dap = require("dap")
          local dapui = require("dapui")
          dapui.setup(opts)
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close({})
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close({})
          end
        end,
      },

      -- virtual text for the debugger
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },

      -- which key integration
      {
        "folke/which-key.nvim",
        optional = true,
        opts = {
          defaults = {
            ["<leader>d"] = { name = "+debug" },
            ["<leader>da"] = { name = "+adapters" },
          },
        },
      },

      -- mason.nvim integration
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "mason.nvim",
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
          -- Makes a best effort to setup the various debuggers with
          -- reasonable debug configurations
          automatic_installation = true,

          -- You can provide additional configuration to the handlers,
          -- see mason-nvim-dap README for more information
          handlers = {},

          -- You'll need to check that you have the required things installed
          -- online, please don't ask me how to install them :)
          ensure_installed = {
            -- Update this to ensure that you have the debuggers for the langs you want
          },
        },
      },
    },

    -- stylua: ignore
    keys = {
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
                                                                                                              desc =
        "Breakpoint Condition" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc =
      "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end,                                             desc =
      "Continue" },
      { "<leader>dC", function() require("dap").run_to_cursor() end,                                        desc =
      "Run to Cursor" },
      { "<leader>dg", function() require("dap").goto_() end,                                                desc =
      "Go to line (no execute)" },
      { "<leader>di", function() require("dap").step_into() end,                                            desc =
      "Step Into" },
      { "<leader>dj", function() require("dap").down() end,                                                 desc = "Down" },
      { "<leader>dk", function() require("dap").up() end,                                                   desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end,                                             desc =
      "Run Last" },
      { "<leader>do", function() require("dap").step_out() end,                                             desc =
      "Step Out" },
      { "<leader>dO", function() require("dap").step_over() end,                                            desc =
      "Step Over" },
      { "<leader>dp", function() require("dap").pause() end,                                                desc =
      "Pause" },
      { "<leader>dr", function() require("dap").repl.toggle() end,                                          desc =
      "Toggle REPL" },
      { "<leader>ds", function() require("dap").session() end,                                              desc =
      "Session" },
      { "<leader>dt", function() require("dap").terminate() end,                                            desc =
      "Terminate" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end,                                     desc =
      "Widgets" },
    },

    config = function()
      local Config = require("lazyvim.config")
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      for name, sign in pairs(Config.icons.dap) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define(
          "Dap" .. name,
          { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
        )
      end
    end,
  }

}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
