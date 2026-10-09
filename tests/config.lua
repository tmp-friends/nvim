local function check(name, fn)
  local ok, err = pcall(fn)
  if not ok then
    io.stderr:write('FAIL: ' .. name .. ': ' .. tostring(err) .. '\n')
    vim.cmd('cquit 1')
  end
  print('PASS: ' .. name)
end

check('startup loads the configured plugins without errors', function()
  assert(vim.v.errmsg == '', vim.v.errmsg)
  assert(require('lazy'))
  assert(require('cmp'))
  assert(require('conform'))
  assert(vim.g.colors_name == 'dracula')
end)

check('LSP completion supports native snippet expansion', function()
  local cmp = require('cmp')
  local caps = vim.lsp.config['*'].capabilities
  assert(caps.textDocument.completion.completionItem.snippetSupport)
  vim.cmd('enew')
  cmp.get_config().snippet.expand({ body = '${1:value} = ${2:42}' })
  assert(vim.api.nvim_get_current_line() == 'value = 42')
  vim.snippet.stop()
  vim.cmd('stopinsert')
end)

check('Python and Lua servers are enabled with Lua vim diagnostics configured', function()
  assert(vim.lsp.is_enabled('pyright'))
  assert(vim.lsp.is_enabled('lua_ls'))
  assert(vim.lsp.config.lua_ls.settings.Lua.diagnostics.globals[1] == 'vim')
end)

check('saving Python formats with Black and removes trailing whitespace', function()
  local file = vim.fn.tempname() .. '.py'
  vim.cmd('edit ' .. vim.fn.fnameescape(file))
  vim.api.nvim_buf_set_lines(0, 0, -1, false, {'x={"a":1}   '})
  vim.cmd('write')
  assert(vim.fn.readfile(file)[1] == 'x = {"a": 1}')
  vim.fn.delete(file)
  vim.cmd('bwipeout!')
end)

check('Python and Lua parsers can parse a buffer', function()
  for _, lang in ipairs({'python', 'lua'}) do
    local parser = vim.treesitter.get_string_parser('x = 1', lang)
    assert(parser:parse()[1]:root():has_error() == false)
  end
end)

check('Python and Lua language servers attach to their buffers', function()
  local root = vim.fn.tempname()
  vim.fn.mkdir(root, 'p')
  vim.fn.writefile({'[project]', 'name = "nvim-test"', 'version = "0.0.0"'}, root .. '/pyproject.toml')
  vim.fn.writefile({'{}'}, root .. '/.luarc.json')
  for _, server in ipairs({{'python', 'py', 'pyright'}, {'lua', 'lua', 'lua_ls'}}) do
    local file = root .. '/sample.' .. server[2]
    vim.fn.writefile({'x = 1'}, file)
    vim.cmd('edit ' .. vim.fn.fnameescape(file))
    local bufnr = vim.api.nvim_get_current_buf()
    assert(vim.wait(15000, function()
      for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr, name = server[3] })) do
        if client.initialized then return true end
      end
      return false
    end, 100), server[3] .. ' did not attach')
    assert(vim.treesitter.highlighter.active[bufnr], server[1] .. ' highlighting did not start')
    vim.cmd('bwipeout!')
  end
  vim.fn.delete(root, 'rf')
end)

assert(vim.v.errmsg == '', vim.v.errmsg)
vim.cmd('qa!')
