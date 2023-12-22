-------------
-- Keymaps --
-------------
-- Remove Mappings
vim.keymap.set('n', 'Q', "<Nop>", { silent = true })
vim.keymap.set({ 'n', 'v' }, "<Space>", "<Nop>", { silent = true })

-- Line Wrapping
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- NvimTree
vim.keymap.set({ 'n', 'v', 'i' }, "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
