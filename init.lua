require("set")
require("pkg")
require("remap")
require("cmds")
require("lsp")


--vim.cmd[[set termguicolors]]
vim.g.moonflyVirtualTextColor = true
vim.g.sonokai_diagnostic_virtual_text = 'colored' 

vim.cmd("colorscheme sonokai")

--vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
--vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

