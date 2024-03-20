 local opt = vim.opt
local api = vim.api

opt.guicursor = ""

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.scrolloff = 4

opt.swapfile = false
opt.backup = false
opt.undodir = "/home/jamie/.undodir"
opt.undofile = true

--opt.foldmethod = "expr"
--opt.foldexpr = "nvim_treesitter#foldexpr()"
--:%foldo!

--api.nvim_create_autocmd({"BufEnter"}, {
--    pattern = {"*.*"},
--    command = "%foldo!"
--})
