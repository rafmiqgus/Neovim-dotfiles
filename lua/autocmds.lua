require "nvchad.autocmds"

-- define (and clear) a group for our autocmds
local group = vim.api.nvim_create_augroup("MyCustomTabs", { clear = true })

-- create the autocmd
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "lua", "nix" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

-- nvim-dap-python attach 
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = {"py"},
  callback = function()
    require("dap-python").setup("uv")
  end,
})

-- vim.api.nvim_create_augroup("NumberToggle", { clear = true })
-- vim.api.nvim_create_autocmd("InsertEnter", {
--   group = "NumberToggle",
--   pattern = "*",
--   command = "set norelativenumber",
-- })
-- vim.api.nvim_create_autocmd("InsertLeave", {
--   group = "NumberToggle",
--   pattern = "*",
--   command = "set relativenumber",
-- })

