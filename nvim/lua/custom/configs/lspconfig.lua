local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.pyright.setup(require("custom.configs.pyright"))
lspconfig.gopls.setup(require("custom.configs.gopls"))

lspconfig.html.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  filetypes = { "html", "htmldjango"},
})

lspconfig.cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.omnisharp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "omnisharp" }
})

lspconfig.clangd.setup({})
