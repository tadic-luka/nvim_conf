local lsp = require 'config.lsp'

require('rust-tools').setup({
  server = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
  },
})
