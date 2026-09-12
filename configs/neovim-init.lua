-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua

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
	{
		"teamtype/teamtype-nvim",
		keys = {
			{ "<leader>ej", "<cmd>TeamtypeJumpToCursor<cr>" },
			{ "<leader>ef", "<cmd>TeamtypeFollow<cr>" },
		},
		lazy = false,
	},

	{ 'nvim-lualine/lualine.nvim', opts = { theme = 'base16' } },
	{ 'lewis6991/gitsigns.nvim', opts = {} },
	{
		"junegunn/fzf.vim",
		dependencies = {
			"junegunn/fzf"
		}
	},

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
		'saecki/crates.nvim',
		event = { "BufRead Cargo.toml" },
		config = function()
			require('crates').setup()
		end,
	},

	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate',
		config = function()
			-- https://stackoverflow.com/questions/79850814/how-to-finish-tree-sitter-plugin-in-neovim-by-lazy-nvim/79889920#79889920
			local ts = require("nvim-treesitter")
			local languages = {
				'bash',
				'c',
				'comment',
				'cpp',
				'css',
				'csv',
				'dockerfile',
				'fish',
				'git_config',
				'git_rebase',
				'gitcommit',
				'gitignore',
				'go',
				'gomod',
				'html',
				'hyprlang',
				'ini',
				'javascript',
				'jsdoc',
				'json',
				'kdl',
				'lua',
				'markdown',
				'nix',
				'passwd',
				'python',
				'regex',
				'rust',
				'slint',
				'sparql',
				'ssh_config',
				'toml',
				'tsx',
				'tsx',
				'typescript',
				'vim',
				'vimdoc',
				'yaml',
				'zig',
			}
			ts.setup({})
			ts.install(languages)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = languages,
				callback = function()
					-- Enable native Neovim treesitter highlighting
					vim.treesitter.start()

					-- Configure code folding
					vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.wo.foldmethod = "expr"
					vim.wo.foldlevel = 99

					-- Enable treesitter-based indentation
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
	    })
		end,
	},
})
