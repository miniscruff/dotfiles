filetype indent plugin on

syntax on

call plug#begin('~/.vim/plugged')
" General
Plug 'tpope/vim-fugitive' " handles git integration
Plug 'lilydjwg/colorizer' " colors #303030 text
Plug 'inside/vim-search-pulse' " pulses search results
Plug 'catppuccin/nvim', {'as': 'catppuccin'} " color theme

" explorers
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua' " file explorer
Plug 'nvim-lua/plenary.nvim' " required for telescope
Plug 'nvim-telescope/telescope.nvim' " fuzzy search lots of things
Plug 'stevearc/aerial.nvim' " outline view

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'ray-x/lsp_signature.nvim' " show function signature as we are filling them in

call plug#end()

lua <<EOF
require'nvim-tree'.setup()

require("aerial").setup({
  backends = {'treesitter', 'lsp'},
  highlight_on_hover = true,
  close_on_select = true,
  float = {
    relative = 'editor',
  },
  on_attach = function(bufnr)
    -- Toggle the aerial window with <leader>a
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>o', '<cmd>AerialToggle float<CR>', {})
  end
})

require "lsp_signature".setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  floating_window_above_cur_line = false, -- try and go below as most vars are above
  handler_opts = {
    border = "rounded"
  }
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  require("aerial").on_attach(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader><space>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fo', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local cmp = require'cmp'
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      -- use tab for completing, otherwise it is just hints
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  }),
  preselect = "item",
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = { 'gopls', 'tsserver', 'graphql' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach
  }
end

-- color scheme
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

require("catppuccin").setup()

vim.cmd [[colorscheme catppuccin]]

-- options

EOF

nnoremap <Space> <Nop>
let mapleader = " "

nnoremap ; :
nnoremap q; q:

" Map escape in terminal to go to normal
tnoremap <Esc> <C-\><C-n>

nnoremap <leader>j <C-w><C-j>
nnoremap <leader>k <C-w><C-k>
nnoremap <leader>l <C-w><C-l>
nnoremap <leader>h <C-w><C-h>
nnoremap <leader>/ :noh<cr>
nnoremap <leader>q :b#<cr>
nnoremap <leader>n :NvimTreeToggle<CR>
nnoremap <leader>r :%s//g<left><left>
nnoremap <leader>d :g//d<left><left>

nnoremap <leader>mo :copen<cr>

nnoremap <leader>gg :Ggrep<space>
" grep word will yank and ggrep the next word
nnoremap <leader>gw yw:Ggrep<space><C-r>"<cr>

nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w>>
nnoremap <c-right> <c-w><
nnoremap <c-j> :<c-u>exe ":m.+".v:count1<cr>
nnoremap <c-k> :<c-u>exe ":m.-".(v:count1+1)<cr>
nnoremap <c-l> J$
nnoremap <c-n> :cn<cr>

map ^ <nop>
map { <nop>
map } <nop>
map $ <nop>

nnoremap H ^
nnoremap J }
nnoremap K {
nnoremap L $
nnoremap Y y$

" telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fm <cmd>lua require('telescope.builtin').marks()<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').treesitter()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').diagnostics()<cr>
nnoremap <leader>fd <cmd>lua require('telescope.builtin').lsp_definitions()<cr>
nnoremap <leader>fi <cmd>lua require('telescope.builtin').lsp_implementations()<cr>
nnoremap <leader>fa <cmd>lua require('telescope.builtin').lsp_code_actions()<cr>
nnoremap <leader>fk <cmd>lua require('telescope.builtin').keymaps()<cr>

set termguicolors
set title
set noeb
set rnu
set nu
set noswapfile
set enc=utf-8
set wildignore+=venv,*__pycache__*,*.swp,*.exe,*.pyc,*/tmp*,node_modules,*.db,*egg-info,*wheel-metadata
set clipboard+=unnamedplus
set nowrap
set showmatch
set showcmd
set cursorline
set hlsearch
set backspace=indent,eol,start
set incsearch
set ignorecase
set smartcase
set scrolloff=5
set go-=m
set go-=T
set fileformat=unix
set expandtab
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set splitright
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes
set noshowmode
set completeopt=menu,menuone,noselect

au BufNewFile,BufRead *.go
    \ set noexpandtab

" Python
let python_highlight_all = 1

" Git Branch
function! GitInfo()
  let git = FugitiveHead()
  if git != ''
    return '  '.FugitiveHead().' '
  else
    return ''
endfunction

" Status Line
set laststatus=2
set statusline=
set statusline+=%1*\ %{GitInfo()}\         " Git branch
set statusline+=%0*\ %f%m%r%h%w            " File path and modified
set statusline+=%=                         " Right side
set statusline+=%2*\ %l/%L\ :%c\           " line number / total lines
set statusline+=%3*\ %{StatuslineMode()}\  " Current mode
hi User1 ctermbg=black ctermfg=green guibg=#303030 guifg=green
hi User2 ctermbg=black ctermfg=white guibg=#303030 guifg=white
hi User3 guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
au InsertEnter * hi User3 guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
au InsertLeave * hi User3 guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction

" display tabs and trailing whitespace
exec "set listchars=tab:\uBB\uBB,trail:\uD7,nbsp:~"
set list
