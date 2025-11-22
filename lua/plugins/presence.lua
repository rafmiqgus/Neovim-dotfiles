return {
  'andweeb/presence.nvim',
  Lazy = false,
  config = function()
    -- The setup config table shows all available config options with their default values:
    require("presence").setup({
      -- General options
      auto_update         = true,
      neovim_image_text   = "The One True Text Editor",
      main_image          = "neovim",
      debounce_timeout    = 10,
      buttons             = true,
      show_time           = true,
      -- Rich Presence text options
      editing_text        = "Editing %s",
      file_explorer_text  = "Browsing %s",
      git_commit_text     = "Committing changes",
      plugin_manager_text = "Managing plugins",
      reading_text        = "Reading %s",
      workspace_text      = "Working on %s",
    })
  end,
}
