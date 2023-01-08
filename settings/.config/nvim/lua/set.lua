-- window
vim.opt.title = true
vim.opt.eb = false
vim.opt.splitright = true
vim.opt.scrolloff = 5
vim.opt.updatetime = 100
vim.opt.clipboard = vim.opt.clipboard + "unnamedplus"
vim.opt.backspace = "indent,eol,start"
vim.opt.completeopt = { "menu", "menuone" ,"noselect" }

-- files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.fileformat = "unix"
vim.opt.encoding = "utf-8"

-- visuals
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

-- search
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- formatting
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.wrap = false
