vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer manager itself
  use 'wbthomason/packer.nvim'
  use 'sainnhe/gruvbox-material'
  use 'neovim/nvim-lspconfig'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use({
    'SirVer/ultisnips',
    requires = 'honza/vim-snippets',
    config = function()
      vim.g.UltiSnipsRemoveSelectModeMappings = 0
    end,
  })

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'ray-x/cmp-treesitter'

  -- latex
  use 'kdheepak/cmp-latex-symbols'

  -- rust
  use 'rust-lang/rust.vim'
  use 'simrat39/rust-tools.nvim'

  -- notify
  use 'rcarriga/nvim-notify'
end)
