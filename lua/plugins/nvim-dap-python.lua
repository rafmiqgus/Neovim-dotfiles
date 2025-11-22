return {
  "mfussenegger/nvim-dap-python",
  lazy = true,
  ft = { "python" },
  dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
  config = function()
    require("dap-python").setup("uv")
  end,
}
