return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-go",
    },
    config = function()
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace("neotest")
      local neotest = require("neotest")
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message =
                diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)

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
    end,
  },
}
