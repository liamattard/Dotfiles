require("dirbuf").setup({
	hash_padding = 2,
	show_hidden = true,
	sort_order = "default",
	write_cmd = "DirbufSync",
})

vim.api.nvim_set_keymap("n", "<Leader>e", ":Dirbuf<CR>", { noremap = true, silent = true })
