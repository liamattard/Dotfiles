local builtin = require("telescope.builtin")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>p", builtin.find_files, {})
vim.keymap.set("n", "<leader><S-P>", builtin.live_grep, {})
vim.keymap.set("n", "<leader>s", builtin.buffers, {})
