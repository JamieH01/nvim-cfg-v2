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

local core = {
    {
        'VonHeikemen/lsp-zero.nvim', 
        branch = 'v3.x',
    },
    'neovim/nvim-lspconfig',
    {'hrsh7th/nvim-cmp',
        dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    },
}

local extentions = {
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'alaviss/tree-sitter-nim',
    'simrat39/rust-tools.nvim',
    'p00f/clangd_extensions.nvim',

    {
        'mrcjkb/haskell-tools.nvim',
        version = '^3', -- Recommended
        ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
    }
}

require("lazy").setup({deps, core, extentions, {import = "plugins"}})
