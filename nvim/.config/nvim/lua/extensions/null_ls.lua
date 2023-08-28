require('helpers.globals')

local null_ls = require("null-ls")
local lspconfig = require("lspconfig")

local lSsources = {
  null_ls.builtins.formatting.prettier.with({
    filetypes = {
      "javascript",
      "typescript",
      "css",
      "scss",
      "html",
      "json",
      "yaml",
      "markdown",
      "graphql",
      "md",
      "txt",
    },
    only_local = "node_modules/.bin",
  }),
  null_ls.builtins.formatting.stylua.with({
    filetypes = {
      "lua",
    },
    args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
  }),
  null_ls.builtins.diagnostics.stylelint.with({
    filetypes = {
      "css",
      "scss",
    },
  }),
}

lspconfig.tsserver.setup({
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end,
})

null_ls.setup({
  sources = lSsources,
})
-- lspconfig["null-ls"].setup({})
