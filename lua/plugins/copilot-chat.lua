return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make",
    opts = {
      model = 'gpt-4.1',           -- AI model to use
      temperature = 0.1,           -- Lower = focused, higher = creative
      window = {
        layout = 'vertical',       -- 'vertical', 'horizontal', 'float'
        width = 0.4,              -- 30% of screen width
      },
      auto_insert_mode = true,
    },
    window = {
      layout = 'float',
      border = 'rounded', -- 'single', 'double', 'rounded', 'solid'
      title = '🤖 AI Assistant',
      zindex = 100, -- Ensure window stays on top
    },

    headers = { 
      user = '👤 You',
      assistant = '🤖 Copilot',
      tool = '🔧 Tool',
    },

    separator = '━━',
    auto_fold = true, -- Automatically folds non-assistant messages
  },
}
