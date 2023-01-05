vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local tree = require("nvim-tree")
tree.setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

vim.keymap.set('n', '<leader>n', tree.toggle, {})
