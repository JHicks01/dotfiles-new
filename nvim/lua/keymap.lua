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

-- LSP
-- FYI these defaults are used, so not set here:
--   - CTRL-] to jump to definition
--   - K to vim.lsp.buf.hover()
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action) -- TODO: What does this actually do?
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>cu", vim.lsp.buf.references) 
vim.keymap.set("n", "<leader>ch", vim.lsp.buf.signature_help)
