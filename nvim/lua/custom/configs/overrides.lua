local M = {}

M.whichkey = {
    window = {
        border = "rounded",
    },
}

local cmp = require "cmp"
local cmp_ui = require("core.utils").load_config().ui.cmp
local ELLIPSIS_CHAR = '…'
local MAX_LABEL_WIDTH = 20
local MIN_LABEL_WIDTH = 20

M.cmp = {
    completion = {
        keyword_length = 2,
    },
    formatting = {
        fields = { "abbr", "kind", "menu" },

        format = function(entry, item)
            local icons = require("nvchad_ui.icons").lspkind
            local icon = (cmp_ui.icons and icons[item.kind]) or ""

            icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
            item.kind = string.format("%s %s", icon, cmp_ui.lspkind_text and item.kind or "")

            local label = item.abbr
            local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
            if truncated_label ~= label then
                item.abbr = truncated_label .. ELLIPSIS_CHAR
            elseif string.len(label) < MIN_LABEL_WIDTH then
                local padding = string.rep(' ', MIN_LABEL_WIDTH - string.len(label))
                item.abbr = label .. padding
            end

            return item
        end,
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        ["<Down>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<Up>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
}

M.nvterm = {
    terminals = {
        type_opts = {
            float = {
                relative = 'editor',
                row = 0.1,
                col = 0.1,
                width = 0.8,
                height = 0.8,
                border = "single",
            },
        },
    },
    behavior = {
        autoclose_on_quit = {
            enabled = true,
            confirm = false,
        },
        close_on_exit = true,
        auto_insert = false,
    },
}

M.telescope = {
    defaults = {
        layout_config = {
            width = 0.96,
        },
        path_display = function(opts, path)
            local sections = {}

            -- Extract sections by splitting the path using the path separator
            for section in string.gmatch(path, "[^/]+") do
                table.insert(sections, section)
            end

            local result = ""
            if #sections < 3 then
                result = path -- Use the whole path if less than 3 sections
            else
                -- Concatenate the last three sections with path separators
                result = table.concat(sections, "/", #sections - 2)
            end

            -- Trim the left side of the result if it's larger than 28 characters
            if #result > 28 then
                local trimLength = #result - 28
                result = "…" .. string.sub(result, trimLength + 1)
            end

            return result
        end,
        color_devicons = true,
        dynamic_preview_title = true,
    },
}

M.nvimtree = {
    filters = {
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = { "node_modules", "\\.cache", ".null-ls*" },
        exclude = {},
    },
    git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 200,
    },
    renderer = {
        highlight_git = true,
        icons = {
            show = {
                git = true
            }
        }
    },
}

M.gitsigns = {
    signs = {
        add = { text = "" },
        change = { text = "" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
    },
}

M.treesitter = {
    indent = { enable = true }
}

M.colorizer = {
    user_default_options = { names = false, css = true },
}

return M
