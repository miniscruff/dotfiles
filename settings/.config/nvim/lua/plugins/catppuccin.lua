return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      integrations = {
        cmp = true,
        mason = true,
        telescope = true,
        dap = true,
        neotest = true,
      },
    })
    vim.cmd.colorscheme "catppuccin"
  end,
}
