---@diagnostic disable: different-requires
local overrides = require "custom.configs.overrides"

local M = {
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        event = "VeryLazy",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = function()
            require("barbecue").setup()
        end,
    },
    {
        "folke/which-key.nvim",
        opts = overrides.whichkey,
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = overrides.nvimtree,
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = overrides.gitsigns,
    },
    {
        "NvChad/nvim-colorizer.lua",
        opts = overrides.colorizer,
    },
    {
        "hrsh7th/nvim-cmp",
        opts = overrides.cmp,
    },
    {
        "nvim-telescope/telescope.nvim",
        opts = overrides.telescope,
    },
    {
        "NvChad/nvterm",
        opts = overrides.nvterm,
    },
    {
        "folke/trouble.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "sindrets/diffview.nvim",
        event = "VeryLazy",
    },
    {
        "neovim/nvim-lspconfig",

        dependencies = {
            "jose-elias-alvarez/null-ls.nvim",
            config = function()
                require "custom.configs.null-ls"
            end,
            event = "BufEnter",
        },
        event = "BufEnter",

        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    {
        "chentoast/marks.nvim",
        event = "BufEnter",

        config = function ()
            require "custom.configs.marks"
        end,
    }
}

return M
