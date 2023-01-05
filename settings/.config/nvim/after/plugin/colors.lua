require("catppuccin").setup({
  flavour = "mocha",
  integrations = {
    cmp = true,
    mason = true,
    nvimtree = true,
    telescope = true,
    dap = true,
    neotest = true,
  },
})

vim.cmd.colorscheme "catppuccin"
