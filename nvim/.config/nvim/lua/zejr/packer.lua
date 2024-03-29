return require("packer").startup(function()
    use("wbthomason/packer.nvim")
    use("sbdchd/neoformat")
    use("TimUntersberger/neogit")

    -- TJ created lodash of neovim
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")
    use("sindrets/diffview.nvim")

        -- Colorscheme section
    use("gruvbox-community/gruvbox")
    use("folke/tokyonight.nvim")

    -- All the things
    use("neovim/nvim-lspconfig")
    use("nvim-lua/lsp_extensions.nvim")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    -- use("hrsh7th/cmp-copilot")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/nvim-compe")
    use("saadparwaiz1/cmp_luasnip")
    use("L3MON4D3/LuaSnip")

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use("nvim-treesitter/playground")
    use("romgrk/nvim-treesitter-context")
    -- use("nvim-telescope/telescope-file-browser.nvim")
    use("kyazdani42/nvim-tree.lua")
    use("kyazdani42/nvim-web-devicons", {
	    tag = "nightly"
    })

    use("tpope/vim-commentary")
    -- use("github/copilot.vim")
    use("folke/lua-dev.nvim")
    use("windwp/nvim-autopairs")

    use("ThePrimeagen/harpoon")
    -- use("terryma/vim-multiple-cursors")
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")
    use("nvim-telescope/telescope-dap.nvim")
    -- use("puremourning/vimspector")
    use("folke/trouble.nvim")

    use("ThePrimeagen/git-worktree.nvim")

    use("diepm/vim-rest-console")

    use("mbbill/undotree")
    use("f-person/git-blame.nvim")
    use("catppuccin/nvim")
end)


