vim.env.FZF_DEFAULT_COMMAND = "fd --hidden --type=file"

-- https://neovim.io/doc/user/options.html
vim.o.breakindent = true
vim.o.breakindentopt = 'shift:2'
vim.o.ignorecase = true
vim.o.mouse = "a"
vim.o.number = true
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.undofile = true

vim.g.mapleader = " " -- leader key
vim.g.maplocalleader = " "

-- fzf to switch files quickly
vim.keymap.set('n', '<leader>b', '<Cmd>Buffers<CR>', { desc = "Switch to open buffers quickly" })
vim.keymap.set('n', '<leader>f', '<Cmd>Files<CR>', { desc = "Open files quickly" })

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
	{ 'nvim-lualine/lualine.nvim', opts = { theme = 'onedark' } },
	{ 'lewis6991/gitsigns.nvim', opts = {} },
	{
		"junegunn/fzf.vim",
		dependencies = {
			"junegunn/fzf"
		}
	},

	-- "gc" to comment visual regions/lines
	{ 'numToStr/Comment.nvim', opts = {} },

	-- Autocomplete commands
	{ 'gelguy/wilder.nvim', opts = { modes = { ':', '/', '?' } } },

	-- Useful plugin to show pending keybinds
	{
		'folke/which-key.nvim',
		opts = {
			plugins = {
				presets = {
					operators = true,
					motions = true,
					text_objects = true,
					windows = true,
					nav = true,
					z = true,
					g = true,
				}
			}
		}
	},

	{
		-- Theme inspired by Atom
		'navarasu/onedark.nvim',
		priority = 1000,
		lazy = false,
		config = function()
			require('onedark').setup({
				style = 'warmer',
				transparent = true,
				lualine = {
					transparent = true,
				}
			})
			require('onedark').load()
		end,
	},
})
