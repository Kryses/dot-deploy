local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")
vim.lsp.set_log_level("debug")
lspconfig.pyright.setup({
  cmd = {'pyright-langserver', '--stdio'},
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python", '*.spec'},
})

lspconfig.ansiblels.setup({
  cmd = {"ansible-language-server", "--stdio"},
  filetypes = {"yaml"},
})
