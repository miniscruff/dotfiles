return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "ray-x/lsp_signature.nvim",
      { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
    },
    config = function()
      local capabilities = nil
      if pcall(require, "cmp_nvim_lsp") then
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      end

      require("mason").setup()
      require("mason-lspconfig").setup()

      require("mason-lspconfig").setup_handlers {
          -- The first entry (without a key) will be the default handler
          -- and will be called for each installed server that doesn't have
          -- a dedicated handler.
          function (server_name) -- default handler (optional)
              require("lspconfig")[server_name].setup {}
          end,
          ["lua_ls"] = function ()
            local lspconfig = require("lspconfig")
            lspconfig.gopls.setup{
              settings = {
                gopls = {
                  hints = {
                    assignVariableTypes = true,
                    compositeLiteralFields = true,
                    compositeLiteralTypes = true,
                    constantValues = true,
                    functionTypeParameters = true,
                    parameterNames = true,
                    rangeVariableTypes = true,
                  },
                },
              },
            }
         end,
      }

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

          vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

          local set = vim.keymap.set
          local opts = { buffer = bufnr, remap = false }
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

          require("lsp_signature").on_attach({}, bufnr)
        end,
      })

      require("lsp_lines").setup()
      vim.diagnostic.config { virtual_text = false }
    end,
  },
}
