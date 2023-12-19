vim.opt.number = true
vim.opt.hlsearch = false
vim.opt.wrap = false

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.g.mapleader = " "


vim.cmd[[colorscheme tokyonight]]


vim.api.nvim_exec([[
  autocmd VimResized * <commands>
]], false)

