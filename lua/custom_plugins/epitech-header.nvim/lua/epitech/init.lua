-- epitech-header.nvim
-- A small Neovim plugin that inserts the classic EPITECH header, plus two helpers: :Compile and :GotoLine.

local M = {}

-- Comment maps (no shebang)
local map_no_shebang = {
  c       = { b = "/*",  m = "**",  e = "*/" },
  cpp     = { b = "/*",  m = "**",  e = "*/" },
  make    = { b = "##",  m = "##",  e = "##" },
  java    = { b = "//",  m = "//",  e = "//" },
  latex   = { b = "%%",  m = "%%",  e = "%%" },
  tex     = { b = "%%",  m = "%%",  e = "%%" },
  html    = { b = "<!--",m = "  --",e = "-->" },
  lisp    = { b = ";;",  m = ";;",  e = ";;" },
  css     = { b = "/*",  m = "**",  e = "*/" },
  pov     = { b = "//",  m = "//",  e = "//" },
  pascal  = { b = "{ ",  m = "   ", e = "}" },
  haskell = { b = "{-",  m = "-- ", e = "-}" },
  vim     = { b = '""',  m = '""',  e = '""' },
}

-- Comment maps (with shebang)
local map_shebang = {
  sh   = { s = "#!/usr/bin/env bash",   b = "##", m = "##", e = "##" },
  bash = { s = "#!/usr/bin/env bash",   b = "##", m = "##", e = "##" },
  zsh  = { s = "#!/usr/bin/env zsh",    b = "##", m = "##", e = "##" },
  php  = { s = "#!/usr/bin/env php",    b = "/*", m = "**", e = "*/" },
  perl = { s = "#!/usr/bin/env perl",   b = "##", m = "##", e = "##" },
}

local function supported(ft)
  if map_no_shebang[ft] then return 0 end
  if map_shebang[ft] then return 1 end
  return nil
end

local function goto_line_number(n)
  local maxline = vim.api.nvim_buf_line_count(0)
  local target = math.max(1, math.min(n, maxline))
  pcall(vim.api.nvim_win_set_cursor, 0, { target, 0 })
end

-- Wrap description text to 80 characters per line
local function wrap_description(desc, comment_marker)
  if desc == "" then
    return { comment_marker }
  end
  
  local wrapped_lines = {}
  local prefix = comment_marker .. " "
  local max_len = 80 - #prefix
  
  local remaining = desc
  while #remaining > 0 do
    if #remaining <= max_len then
      table.insert(wrapped_lines, prefix .. remaining)
      break
    else
      -- Find the last space before max_len
      local cut_pos = max_len
      local last_space = remaining:sub(1, max_len):match("^.*()%s")
      if last_space and last_space > 1 then
        cut_pos = last_space - 1
      end
      
      table.insert(wrapped_lines, prefix .. remaining:sub(1, cut_pos))
      remaining = remaining:sub(cut_pos + 1):match("^%s*(.*)") or ""
    end
  end
  
  return wrapped_lines
end

-- Detect an existing EPITECH header and return start/end lines (or nil if not found).
local function find_existing_header(buf, ft)
  local max_scan = math.min(40, vim.api.nvim_buf_line_count(buf))
  local lines = vim.api.nvim_buf_get_lines(buf, 0, max_scan, false)

  if #lines < 2 then return nil end
  local pat = "%*%* EPITECH PROJECT"

  for i, line in ipairs(lines) do
    if line:match(pat) then
      -- assume header starts at line 0 and ends at first closing marker
      for j = i, max_scan do
        if lines[j] and lines[j]:match("%*/") then
          return 0, j
        end
      end
    end
  end
  return nil
end

--- Insert or replace EPITECH header.
function M.insert_header()
  local ft = vim.bo.filetype
  local has = supported(ft)

  if has == nil then
    vim.notify(("Epitech header: Unsupported filetype: %s"):format(ft), vim.log.levels.ERROR)
    return
  end

  local desc = vim.fn.input("Enter file description: ")
  local year = os.date("%Y")
  local fname = vim.fn.expand("%:t")

  local lines = {}
  if has == 0 then
    local c = map_no_shebang[ft]
    table.insert(lines, c.b)
    table.insert(lines, c.m .. " EPITECH PROJECT, " .. year)
    table.insert(lines, c.m .. " " .. fname)
    table.insert(lines, c.m .. " File description:")
    local desc_lines = wrap_description(desc, c.m)
    for _, line in ipairs(desc_lines) do
      table.insert(lines, line)
    end
    table.insert(lines, c.e)
  else
    local c = map_shebang[ft]
    table.insert(lines, c.s)
    table.insert(lines, c.b)
    table.insert(lines, c.m .. " EPITECH PROJECT, " .. year)
    table.insert(lines, c.m .. " " .. fname)
    table.insert(lines, c.m .. " File description:")
    local desc_lines = wrap_description(desc, c.m)
    for _, line in ipairs(desc_lines) do
      table.insert(lines, line)
    end
    table.insert(lines, c.e)
  end

  -- Add an empty line after the header
  table.insert(lines, "")

  -- Replace existing header if found
  local s, e = find_existing_header(0, ft)
  if s and e then
    vim.api.nvim_buf_set_lines(0, s, e + 1, false, lines)
  else
    vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
  end

  goto_line_number(#lines + 1)
end

--- Prompt for a build command (default: "make"), set &makeprg, then run :make.
function M.compile()
  local default = "make"
  local cmd = vim.fn.input("compile : ", default)
  if cmd == nil or cmd == "" then cmd = default end
  vim.o.makeprg = cmd
  vim.cmd("make")
end

--- Prompt for a line number and jump to it.
function M.goto_line()
  local s = vim.fn.input("Goto Line : ")
  if not s or s == "" then return end
  local n = tonumber(s)
  if n then
    local maxline = vim.api.nvim_buf_line_count(0)
    local target = math.max(1, math.min(n, maxline))
    pcall(vim.api.nvim_win_set_cursor, 0, { target, 0 })
  else
    pcall(vim.cmd, s)
  end
end

function M.setup(opts)
  opts = opts or {}
  -- user commands
  vim.api.nvim_create_user_command("EpiHeader", M.insert_header, {})
  vim.api.nvim_create_user_command("Compile",   M.compile,      {})
  vim.api.nvim_create_user_command("GotoLine",  M.goto_line,    {})

  -- keymaps (optional)
  if opts.keymaps ~= false then
    vim.keymap.set("n", "<C-c><C-h>", "<cmd>EpiHeader<CR>", { desc = "Insert Epitech header" })
    vim.keymap.set("n", "<C-c><C-c>", "<cmd>w | Compile<CR>", { desc = "Save & Compile" })
    vim.keymap.set("n", "<C-g>", "<cmd>GotoLine<CR>", { desc = "Goto line prompt" })
  end
end

return M
