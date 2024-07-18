return {
  {
    "stevearc/oil.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.icons",
    },
    config = function()
      require("oil").setup {
        columns = { "icon" },
        keymaps = {
          ["h"] = "actions.parent",
          ["l"] = "actions.select",
        },
        view_options = {
          show_hidden = true,
        },
        float = {
          padding = 10,
          max_width = 80,
          max_height = 30,
        },
      }

      vim.keymap.set("n", "<leader>n", function()
        require("oil").toggle_float(".")
      end)
    end,
  },
}
