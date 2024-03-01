---@diagnostic disable: need-check-nil
local create_cmd = vim.api.nvim_create_user_command
local create_autocmd = vim.api.nvim_create_autocmd

-- Redraw the status bar on mode change to prevent it disappearing in some
-- circumstances for no reason
create_autocmd({ "ModeChanged" }, {
    callback = function()
        vim.cmd("let &stl=&stl")
    end,
})

-- Prevent telescope from entering insert mode when opening a file
create_autocmd({ "WinLeave" }, {
    callback = function()
        if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
        end
    end,
})
