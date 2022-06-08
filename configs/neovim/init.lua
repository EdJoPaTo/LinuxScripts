require("packer-config")
require("treesitter-config")
require("lsp-config")

vim.env.FZF_DEFAULT_COMMAND="rg --files"

vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.relativenumber = true
vim.opt.wildmenu = true

-- fzf to switch files quickly
vim.keymap.set('n', '_', '<Cmd>Buffers<CR>')
vim.keymap.set('n', ';', '<Cmd>Files<CR>')

vim.g.mapleader = " " -- leader key

-- nvim tree mappings
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>gt", ":NvimTreeFocus<CR>")
-- barbar mappings
vim.keymap.set("n", "<A-,>", ":BufferPrevious<CR>")
vim.keymap.set("n", "<A-.>", ":BufferNext<CR>")
vim.keymap.set("n", "<A-<>", ":BufferMovePrevious<CR>")
vim.keymap.set("n", "<A->>", ":BufferMoveNext<CR>")
vim.keymap.set("n", "<A-1>", ":BufferGoto 1<CR>")
vim.keymap.set("n", "<A-2>", ":BufferGoto 2<CR>")
vim.keymap.set("n", "<A-3>", ":BufferGoto 3<CR>")
vim.keymap.set("n", "<A-4>", ":BufferGoto 4<CR>")
vim.keymap.set("n", "<A-5>", ":BufferGoto 5<CR>")
vim.keymap.set("n", "<A-6>", ":BufferGoto 6<CR>")
vim.keymap.set("n", "<A-7>", ":BufferGoto 7<CR>")
vim.keymap.set("n", "<A-8>", ":BufferGoto 8<CR>")
vim.keymap.set("n", "<A-9>", ":BufferGoto 9<CR>")
vim.keymap.set("n", "<A-0>", ":BufferLast<CR>")
vim.keymap.set("n", "<A-c>", ":BufferClose<CR>")
vim.keymap.set("n", "<C-p>", ":BufferPick<CR>")
vim.keymap.set("n", "<leader>bb", ":BufferOrderByBufferNumber<CR>")
vim.keymap.set("n", "<leader>bd", ":BufferOrderByDirectory<CR>")
vim.keymap.set("n", "<leader>bl", ":BufferOrderByLanguage<CR>")
