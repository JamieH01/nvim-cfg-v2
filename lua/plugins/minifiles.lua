return {{
    "echasnovski/mini.files",
    config = function()
        require('mini.files').setup{
            mappings = {
                close = "<esc>",
                go_in = "<enter>"
            }
        }
    end
}}
