vim.g.mapleader = " "
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- colon trick
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "q;", "q:")

-- lines
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "J", "}")
vim.keymap.set("n", "K", "{")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "<c-j>", [[:exe ":m.+".v:count1<cr>]])
vim.keymap.set("n", "<c-k>", [[:exe ":m.-".(v:count1+1)<cr>]])
vim.keymap.set("n", "<c-l>", "J$")
vim.keymap.set("n", "<c-n>", ":cn<cr>")

-- buffers
vim.keymap.set("n", "<leader>j", "<c-w><c-j>")
vim.keymap.set("n", "<leader>k", "<c-w><c-k>")
vim.keymap.set("n", "<leader>l", "<c-w><c-l>")
vim.keymap.set("n", "<leader>h", "<c-w><c-h>")
vim.keymap.set("n", "<leader>q", ":b#<cr>")
vim.keymap.set("n", "<c-up>", "<c-w>+")
vim.keymap.set("n", "<c-down>", "<c-w>-")
vim.keymap.set("n", "<c-left>", "<c-w>>")
vim.keymap.set("n", "<c-right>", "<c-w><")

-- random
vim.keymap.set("n", "<leader>/", ":noh<cr>")
vim.keymap.set("n", "<leader>mo", ":copen<cr>")
