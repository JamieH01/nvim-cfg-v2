return {{
    "echasnovski/mini.files",
    config = function()
        vim.keymap.set("n", "<leader>e", ":lua MiniFiles.open()<enter>", { desc = "Open file explorer" })
        require('mini.files').setup{
            mappings = {
                close = "<esc>",
                go_in = "<enter>"
            }
        }
    end
}}
