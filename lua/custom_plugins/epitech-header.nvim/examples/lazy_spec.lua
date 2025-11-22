-- examples/lazy_spec.lua
return {
  dir = vim.fn.stdpath("config") .. "/lua/custom_plugins/epitech-header.nvim",
  event = "VeryLazy",
  config = function()
    require("epitech").setup()
  end,
  keys = {
    { "<C-c><C-h>", "<cmd>EpiHeader<CR>", desc = "Insert Epitech header" },
    { "<C-c><C-c>", "<cmd>w | Compile<CR>", desc = "Save & Compile" },
    { "<C-g>", "<cmd>GotoLine<CR>", desc = "Goto line prompt" },
  },
}
