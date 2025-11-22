-- Auto-register commands on load when used by plugin managers that source plugin/*.lua.
-- If you use `require("epitech").setup()` yourself in your config, this file is optional.
pcall(function()
  require("epitech").setup()
end)
