return {
    'nvim-telescope/telescope.nvim',
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set({"n", "v"}, "tf", builtin.live_grep, { desc = "Open fuzzy finder" })
        vim.keymap.set({"n", "v"}, "td", builtin.diagnostics, { desc = "View diagnostics"})
        vim.keymap.set({"n", "v"}, "ts", builtin.lsp_document_symbols, { desc = "Symbol picker"})
    end
}
