require 'config.lspconfig'
require 'config.cmp'
require 'config.treesitter'
require 'config.telescope'
require 'config.lualine'
require 'config.rust'
require 'config.bufferline'

vim.o.background = "dark"
vim.cmd('colorscheme gruvbox-material')
vim.g['gruvbox_material_background'] = medium
vim.g['gruvbox_material_cursos'] = green
