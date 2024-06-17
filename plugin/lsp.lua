require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'pyright',
    'lua_ls',
  },
})

require('lspconfig').pyright.setup({
  filetypes = {'python'},
})
require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

local null_ls = require("null-ls")
null_ls.setup({
	diagnostics_format = "[#{m}] #{s} (#{c})",
	sources = {
		null_ls.builtins.formatting.black, -- python formatter
		null_ls.builtins.formatting.isort, -- python import sort
		null_ls.builtins.diagnostics.flake8, -- python linter
	},
})
