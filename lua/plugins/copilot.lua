return {
  -- Copilot engine (Lua)
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    opts = {
      -- We'll use cmp for suggestions:
      suggestion = { enabled = false },
      panel = { enabled = false },
      -- If needed: copilot_node_command = "node", -- ensure Node ≥ 18/22 on PATH
    },
  },

  -- Bridge Copilot -> nvim-cmp
  {
    "zbirenbaum/copilot-cmp",
    enabled = false;
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  -- Extend your existing cmp config (no rewrite)
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = opts.sources or {}

      -- add copilot source if missing (at the front)
      local has = false
      for _, s in ipairs(opts.sources) do
        if s.name == "copilot" then has = true break end
      end
      if not has then
        table.insert(opts.sources, 1, { name = "copilot", group_index = 2 })
      end

      -- (Optional) prioritize Copilot a bit in sorting
      opts.sorting = opts.sorting or {}
      opts.sorting.comparators = opts.sorting.comparators
        or { cmp.config.compare.score }
      local ok, cop = pcall(require, "copilot_cmp.comparators")
      if ok then
        table.insert(opts.sorting.comparators, 1, cop.prioritize)
      end
    end,
  },
}

