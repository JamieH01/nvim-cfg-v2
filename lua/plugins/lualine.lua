return {
    'nvim-lualine/lualine.nvim',
    config = function()
        local scheme = require'lualine.themes.horizon'

        scheme.normal.c.bg = ''
        scheme.insert.c.bg = ''
        scheme.visual.c.bg = ''
        scheme.replace.c.bg = ''
        scheme.command.c.bg = ''
        scheme.inactive.c.bg = ''

        require('lualine').setup { options = { theme = scheme } }
    end
}
