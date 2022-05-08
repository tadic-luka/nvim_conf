local cmp = require 'cmp'
local luasnip = require 'luasnip'


local function border(hl_name)
   return {
      { "╭", hl_name },
      { "─", hl_name },
      { "╮", hl_name },
      { "│", hl_name },
      { "╯", hl_name },
      { "─", hl_name },
      { "╰", hl_name },
      { "│", hl_name },
   }
end

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  window = {
    documentation = true,
    completion = {
      border = border "CmpBorder",
    },
    documentation = {
      border = border "CmpDocBorder",
    },
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
    ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
	    if luasnip.jumpable(1) then
		    luasnip.jump(1)
	    elseif cmp.visible() then
		    cmp.select_next_item()
	    else
		    fallback()
	    end
    end, {"i", "s"}),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
	    if luasnip.jumpable(-1) then
		    luasnip.jump(-1)
	    elseif cmp.visible() then
		    cmp.select_prev_item()
	    else
		    fallback()
	    end
    end, {"i", "s"}),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lua' },
    { name = 'latex_symbols' },
    { name = 'treesitter' },
  },
  completion = {
    completeopt = 'menu,menuone,noselect'
  }
})
