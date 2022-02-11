local fn = vim.fn

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

-- Update via :PaqInstall or combined via :PaqSync
require "paq" {
	"savq/paq-nvim";
	"editorconfig/editorconfig-vim";
	"junegunn/fzf.vim";
	"neovim/nvim-lspconfig";
}

vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- fzf to switch files quickly
map('n', '_', '<Cmd>Buffers<CR>')
map('n', ';', '<Cmd>Files<CR>')
