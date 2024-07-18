return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = { "core" },
        auto_install = true,
      })
    end,
  },
}
