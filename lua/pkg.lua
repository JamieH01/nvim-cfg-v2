-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

deps = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    'hrsh7th/cmp-nvim-lsp',

    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup{}
        end,
        dependencies = {
            { 'williamboman/mason-lspconfig.nvim' }
        },
    },
}

require("lazy").setup({deps, {import = "plugins"}, require("lsp") })
