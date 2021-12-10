vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer manager itself
  use 'wbthomason/packer.nvim'
  use 'sainnhe/gruvbox-material'
  use 'neovim/nvim-lspconfig'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    }
  }

  use {
    'nvim-telescope/telescope-ui-select.nvim',
    requires = {
      'nvim-telescope/telescope.nvim',
    },
  }

  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      {
        'SirVer/ultisnips',
         requires = 'honza/vim-snippets',
         config = function()
           vim.g.UltiSnipsRemoveSelectModeMappings = 0
         end,
      },
      'quangnguyen30192/cmp-nvim-ultisnips',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'ray-x/cmp-treesitter',
      'kdheepak/cmp-latex-symbols'
    }
  }


  -- rust
  use 'rust-lang/rust.vim'
  use 'simrat39/rust-tools.nvim'

  -- notify
  use 'rcarriga/nvim-notify'
end)
