-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
    -- Window borders
    NvimTreeWinSeparator = {
        fg = "#634811",
    },
    WinSeparator = {
        fg = "#634811",
    },
    WhichKeyBorder = {
        fg = "#634811",
    },
    FloatBorder = {
        fg = "#634811",
    },
    TelescopeBorder = {
        fg = "#634811",
    },
    TelescopePromptBorder = {
        fg = "#634811",
    },
    CmpBorder = {
        fg = "#634811",
    },
    CmpDocBorder = {
        fg = "#634811",
    },


    -- Window picker
    NvimTreeWindowPicker = {
        fg = "#ffffff",
        bg = "#265b72",
    },

    -- Make visual select color a bit brighter
    Visual = {
        bg = "#4F5256",
    },

    -- Make folds visible
    Folded = {
        fg = "#ffffff",
    },

    -- Fix diffview highlights
    DiffAdd = {
        fg = "NONE",
        bg = "#1d2214",
    },
    DiffDelete = {
        fg = "NONE",
        bg = "#2d2220",
    },
    DiffChange = {
        fg = "yellow",
    },

    -- Make telescope title be visible
    TelescopeTitle = {
        fg = "#ffffff",
    },
    TelescopeResultsTitle = {
        fg = "#ffffff",
    },

    -- Treesitter stuff
    ["@operator"] = {
        fg = "red"
    },
    ["Repeat"] = {
        fg = {"orange", -16},
    },
    ["@exception"] = {
        fg = {"orange", -16},
    },
    ["@keyword"] = {
        fg = {"orange", -16},
    },
    ["@keyword.function"] = {
        fg = {"orange", -16},
    },
    ["@function"] = {
        fg = "orange",
    },
    ["@function.call"] = {
        fg = "orange",
    },
    ["@method.call"] = {
        fg = "orange",
    },
    ["@field.python"] = {
        fg = "purple",
    },
    ["Type"] = {
        fg = "nord_blue",
    },
    ["@constant"] = {
        fg = "sun",
    },
    ["@float"] = {
        fg = "purple",
    },
    ["PreProc"] = {
        link = "Define",
    },
}

---@type HLTable
M.add = {
    ["MarkSignHL"] = {
        fg = "red",
        bold = true,
    },
    ["@lsp.type.macro.cpp"] = {
        fg = "red",
    },
    ["@tag.attribute.html"] = {
        fg = "purple",
    },
    ["@property.css"] = {
        fg = "orange",
    },
    ["htmlTagName"] = {
        link = "@tag.html",
    },
    ["htmlSpecialTagName"] = {
        link = "@tag.html",
    },
    ["htmlTag"] = {
        link = "@tag.delimiter.html",
    },
    ["htmlEndTag"] = {
        link = "@tag.delimiter.html",
    },
    ["htmlArg"] = {
        link = "@tag.attribute.html",
    },
}

return M
