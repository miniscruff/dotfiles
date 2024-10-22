return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "ray-x/lsp_signature.nvim",
      { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
    },
    config = function()
      local capabilities = nil
      if pcall(require, "cmp_nvim_lsp") then
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      end

      local lspconfig = require("lspconfig")

      local servers = {
        bashls = true,
        gopls = {
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
        },
        lua_ls = {
          server_capabilities = {
            semanticTokensProvider = vim.NIL,
          },
        },
        cssls = true,
      }

      local servers_to_install = vim.tbl_filter(function(key)
        local t = servers[key]
        if type(t) == "table" then
          return not t.manual_install
        else
          return t
        end
      end, vim.tbl_keys(servers))

      require("mason").setup()
      local ensure_installed = {
        "stylua",
        "lua_ls",
        "delve",
      }

      vim.list_extend(ensure_installed, servers_to_install)
      require("mason-tool-installer").setup { ensure_installed = ensure_installed }

      for name, config in pairs(servers) do
        if config == true then
          config = {}
        end
        config = vim.tbl_deep_extend("force", {}, {
          capabilities = capabilities,
        }, config)

        lspconfig[name].setup(config)
      end

      local disable_semantic_tokens = {
        lua = true,
      }

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

          local settings = servers[client.name]
          if type(settings) ~= "table" then
            settings = {}
          end

          vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"


          local builtin = require "telescope.builtin"
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

          local filetype = vim.bo[bufnr].filetype
          if disable_semantic_tokens[filetype] then
            client.server_capabilities.semanticTokensProvider = nil
          end

          -- Override server capabilities
          if settings.server_capabilities then
            for k, v in pairs(settings.server_capabilities) do
              if v == vim.NIL then
                ---@diagnostic disable-next-line: cast-local-type
                v = nil
              end

              client.server_capabilities[k] = v
            end
          end
        end,
      })

      require("lsp_lines").setup()
      vim.diagnostic.config { virtual_text = false }

      require("lsp_signature").setup()
    end,
  },
}
