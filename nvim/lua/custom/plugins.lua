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
                icons_enabled = true,
                theme = "onedark",
                component_separators = '|',
                section_separators = '',
                globalstatus = true,
            },
            sections = {
                lualine_b = { "filename" },
                lualine_c = { "branch", "searchcount", "selectioncount" },
            },
        },
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Language Server Installer
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            
            -- Additional lua config
            "folke/neodev.nvim",

            -- Status notifications
            { "j-hui/fidget.nvim", opts = {} },
        },
    },

    -- Complete
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",

            -- Snippets
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "windwp/nvim-ts-autotag",
        },
        build = ":TSUpdate",
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },

    -- Indent
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },

    -- Comment
    {
        "numToStr/Comment.nvim",
        opts = {},
    },
    {
        "folke/todo-comments.nvim",
        opts = {
            -- TODO: configure colors and keywords for comments
        },
    },

    -- Filetree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                -- TODO: customize visuals
                renderer = {
                    highlight_git = true,
                    indent_markers = { enable = true, },
                },
                modified = {
                    enable = true,
                },
                filters = {
                    git_ignored = false,
                },
            })
        end,
    },

    -- Toggleterm
    {},

    -- Git
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },

        -- NOTE: May want to add keymaps for extra git functionality
    },

    -- Fuzzy Finder & Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function ()
                    return vim.fn.executable("make") == 1
                end,
            },
        },
    },

    -- Which-Key
    {
        -- "folke/which-key.nvim",
        -- opts = {},
    },
})
