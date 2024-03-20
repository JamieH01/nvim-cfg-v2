local bind = vim.keymap.set

vim.g.mapleader = " "
bind("n", "<leader>e", ":lua MiniFiles.open()<enter>", { desc = "Open file explorer" })
bind("n", "<C-u>", vim.cmd.UndotreeToggle, { desc = "Open undo tree" })
--bind({"n", "v"}, "<leader>a", require("actions-preview").code_actions, { desc = "Open code actions" })
bind({"n", "v"}, "<leader>f", vim.cmd.Telescope, { desc = "Open fuzzy finder" })

bind("n", "<leader>c", ":Ex ~/.config/nvim<enter>", { desc = "Open config directory" })
--bind("n", "<leader>s", vim.cmd.write, { desc = "Write file" })

bind({"n", "v"}, "<S-H>", "0")
bind({"n", "v"}, "<S-L>", "$")

bind("n", "<S-T>", require('FTerm').open)

bind("n", "cf", ":!cargo fmt<enter><enter>", { desc = "cargo format" })

bind("i", "<C-F>", "<Esc>l")
bind("n", "<C-H>", vim.cmd.noh)

--bind("n", "<S-K>", "<C-B>")
--bind("n", "<S-J>", "<C-D>")

--common symbols (rust)
bind("i", "<C-J>", "&")
bind("i", "<C-K>", "*")
bind("i", "<C-G>", "->")
bind("i", "<C-H>", "=>")

--move selection
bind("v", "J", ":m '>+1<CR>gv=gv")
bind("v", "K", ":m '<-2<CR>gv=gv")

--system clipboard
bind({"n", "v"}, "Y", "\"+y")
bind({"n", "v"}, "P", "\"+p")

--fold
bind({"n", "v"}, "fa", "za")
bind("v", "fm", "zf")

--term
bind("t", "<Esc>", "<C-\\><C-n>:q<enter>")
