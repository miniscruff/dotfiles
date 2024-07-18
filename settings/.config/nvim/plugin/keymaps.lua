local set = vim.keymap.set
local norm_vis = {"n", "v"}

set("n", "Q", "<nop>")
set("t", "<Esc>", "<C-\\><C-n>")

-- colon trick
set(norm_vis, ";", ":")
set(norm_vis, "q;", "q:")

-- lines
set(norm_vis, "H", "^")
set(norm_vis, "J", "}")
set(norm_vis, "K", "{")
set(norm_vis, "L", "$")
set("n", "Y", "y$")
set("n", "<c-j>", [[:exe ":m.+".v:count1<cr>]])
set("n", "<c-k>", [[:exe ":m.-".(v:count1+1)<cr>]])
set("n", "<c-l>", "J$")
set("n", "<c-n>", ":cn<cr>")

-- buffers
set("n", "<leader>j", "<c-w><c-j>")
set("n", "<leader>k", "<c-w><c-k>")
set("n", "<leader>l", "<c-w><c-l>")
set("n", "<leader>h", "<c-w><c-h>")
set("n", "<leader>q", ":b#<cr>")
set("n", "<c-up>", "<c-w>+")
set("n", "<c-down>", "<c-w>-")
set("n", "<c-left>", "<c-w>>")
set("n", "<c-right>", "<c-w><")

-- random
set("n", "<leader>/", ":noh<cr>")
set("n", "<leader>mo", ":copen<cr>")
set("v", "<leader>es", ":!sort -k 2<cr>")
