require 'config.notify'
require 'config.lspconfig'
require 'config.cmp'
require 'config.treesitter'
require 'config.telescope'
require 'config.lualine'
require 'config.rust'
require 'config.bufferline'

vim.o.background = "dark"
vim.g.gruvbox_material_cursor = 'green'
-- had to disable this so that comments don't have weird background
vim.g.gruvbox_material_disable_italic_comment = 1
vim.cmd('colorscheme gruvbox-material')
