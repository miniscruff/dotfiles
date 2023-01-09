local neotest = require("neotest")
neotest.setup({
  adapters = {
    require("neotest-go")({
      experimental = {
        test_table = true,
      },
    }),
  },
})

local set = vim.keymap.set
set('n', '<leader>tt', neotest.run.run)
set('n', '<leader>tf', function() neotest.run.run(vim.fn.expand("%")) end)
set('n', '<leader>ta', function() neotest.run.run(vim.fn.getcwd()) end)
set('n', '<leader>tp', neotest.output_panel.open)
set('n', '<leader>ts', neotest.summary.toggle)
