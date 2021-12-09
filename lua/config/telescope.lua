local telescope = require 'telescope'

telescope.setup {
  extensions = {
    ["ui-select"] = {
      -- put Telescope for vim.ui.select under curos
      require("telescope.themes").get_cursor { }
    }
  }
}

-- enhance vim.ui.select calls with Telescope
telescope.load_extension("ui-select")
