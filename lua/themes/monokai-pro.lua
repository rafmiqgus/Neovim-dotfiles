-- ~/.config/nvim/lua/themes/monokai_pro.lua
local M = {}

M.base_30 = {
  white         = "#fcfcfa",
  black         = "#221f22",
  darker_black  = "#19181a",
  black2        = "#2d2a2e",
  one_bg        = "#2d2a2e",
  one_bg2       = "#403e41",
  one_bg3       = "#403e41",

  grey          = "#5b595c",
  grey_fg       = "#727072",
  grey_fg2      = "#939293",
  light_grey    = "#c1c0c0",

  red           = "#ff6188",
  orange        = "#fc9867",
  yellow        = "#ffd866",
  green         = "#a9dc76",
  blue          = "#78dce8",
  teal          = "#78dce8",
  cyan          = "#78dce8",
  purple        = "#ab9df2",
  dark_purple   = "#ab9df2",

  line          = "#2d2a2e",
  statusline_bg = "#221f22",
  lightbg       = "#2d2a2e",
  pmenu_bg      = "#ab9df2",
  folder_bg     = "#78dce8",
}

M.base_16 = {
  base00 = "#221f22",
  base01 = "#403e41",
  base02 = "#5b595c",
  base03 = "#727072",
  base04 = "#939293",
  base05 = "#fcfcfa",
  base06 = "#fcfcfa",
  base07 = "#ffffff",
  base08 = "#ff6188",
  base09 = "#fc9867",
  base0A = "#ffd866",
  base0B = "#a9dc76",
  base0C = "#78dce8",
  base0D = "#ab9df2",
  base0E = "#ab9df2",
  base0F = "#ff6188",
}

M.type = "dark"

M = require("base46").override_theme(M, "monokai-pro")

return M
