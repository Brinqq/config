require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")
local m = require"mason-lspconfig"

local default_opts = {on_attach = require("config.lsp.handler").on_attach, capabilities = require("config.lsp.handler").capabilities }

local lua_ls_opts = {
  on_attach = require("config.lsp.handler").on_attach,
  capabilities = require("config.lsp.handler").capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
}

local rust_opts = {
  on_attach = require("config.lsp.handler").on_attach,
  capabilities = require("config.lsp.handler").capabilities,
  settings = {
    Rust = {
      diagnostics = {
        disabled = {
          "unlinked-file",
        },
      },

    },
  },
}


local defaultServers = {
  {server = "clangd", opts = default_opts},
  {server = "rust_analyzer", opts = rust_opts},
  {server = "pyright", opts = default_opts},
  {server = "bashls", opts = default_opts},
  {server = "glsl_analyzer", opts = default_opts},
  {server = "zls", opts = lua_ls_opts},
  -- {server = "asm_lsp", opts = default_opts},
  {server = "cssls", opts = default_opts},
  {server = "lua_ls", opts = lua_ls_opts},
  {server = "gopls", opts = default_opts},

}

m.setup{

}

for _, server in pairs(defaultServers) do 
lspconfig[server.server].setup(server.opts)
end

