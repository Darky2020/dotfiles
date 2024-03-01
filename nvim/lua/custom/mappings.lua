---@type MappingsTable
local M = {}

M.general = {
    n = {
        -- Don't store those into the jump list
        ["}"] = {
            '<Cmd>execute "keepjumps norm! " . v:count1 . "}"<CR>',
            "Jump to the next paragraph"
        },
        ["{"] = {
            '<Cmd>execute "keepjumps norm! " . v:count1 . "{"<CR>',
            "Jump to the previous paragraph"
        },

        -- Display diagnostics in a floating window
        ["<leader>v"] = {
            ":lua vim.diagnostic.open_float()<CR>",
            "Show current diagnostic"
        },

        -- Restore the defaults
        ["gi"] = { "`^i", "Go to the last insertion" },

        -- Keymap for toggling trouble
        ["<leader>i"] = {
            "<cmd> TroubleToggle document_diagnostics<CR>",
            "Toggle file diagnostics",
        },

        -- Keymaps for diffview
        ["<leader>gd"] = {
            "<cmd> DiffviewFileHistory %<CR>",
            "Git diff current file",
        },

        ["<leader>gh"] = {
            "<cmd> DiffviewFileHistory<CR>",
            "Git commit history",
        },

        -- Replace some mappings with telescope
        ["gd"] = {
            "<cmd> Telescope lsp_definitions<CR>",
            "Go to definition",
        },
        ["gr"] = {
            "<cmd> Telescope lsp_references<CR>",
            "Go to reference",
        },
        ["<C-a>"] = {
            "ggVG",
            "Select all",
        },
    },
    v = {
        -- Don't store those into the jump list
        ["}"] = {
            '<Cmd>execute "keepjumps norm! " . v:count1 . "}"<CR>',
            "Jump to the next paragraph"
        },
        ["{"] = {
            '<Cmd>execute "keepjumps norm! " . v:count1 . "{"<CR>',
            "Jump to the previous paragraph"
        },

        -- Don't jump back to the beginning of the visual block
        ["y"] = { "ygv<Esc>", "Yank selected text" },

        -- Don't switch back to normal mode immediately after using those
        ["<"] = { "<gv", "Indent left" },
        [">"] = { ">gv", "Indent right" },

        ["A"] = {
            [[:'<,'> ! awk '{ print length(), $0 | "sort -n | cut -d\\  -f2-" }' <CR><CR>]],
            "Sort selected lines in an ascending order"},
        ["D"] = {
            [[:'<,'> ! awk '{ print -length(), $0 | "sort -n | cut -d\\  -f2-" }' <CR><CR>]],
            "Sort selected lines in a descending order"
        },
    },
    t = {
        ["<Esc>"] = {
            vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true),
            "Escape terminal mode"
        },
    },
}

M.telescope = {
    plugin = true,

    n = {
        ["<leader>fg"] = {
            "<cmd> Telescope highlights <CR>",
            "Find highlight groups"
        }
    }
}

M.nvterm = {
  plugin = true,

  n = {
    -- Keymaps for toggling a horizontal and a floating terminals
    ["<leader>j"] = {
      function()
        require("nvterm.terminal").toggle "float"

        local keys = vim.api.nvim_replace_termcodes(
            "<C-\\><C-N>", true, true, true
        )

        vim.api.nvim_feedkeys(keys, 'm', false)
      end,
      "Toggle floating term",
    },

    ["<leader>h"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
        local keys = vim.api.nvim_replace_termcodes(
            "<C-\\><C-N>", true, true, true
        )

        vim.api.nvim_feedkeys(keys, 'm', false)
      end,
      "New horizontal term",
    },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- Toggle it instead of focusing
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

return M
