-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Misc options copied from kickstart. TODO: Check if I still want all this and if I am missing anything
vim.g.have_nerd_font = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.clipboard = 'unnamedplus'

vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Setup lazy.nvim
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

-- Keymap. TODO: Move to a different file

-- Clear search highlighting.
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- fzf

-- Files
vim.keymap.set("n", "<leader>ff", require('fzf-lua').files, { desc = "Fzf files" })
vim.keymap.set("n", "<leader>fh", require('fzf-lua').oldfiles, { desc = "Fzf opened files history" })

-- Buffers
vim.keymap.set("n", "<leader>bb", require('fzf-lua').buffers, { desc = "Fzf buffers" })

-- Search/grep
vim.keymap.set("n", "<leader>sg", require('fzf-lua').live_grep, { desc = "Fzf grep" })
vim.keymap.set("n", "<leader>ss", require('fzf-lua').lgrep_curbuf, { desc = "Fzf grep current buffer" })
vim.keymap.set("n", "<leader>sw", require('fzf-lua').grep_cword, { desc = "Fzf grep current word" })

