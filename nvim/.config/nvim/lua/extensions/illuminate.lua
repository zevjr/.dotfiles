local illuminate = require('illuminate')

illuminate.configure({
    providers = {
      'lsp',
      'treesitter',
  },
})
