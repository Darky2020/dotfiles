---@type ChadrcConfig 

local M = {}

-- vim.api.nvim_set_hl(0, "@operator", { fg = "red" })

local highlights = require "custom.highlights"
local sections = require "custom.statusline"

 M.ui = {
    theme = "ayu_dark",

    hl_override = highlights.override,
    hl_add = highlights.add,

    -- Show it even with a single file opened
    tabufline = {
        show_numbers = false,
        enabled = true,
        lazyload = false,
        overriden_modules = nil,
     },

    statusline = {
        overriden_modules = function(modules)
            modules[3] = (function()
                return sections.git()
            end)()

            modules[5] = (function()
                return sections.searchcount() .. " " .. sections.macrorecording()
            end)()

            modules[7] = (function()
                return sections.LSP_Diagnostics()
            end)()

            modules[8] = (function()
                return sections.LSP_status()
            end)()

            modules[10] = (function()
                return sections.cursor_position()
            end)()
        end,
        theme = "default",
    },

    nvterm = {
        behavior = {
            auto_insert = false
        }
    }
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
