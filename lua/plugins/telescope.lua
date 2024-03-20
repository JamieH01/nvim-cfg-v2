return {
    'nvim-telescope/telescope.nvim',
    config = function()
        vim.keymap.set({"n", "v"}, "<leader>f", vim.cmd.Telescope, { desc = "Open fuzzy finder" })
    end
}
