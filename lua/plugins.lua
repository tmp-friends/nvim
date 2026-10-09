local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazy_path) then
  local output = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazy_path,
  })
  assert(vim.v.shell_error == 0, "Failed to install lazy.nvim: " .. output)
end
vim.opt.rtp:prepend(lazy_path)

require("lazy").setup({
  {
    "dracula/vim",
    name = "dracula",
    priority = 1000,
    config = function() vim.cmd.colorscheme("dracula") end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = { options = { theme = "dracula" } },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function() require("completion") end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "mason-org/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function() require("lsp") end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { python = { "black" } },
      formatters = { black = { prepend_args = { "--line-length", "88" } } },
      format_on_save = { timeout_ms = 3000, lsp_format = "never" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function() require("treesitter") end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
}, {
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
  rocks = { enabled = false },
  checker = { enabled = false },
  change_detection = { notify = false },
})
