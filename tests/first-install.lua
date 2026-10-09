vim.cmd('enew')
vim.api.nvim_buf_set_lines(0, 0, -1, false, {'x = 1'})
vim.bo.filetype = 'python'
local bufnr = vim.api.nvim_get_current_buf()
local ok = vim.wait(60000, function()
  return vim.treesitter.highlighter.active[bufnr] ~= nil
end, 100)
if not ok then
  io.stderr:write('FAIL: first Python buffer starts highlighting after parser installation\n')
  vim.cmd('cquit 1')
end
assert(vim.bo.indentexpr ~= '', 'Tree-sitter indentation was not enabled')
assert(vim.v.errmsg == '', vim.v.errmsg)
print('PASS: first Python buffer starts highlighting after parser installation')
vim.cmd('qa!')
