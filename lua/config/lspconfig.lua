local nvim_lsp = require('lspconfig')
local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'
local Path = require 'plenary.path'
local Job = require 'plenary.job'
local Filetype = require 'plenary.filetype'
local notify = require 'notify'


local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>dl', ':Telescope lsp_document_symbols<CR>', opts)
  buf_set_keymap('n', 'gr', ':Telescope lsp_references<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<leader>l', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end
vim.fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "!", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

nvim_lsp.pylsp.setup {
  cmd = {'pyls'},
  capabilities = capabilities,
  on_attach = on_attach,
}
nvim_lsp.pyright.setup {
  cmd = {'pyright'},
  capabilities = capabilities,
  on_attach = on_attach,
}

require'lspconfig'.texlab.setup{}

require('rust-tools').setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

nvim_lsp.gopls.setup {
  cmd = {'/home/luka/go/bin/gopls'},
  capabilities = capabilities,
}

nvim_lsp.clangd.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  single_file_support = true,
  on_init = function()
    notify("Started Clangd", "info")
  end,
  init_options = {
    compilationDatabasePath = "build",
  },
  autostart = false,
  root_dir = util.root_pattern("CMakeLists.txt"),
}

extension = Filetype.detect(vim.api.nvim_buf_get_name(0), {})

if extension == "cpp" or extension == "c" then
  local root = Path:new(vim.api.nvim_buf_get_name(0)):parent()
  local build_dir = root .. "/build"
  local cmake_job = Job:new({
    command = "cmake",
    args = {"-DCMAKE_EXPORT_COMPILE_COMMANDS=1", "../"},
    cwd = build_dir,
    on_start = function()
      notify("Starting cmake compile_commands", "info")
    end,
    on_exit = vim.schedule_wrap(function(j, return_code)
      if return_code ~= 0 then
        notify("Unable to run cmake", "warning")
        return
      end
      vim.cmd [[ :LspStart ]]
    end)
  })
  local cmake_lists_exists = Path:new(root .. "/CMakeLists.txt"):exists()
  if not cmake_lists_exists then
    notify("CMakeLists.txt not found, not starting clangd", "warning")
  elseif Path:new(build_dir):mkdir({ exists_ok = true, parents=true }) == true then
    cmake_job:start()
  else
    vim.g.custom_status = "Unable to create build dir"
  end

end
