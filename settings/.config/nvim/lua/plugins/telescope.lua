return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fm', builtin.marks, {})
    vim.keymap.set('n', '<leader>fj', builtin.jumplist, {})
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fo', function()
      builtin.lsp_document_symbols { symbol_width = 60, ignore_symbols = { "field", "variable" } }
    end, {})
    vim.keymap.set('n', '<leader>fs', builtin.spell_suggest, {})
    -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    -- vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
    -- vim.keymap.set('n', '<leader>fg', builtin.diagnostics, {})
    require('telescope').setup({})
  end,
}
