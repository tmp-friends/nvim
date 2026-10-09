local languages = { "python", "lua" }
local install_dir = vim.fn.stdpath("data") .. "/site"
vim.fn.mkdir(install_dir, "p")
require("nvim-treesitter").setup({ install_dir = install_dir })

local function start(bufnr)
  if not vim.api.nvim_buf_is_loaded(bufnr) then return end
  if not vim.list_contains(languages, vim.bo[bufnr].filetype) then return end
  local size = vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr))
  if size > 100 * 1024 then return end
  local lang = vim.treesitter.language.get_lang(vim.bo[bufnr].filetype)
  if not vim.treesitter.language.add(lang) then return end
  vim.treesitter.start(bufnr, lang)
  vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = languages,
  callback = function(args) start(args.buf) end,
})

require("nvim-treesitter").install(languages):await(vim.schedule_wrap(function(err)
  if err then
    vim.notify("Tree-sitter installation failed: " .. tostring(err), vim.log.levels.ERROR)
    return
  end
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do start(bufnr) end
end))
