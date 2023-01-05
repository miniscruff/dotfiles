local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.set_preferences({
  set_lsp_keymaps = false
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer=bufnr, remap = false}
  local set = vim.keymap.set
  set('n', '<leader>gd', vim.lsp.buf.definition, opts)
  set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
  set('n', '<leader>ga', vim.lsp.buf.code_action, opts)
  set('n', '<leader>gf', vim.lsp.buf.format, opts)
  set('n', '<leader><space>', vim.lsp.buf.hover, opts)
  set('n', ']d', vim.diagnostic.goto_next, opts)
  set('n', '[d', vim.diagnostic.goto_prev, opts)
end)

lsp.setup()
