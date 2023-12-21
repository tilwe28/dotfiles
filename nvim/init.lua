-- Set <space> as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '	

-------------
-- Options --
-------------
vim.wo.number = true
vim.wo.relativenumber = true

-- Indentation
vim.o.breakindent = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- Searching
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Misc
vim.o.mouse = 'a'
vim.o.termguicolors = true
vim.o.undofile = true

vim.cmd("nmap Q <Nop>")


-----------
-- Theme --
-----------
vim.cmd.colorscheme("lunaperche")
vim.cmd.highlight({ "Normal", "guibg=#121212", "ctermbg=233" })
