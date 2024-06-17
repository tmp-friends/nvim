local options = {
  number = true,
  title = true,
  tabstop = 2,
  expandtab = true,
  shiftwidth = 2,
  smartindent = true,
  hidden = true,
  backup = false,
  swapfile = false,
  completeopt = {"menuone", "noinsert"},
  clipboard = "unnamedplus",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

local global_options = {
  -- Filer(netrw)
  netrw_banner = 0, -- Hide banner
  netrw_browse_split = 4, -- Open in previous window
  netrw_altv = 1, -- Open with right splitting
  netrw_liststyle = 3, -- Tree-style view
  netrw_winsize = 90,
}

for k, v in pairs(global_options) do
  vim.g[k] = v
end

vim.cmd([[set iskeyword+=-]]) -- ケバブケースを1単語として扱う
