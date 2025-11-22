return {
  {
    dir = vim.fn.stdpath("config") .. "/lua/custom_plugins/epitech-header.nvim",
    event = "VeryLazy",
    config = function()
      require("epitech").setup() -- default keymaps; set keymaps=false to skip
    end,
    keys = {
      { "<leader>h", "<cmd>EpiHeader<CR>",   desc = "Epitech header" },
      { "<C-c><C-c>", "<cmd>w | Compile<CR>", desc = "Save & Compile" },
      { "<C-g>",       "<cmd>GotoLine<CR>",   desc = "Goto line" },
    },
  },
}
