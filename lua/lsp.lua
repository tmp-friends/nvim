vim.lsp.config("*", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
vim.lsp.config("lua_ls", {
  settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})

require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "lua_ls" },
  automatic_enable = false,
})
vim.lsp.enable({ "pyright", "lua_ls" })
