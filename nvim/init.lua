-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set <space> as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '	

-------------
-- Plugins --
-------------
require("custom.plugins")

-------------
-- Options --
-------------
require("custom.options")

-------------
-- Keymaps --
-------------
require("custom.keymaps")

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
