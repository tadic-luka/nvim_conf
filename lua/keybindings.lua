local map = vim.api.nvim_set_keymap

map('n', '<BS>', '<C-^>', {})
map('n', 'Q', '<Nop>', {})
map('n', '<leader>f', ':Telescope find_files<CR>', {})
map('n', ';', ':Telescope buffers<CR>', {})

-- LSP
local opts = { noremap = true, silent = false }
map('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
map('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
map('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
map('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
map('n', 'U', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
map('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
map('n', '<leader>ls', '<cmd>lua vim.lsp.buf.document_symbol()<cr>', opts)
map('n', '<leader>lS', '<cmd>lua vim.lsp.buf.workspace_symbol()<cr>', opts)
map('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
map('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<cr>', opts)
