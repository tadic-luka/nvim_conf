local o = vim.o
local wo = vim.wo
local bo = vim.bo
local set = vim.opt

vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.g.python3_host_prog ='/bin/python3'

o.autoread = true
o.termguicolors = true
o.showmode = true
o.laststatus = 2
o.ruler = true
o.showmatch = true
o.splitright = true
o.scrolloff = 3
o.sidescrolloff = 15
o.hidden = true
o.enc = 'utf-8'
o.encoding = 'utf-8'
o.inccommand = 'nosplit'
o.hlsearch = true
o.ignorecase = true
o.smartcase = true
o.updatetime = 258

wo.number = true
wo.relativenumber = true
wo.colorcolumn = '120'
wo.foldmethod = 'indent'
wo.foldenable = false

bo.swapfile = false
bo.expandtab = true
bo.fenc = 'utf-8'
bo.textwidth = 120
bo.smartindent = true

set.undofile = true

vim.opt.termguicolors = true
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
  ]],
    false
)

require('keybindings')
require('plugins')
require('config')
