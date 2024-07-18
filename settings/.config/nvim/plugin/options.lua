local opt = vim.opt

-- window
opt.title = true
opt.eb = false
opt.splitright = true
opt.scrolloff = 5
opt.updatetime = 100
opt.clipboard = vim.opt.clipboard + "unnamedplus"
opt.backspace = "indent,eol,start"

-- files
opt.swapfile = false
opt.backup = false
opt.fileformat = "unix"
opt.encoding = "utf-8"

-- visuals
opt.relativenumber = true
opt.nu = true
opt.termguicolors = true
opt.showmode = false
opt.cursorline = true
opt.signcolumn = "yes"

-- search
opt.showcmd = true
opt.hlsearch = true
opt.incsearch = true
opt.showmatch = true
opt.ignorecase = true
opt.smartcase = true

-- formatting
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.autoindent = true
opt.wrap = false

-- file types
vim.filetype.add({
  extension = { templ = "templ", justfile = "make" }
})
