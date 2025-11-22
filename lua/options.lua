require "nvchad.options"

-- add yours here!

local o = vim.o
local opt = vim.opt

o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4

opt.number = true
opt.relativenumber = true
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }

vim.api.nvim_create_user_command(
  'Lock',
  function()
    vim.fn.jobstart("sudo vlock -an", { detach = true })
  end,
  {}
)
