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
vim.o.smartindent = true

-- Searching
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Window
vim.o.termguicolors = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.opt.inccommand = "split"        -- shows preview window of search and replace changes
vim.wo.signcolumn = "yes"           -- keep signcolumn on

-- Cursor
vim.o.scrolloff = 8                 -- keep cursor in middle
vim.o.sidescrolloff = 8
vim.o.cursorline = true
vim.o.mouse = 'a'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Misc
-- vim.o.clipboard = "unnamedplus"  -- sync system clipboard
vim.o.undofile = true               -- save undo history
vim.opt.virtualedit = "block"       -- visual block allows selection over entire screen
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.showmode = false
vim.cmd([[set iskeyword+=-]])
