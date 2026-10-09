assert(vim.fn.has("nvim-0.12") == 1, "This configuration requires Neovim 0.12+")

require("options")
require("keymaps")
require("autocmds")
require("plugins")

