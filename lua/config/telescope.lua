local telescope = require 'telescope'
local actions = require 'telescope.actions'

telescope.setup {
  defaults = {
    prompt_prefix = "   ",
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    },
  },
  extensions = {
   ["ui-select"] = {
     -- put Telescope for vim.ui.select under curos
     require("telescope.themes").get_cursor { }
   }
  }
}

-- enhance vim.ui.select calls with Telescope
telescope.load_extension 'ui-select'
