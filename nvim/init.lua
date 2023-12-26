-- Set <space> as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-------------
-- OPTIONS --
-------------
require('core.options')

-------------
-- PLUGINS --
-------------
-- Lazy Plugin Manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath) -- runtime path

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opts = {
    defaults = { lazy = true, },
}

local lazy_status_ok, lazy = pcall(require, 'lazy')
if not lazy_status_ok then
    return
end
lazy.setup('plugins', opts)

-------------
-- KEYMAPS --
-------------
require('core.keymaps')

-----------
-- OTHER --
-----------
-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
