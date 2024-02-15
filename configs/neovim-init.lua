vim.env.FZF_DEFAULT_COMMAND = "rg --files"

-- https://neovim.io/doc/user/options.html
vim.o.breakindent = true
vim.o.breakindentopt = 'shift:2'
vim.o.ignorecase = true
vim.o.mouse = "a"
vim.o.number = true
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
vim.o.undofile = true

vim.g.mapleader = " " -- leader key
vim.g.maplocalleader = " "

-- fzf to switch files quickly
vim.keymap.set('n', '<leader>b', '<Cmd>Buffers<CR>')
vim.keymap.set('n', '<leader>f', '<Cmd>Files<CR>')

-- clean install with
-- rm -rf ~/.cache/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.config/nvim/plugin

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
	{ 'nvim-lualine/lualine.nvim', opts = {} },
	"airblade/vim-gitgutter",
	{
		"junegunn/fzf.vim",
		dependencies = {
			"junegunn/fzf"
		}
	},
})
