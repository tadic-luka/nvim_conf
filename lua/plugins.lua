vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer manager itself
  use 'wbthomason/packer.nvim'
  use 'sainnhe/gruvbox-material'
  -- notify
  use {
    'rcarriga/nvim-notify',
    config = [[require('config.notify')]]
  }
  use {
    'neovim/nvim-lspconfig',
    config = [[require('config.lspconfig')]]
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config=[[require('config.treesitter')]]
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = [[require('config.telescope')]],
  }

  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = [[require('config.bufferline')]]
  }

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = [[require('config.notify')]]
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      {
        'L3MON4D3/LuaSnip',
         requires = 'rafamadriz/friendly-snippets',
         config = [[require('config.luasnip')]],
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'ray-x/cmp-treesitter', after = 'nvim-cmp' },
      'kdheepak/cmp-latex-symbols'
    },
    config = [[require('config.cmp')]],
  }


  -- rust
  use 'rust-lang/rust.vim'
  use 'simrat39/rust-tools.nvim'


  use {
    'tadic-luka/osc52.nvim',
    config = [[require('config.osc52')]]
  }

  use { 'p00f/clangd_extensions.nvim' }
end)
