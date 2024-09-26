require('lazy').setup({
    {
        'catppuccin/nvim',
        priority = 1000,
        init = function()
            vim.cmd.colorscheme 'catppuccin'
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            theme = 'catppuccin'
        },
        config = function()
            require('lualine').setup {
                options = {
                    theme = "catppuccin"
                }
            }
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            require'lspconfig'.clangd.setup{}
            require'lspconfig'.rust_analyzer.setup{}
        end 
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "cpp", "rust", "python"},
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({})
        end
    }
})
