-- Clear search highlighting.
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- fzf
-- Files
vim.keymap.set("n", "<leader>ff", require('fzf-lua').files)
vim.keymap.set("n", "<leader>fh", require('fzf-lua').oldfiles)

-- Buffers and tabs
vim.keymap.set("n", "<leader>bb", require('fzf-lua').buffers)
vim.keymap.set("n", "<leader>tt", require('fzf-lua').tabs)

-- Search/grep
vim.keymap.set("n", "<leader>sg", require('fzf-lua').live_grep)
vim.keymap.set("n", "<leader>ss", require('fzf-lua').lgrep_curbuf)
vim.keymap.set("n", "<leader>sw", require('fzf-lua').grep_cword)

-- LSP
-- FYI these defaults are used, so not set here:
--   - CTRL-] to jump to definition
--   - K to vim.lsp.buf.hover()
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>cu", vim.lsp.buf.references) 
vim.keymap.set("n", "<leader>ch", vim.lsp.buf.signature_help)

-- Defaults
-- The following defaults are used so not explicitly set:
--   CTRL-] = tagfunc (jump to definition)
--   K = vim.lsp.buf.hover (display information about the symbol under cursor in popup)
--   i_CTRL-X_CTRL-O = omnifunc (trigger autocompletion for code)
--   i_CTRL-X_CTRL-f = compl-filename (trigger autocompletion for filenames)
