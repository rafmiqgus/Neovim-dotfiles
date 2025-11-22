return {
  "theHamsta/nvim-dap-virtual-text",
  dependencies = { "mfussenegger/nvim-dap" },
  opts = {
    -- tweak to taste:
    commented = true,                 -- show values as comments
    show_stop_reason = true,
    highlight_changed_variables = true,
  },
}
