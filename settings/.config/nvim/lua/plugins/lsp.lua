return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
      "ray-x/lsp_signature.nvim",
      { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

          vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

          local set = vim.keymap.set
          local opts = { buffer = bufnr, remap = false }
          set('n', '<leader>gd', vim.lsp.buf.definition, opts)
          set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
          set({'n', 'v'}, '<leader>ga', vim.lsp.buf.code_action, opts)
          set('n', '<leader>gf', vim.lsp.buf.format, opts)
          set('n', '<leader>gr', vim.lsp.buf.references, opts)
          set('n', '<leader>ge', vim.lsp.buf.rename, opts)
          set('n', '<leader><space>', vim.lsp.buf.hover, opts)
          set('n', '<leader>gg', vim.diagnostic.open_float, opts)
          set('n', ']d', vim.diagnostic.goto_next, opts)
          set('n', '[d', vim.diagnostic.goto_prev, opts)
          set('n', '<leader>gn', vim.diagnostic.goto_next, opts)
          set('n', '<leader>gp', vim.diagnostic.goto_prev, opts)

          require("lsp_signature").on_attach({}, bufnr)
        end,
      })

      require("lsp_lines").setup()
      vim.diagnostic.config { virtual_text = false }
    end,
  },
}
