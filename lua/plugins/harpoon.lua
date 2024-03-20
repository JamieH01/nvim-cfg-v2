
return { 
    "theprimeagen/harpoon",
    config = function()
        local mark = require('harpoon.mark')
        local ui = require('harpoon.ui')

        vim.keymap.set('n', '<leader>m', mark.add_file, { desc = "Mark file" })
        vim.keymap.set('n', '<leader>h', ui.toggle_quick_menu, { desc = "Open harpoon menu" })
        vim.keymap.set('n', '<C-j>', ui.nav_prev)
        vim.keymap.set('n', '<C-k>', ui.nav_next)

        vim.keymap.set('n', '<leader>j', function() ui.nav_file(1) end, { desc = "File 1" })
        vim.keymap.set('n', '<leader>k', function() ui.nav_file(2) end, { desc = "File 2" })
        vim.keymap.set('n', '<leader>l', function() ui.nav_file(3) end, { desc = "File 3" })
        vim.keymap.set('n', '<leader>;', function() ui.nav_file(4) end, { desc = "File 4" })
    end,
}
