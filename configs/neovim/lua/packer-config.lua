-- clean install with
-- rm -rf ~/.cache/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.config/nvim/plugin

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            "git", "clone", "--depth", "1",
            "https://github.com/wbthomason/packer.nvim", install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    use {"wbthomason/packer.nvim"}

    use {
        "nvim-lualine/lualine.nvim",
        config = function() require("lualine").setup() end
    } -- Status Line
    use {
        "kyazdani42/nvim-tree.lua",
        config = function() require("nvim-tree").setup() end
    }
    use {"airblade/vim-gitgutter"} -- Git diff in sign column
    use {"editorconfig/editorconfig-vim"}
    use {"junegunn/fzf.vim"}
    use {"romgrk/barbar.nvim", requires = {"kyazdani42/nvim-web-devicons"}} -- Tabs

    -- Rust
    use {
        "saecki/crates.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("crates").setup()
        end,
    }
    use {"simrat39/rust-tools.nvim", config = function() require("rust-tools").setup({}) end}

    -- treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {
        "nvim-treesitter/nvim-treesitter-context",
        config = function() require("treesitter-context").setup() end
    }
    use {"nvim-treesitter/nvim-treesitter-refactor"}

    -- lsp
    use {"neovim/nvim-lspconfig"}
    use {"onsails/lspkind-nvim"} -- vscode-like pictograms for neovim lsp completion items
    use {"hrsh7th/nvim-cmp"} -- Autocompletion plugin
    use {"hrsh7th/cmp-nvim-lsp"} -- LSP source for nvim-cmp
    use {"saadparwaiz1/cmp_luasnip"} -- Snippets source for nvim-cmp
    use {"L3MON4D3/LuaSnip"} -- Snippets plugin

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then require("packer").sync() end
end)
