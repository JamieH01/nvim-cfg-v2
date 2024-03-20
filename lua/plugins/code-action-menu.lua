return {{ "aznhe21/actions-preview.nvim",
	config = function()
        local ap = require("actions-preview")
		vim.keymap.set({"v", "n"}, "<leader>a", ap.code_actions)
        ap.setup {
            backend = "nui",
            diff = {
                algorithm = "patience",
                ignore_whitespace = true,
            },
            nui = {
                layout = {
                    size = {
                        width = "70%",
                        height = "70%",
                    }
                },
                preview = {
                    size = "60%",
                },
                select = {
                    size = "45%",
                },
            },
        }
	end,
}}
