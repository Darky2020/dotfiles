local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
    -- formatting.ruff.with({
    --     extra_args = { "--ignore", "F401 F841" },
    -- }),

    -- Python
    formatting.black.with({
        extra_args = { "-l", "80" },
    }),

    lint.mypy,
    lint.ruff,

    -- Go
    formatting.gofmt,
    lint.golangci_lint,

    -- Web development
    formatting.prettier,
}

null_ls.setup {
    debug = true,
    sources = sources,
    on_attach = function(client, bufnr)
        vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = bufnr,
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end
        })
    end
}
