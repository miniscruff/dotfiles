local lualine = require('lualine')
local sig = require("lsp_signature")

local signature_config = {
  debug = false,
  hint_enable = false,
  handler_opts = { border = "single" },
  max_width = 120,
}

sig.setup(signature_config)

lualine.setup({
    globalstatus = true,
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = {'location'},
        lualine_y = {'diff'},
        lualine_z = {'diagnostics'},
    },
})
