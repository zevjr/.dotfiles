--[[
  File: mason.lua
  Description: Mason plugin configuration (with lspconfig)
  See: https://github.com/williamboman/mason.nvim
]]

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local conform = require("conform")
local lsp_lines = require("lsp_lines")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
	},
})
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(args)
		conform.format({
			bufnr = args.buf,
			lsp_fallback = true,
			quiet = true,
		})
	end,
})

lsp_lines.setup()
vim.diagnostic.config({ virtual_text = true, virtual_lines = false })

mason.setup()

local capabilities = nil
if pcall(require, "cmp_nvim_lsp") then
	capabilities = require("cmp_nvim_lsp").default_capabilities()
end

lspconfig.ts_ls.setup({})

-- Setup every needed language server in lspconfig
mason_lspconfig.setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({})
	end,
})

local servers = {
	bashls = true,
	sqlls = true,
	gopls = {
		settings = {
			gopls = {
				hints = {
					assignVariableTypes = true,
					compositeLiteralFields = true,
					compositeLiteralTypes = true,
					constantValues = true,
					functionTypeParameters = true,
					parameterNames = true,
					rangeVariableTypes = true,
				},
			},
		},
	},
	lua_ls = {
		server_capabilities = {
			semanticTokensProvider = vim.NIL,
		},
	},
	rust_analyzer = true,
	svelte = true,
	templ = true,
	cssls = true,
	taplo = true,

	pyright = true,

	-- Probably want to disable formatting for this lang server
	ts_ls = {
		server_capabilities = {
			documentFormattingProvider = false,
		},
	},
	biome = true,

	jsonls = {
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	},

	yamlls = {
		settings = {
			yaml = {
				schemaStore = {
					enable = false,
					url = "",
				},
				-- schemas = require("schemastore").yaml.schemas(),
			},
		},
	},

	ocamllsp = {
		manual_install = true,
		settings = {
			codelens = { enable = true },
			inlayHints = { enable = true },
			syntaxDocumentation = { enable = true },
		},

		-- get_language_id = function(lang)
		--   local map = {
		--     ["ocaml.mlx"] = "mlx",
		--   }
		--   return map[lang] or lang
		-- end,

		filetypes = {
			"ocaml",
			"ocaml.interface",
			"ocaml.menhir",
			"ocaml.cram",
			"ocaml.mlx",
			"ocaml.ocamllex",
		},

		server_capabilities = {
			semanticTokensProvider = false,
		},

		-- TODO: Check if i still need the filtypes stuff i had before
	},

	gleam = {
		manual_install = true,
	},

	-- elixirls = {
	--   cmd = { "/home/tjdevries/.local/share/nvim/mason/bin/elixir-ls" },
	--   root_dir = require("lspconfig.util").root_pattern { "mix.exs" },
	--   server_capabilities = {
	--     -- completionProvider = true,
	--     -- definitionProvider = false,
	--     documentFormattingProvider = false,
	--   },
	-- },

	-- lexical = {
	--   cmd = { "/home/tjdevries/.local/share/nvim/mason/bin/lexical", "server" },
	--   root_dir = require("lspconfig.util").root_pattern { "mix.exs" },
	--   server_capabilities = {
	--     completionProvider = vim.NIL,
	--     definitionProvider = false,
	--   },
	-- },

	clangd = {
		-- cmd = { "clangd", unpack(require("custom.clangd").flags) },
		-- TODO: Could include cmd, but not sure those were all relevant flags.
		--    looks like something i would have added while i was floundering
		init_options = { clangdFileStatus = true },

		filetypes = { "c" },
	},
}

local servers_to_install = vim.tbl_filter(function(key)
	local t = servers[key]
	if type(t) == "table" then
		return not t.manual_install
	else
		return t
	end
end, vim.tbl_keys(servers))

local ensure_installed = {
	"lua_ls", -- LSP for Lua language
	"stylua",
	-- "tsserver", -- LSP for Typescript and Javascript
	"ts_ls", -- LSP for Typescript and Javascript
	"pyright", -- LSP for Python
	"gopls", -- LSP for Go
	"rust_analyzer", -- LSP for rust
}

vim.list_extend(ensure_installed, servers_to_install)
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

for name, config in pairs(servers) do
	if config == true then
		config = {}
	end
	config = vim.tbl_deep_extend("force", {}, {
		capabilities = capabilities,
	}, config)

	lspconfig[name].setup(config)
end

local disable_semantic_tokens = {
	lua = true,
}

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

		local settings = servers[client.name]
		if type(settings) ~= "table" then
			settings = {}
		end

		local builtin = require("telescope.builtin")
		vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
		vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0 })
		vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0 })

		local filetype = vim.bo[bufnr].filetype
		if disable_semantic_tokens[filetype] then
			client.server_capabilities.semanticTokensProvider = nil
		end

		-- Override server capabilities
		if settings.server_capabilities then
			for k, v in pairs(settings.server_capabilities) do
				if v == vim.NIL then
					---@diagnostic disable-next-line: cast-local-type
					v = nil
				end

				client.server_capabilities[k] = v
			end
		end
	end,
})
