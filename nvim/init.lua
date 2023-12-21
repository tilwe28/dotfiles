-- Set <space> as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '	

-------------
-- Plugins --
-------------
-- Lazy Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath) -- runtime path

-- Configure Plugins
require("lazy").setup({
    -- Colorscheme
    {
        "navarasu/onedark.nvim",
        priority = 1000,
        opts = { style = "deep" },
        config = function(_, opts)
            require("onedark").setup(opts)
            vim.cmd.colorscheme "onedark"
        end,
    },

    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                icons_enabled = false,
                theme = "onedark",
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_b = { "filename" },
                lualine_c = { "branch", "searchcount", "selectioncount" },
            },
        },
    },
})


-------------
-- Options --
-------------
-- Numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Indentation
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.breakindent = true

-- Searching
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Window
vim.o.termguicolors = true
vim.o.scrolloff = 999
vim.o.splitright = true
vim.o.splitbelow = true

-- Misc
vim.o.mouse = 'a'               -- enable mouse
vim.o.undofile = true           -- save changes over multiple sessions
vim.cmd("nmap Q <Nop>")         -- delete Q key mapping (default enters ex mode)
vim.opt.virtualedit = "block"   -- visual block allows selection over entire screen
vim.opt.inccommand = "split"    -- shows preview window of search and replace changes
