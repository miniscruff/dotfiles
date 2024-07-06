local lualine = require('lualine')
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
