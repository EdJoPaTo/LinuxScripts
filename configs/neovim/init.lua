require("packer-config")

vim.env.FZF_DEFAULT_COMMAND="rg --files"

vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.relativenumber = true
vim.opt.wildmenu = true

vim.g.mapleader = " " -- leader key

-- fzf to switch files quickly
vim.keymap.set('n', '<leader>b', '<Cmd>Buffers<CR>')
vim.keymap.set('n', '<leader>f', '<Cmd>Files<CR>')
