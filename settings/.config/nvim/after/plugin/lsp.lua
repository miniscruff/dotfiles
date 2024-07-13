local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = false,
  manage_nvim_cmp = false,
  suggest_lsp_servers = true,
})

local lspconfig = require('lspconfig')
lspconfig.html.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "html", "templ" },
})
lspconfig.htmx.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "html", "templ" },
})
lspconfig.tailwindcss.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "templ", "astro", "javascript", "typescript", "react" },
    init_options = { userLanguages = { templ = "html" } },
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer=bufnr, remap = false}
  local set = vim.keymap.set
  set('n', '<leader>gd', vim.lsp.buf.definition, opts)
  set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
  set('n', '<leader>ga', vim.lsp.buf.code_action, opts)
  set('n', '<leader>gf', vim.lsp.buf.format, opts)
  set('n', '<leader>gr', vim.lsp.buf.references, opts)
  set('n', '<leader><space>', vim.lsp.buf.hover, opts)
  set('n', '<leader>gg', vim.diagnostic.open_float, opts)
  set('n', ']d', vim.diagnostic.goto_next, opts)
  set('n', '[d', vim.diagnostic.goto_prev, opts)
  set('n', '<leader>gn', vim.diagnostic.goto_next, opts)
  set('n', '<leader>gp', vim.diagnostic.goto_prev, opts)
end)

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local lspkind = require('lspkind')
local compare = require('cmp.config.compare')

cmp.setup({
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect'
  },
  -- mapping = lsp.defaults.cmp_mappings({
    -- ['<C-Space>'] = cmp_action.toggle_completion(),
    -- ['<C-e>'] = cmp.mapping.abort(),
  -- }),
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-n>'] = cmp_action.luasnip_supertab(),
    ['<C-p>'] = cmp_action.luasnip_shift_supertab(),
  }),
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  formatting = {
    fields = { 'kind', 'abbr', 'menu', },
    format = lspkind.cmp_format({
      with_test = false,
    }),
  },
  sources = cmp.config.sources({
    { name = 'luasnip', keyword_length = 1, priority = 10 },
    { name = 'nvim_lsp', keyword_length = 0, priority = 5 },
  }, {
    { name = 'buffer', keyword_length = 3},
  }),
  sorting = {
    priority_weight = 2.0,
    comparators = {
      compare.exact,
      compare.offset,
      compare.score,
      -- compare.recently_used,
      -- compare.locality,
      compare.kind,
      compare.order,
    },
  },
})

