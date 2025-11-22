local nvchad_lsp = require "nvchad.configs.lspconfig"
nvchad_lsp.defaults()
local on_attach = nvchad_lsp.on_attach
local capabilities = nvchad_lsp.capabilities
local lspconfig = require "lspconfig"

local servers = {
  clangd = {
    cmd = {
      "clangd",
      "--clang-tidy",
      "--background-index",
      "--offset-encoding=utf-8",
      "--query-driver=/nix/store/*-clang-*/bin/*clang*,/nix/store/*-clang-wrapper-*/bin/clang,/nix/store/*-gcc-*/bin/*gcc*",
    },
  },
  basedpyright = {
    settings = {
      basedpyright = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "standard",
          -- diagnosticSeverityOverrides = {
          --   reportUnknownVariableType = "off",
          --   reportUnknownMemberType = "off",
          --   reportUnknownArgumentType = "off",
          --   reportUnknownParameterType = "off",
          -- },
        },
      },
    },
  },
  nil_ls = {},
  lua_ls = {},
  bashls = {},
}

for name, opts in pairs(servers) do
  opts.on_attach = on_attach
  opts.capabilities = capabilities
  lspconfig[name].setup(opts)
end

-- dans un plugin/override NVChad
vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(vim.lsp.handlers.hover, { focusable = false })
vim.lsp.handlers["textDocument/signatureHelp"] =
  vim.lsp.with(vim.lsp.handlers.signature_help, { focusable = false })

vim.diagnostic.config({ float = { focusable = false } })


-- vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

-- vim.lsp.config('clangd', {
--   cmd = {
--     "/home/rafael/.nix-profile/bin/clangd",
--     "--clang-tidy",
--     "--background-index",
--     "--offset-encoding=utf-8",
--   },
-- })

-- vim.lsp.config('basedpyright', {
--   settings = {
--     basedpyright = {
--       analysis = {
--         -- base ruleset: off/basic/standard/strict/recommended/all
--         typeCheckingMode = "off",
--
--         -- enable “partially unknown” warnings
--         diagnosticSeverityOverrides = {
--           reportUnknownVariableType  = "off",
--           reportUnknownMemberType    = "off",
--           reportUnknownArgumentType  = "off",
--           reportUnknownParameterType = "off",
--           reportUnknownLambdaType    = "off",
--         },
--       },
--     },
--   },
-- })


