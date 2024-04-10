local bind = vim.keymap.set

bind("n", "<leader>c", ":Ex ~/.config/nvim<enter>", { desc = "Open config directory" })

bind("n", "<C-H>", vim.cmd.noh)

--common symbols (rust)
bind("i", "<C-J>", "&")
bind("i", "<C-K>", "*")
bind("i", "<C-G>", "->")
bind("i", "<C-H>", "=>")

bind({"n", "v"}, "<S-L>", "$")
bind({"n", "v"}, "<S-H>", "0")

--move selection
bind("v", "J", ":m '>+1<CR>gv=gv")
bind("v", "K", ":m '<-2<CR>gv=gv")

--system clipboard
bind({"n", "v"}, "Y", "\"+y")
bind({"n", "v"}, "P", "\"+p")

--fold
bind({"n", "v"}, "fa", "za")
bind("v", "fm", "zf")
