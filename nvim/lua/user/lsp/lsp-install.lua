-- Description: Install LSP servers
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

-- List of servers to install
local servers = {
    "jedi_language_server",
    "bashls",
    "clangd",
    "cmake",
    "dockerls",
    "gopls",
    "html",
    "cssls",
    "ltex",
}

-- Automatically run :LspInstall <server> if server is not installed
lsp_installer.setup({automatic_installation = false,})

-- Pull the lspconfig module from nvim-lsp-installer
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
     on_attach = require("user.lsp.handlers").on_attach,
     capabilities = require("user.lsp.handlers").capabilities,
  }

  lspconfig[server].setup(opts)
end
