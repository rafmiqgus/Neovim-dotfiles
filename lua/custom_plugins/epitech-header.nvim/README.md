# epitech-header.nvim

A tiny Lua port of an old Vimscript that inserts the EPITECH header and offers two helpers:

- `:EpiHeader` — prompts for *Project name* and *File description*, inserts a properly commented header (with shebang for shell/php/perl if relevant).
- `:Compile` — prompts for a build command (default: `make`), sets `makeprg`, and runs `:make`.
- `:GotoLine` — prompts for a line number and jumps to it.

## Installation (lazy.nvim)

Put this repo somewhere (e.g. inside your config as a local plugin) and add a spec:

```lua
-- lua/plugins/epitech_header.lua
return {
  -- If you copy the plugin into your config:
  dir = vim.fn.stdpath("config") .. "/lua/custom_plugins/epitech-header.nvim",
  -- Or if you place it elsewhere, point `dir` to that location.

  event = "VeryLazy",
  config = function()
    require("epitech").setup() -- remove to skip default keymaps
  end,
  keys = {
    { "<C-c><C-h>", "<cmd>EpiHeader<CR>", desc = "Insert Epitech header" },
    { "<C-c><C-c>", "<cmd>w | Compile<CR>", desc = "Save & Compile" },
    { "<C-g>", "<cmd>GotoLine<CR>", desc = "Goto line prompt" },
  },
}
```

Recommended layout if you keep it local to your config:

```
~/.config/nvim/
  lua/
    custom_plugins/
      epitech-header.nvim/
        lua/epitech/init.lua
        plugin/epitech.lua
```

Alternatively, you can vendor it as a git submodule and use `dir = "path/to/epitech-header.nvim"` in your lazy spec.

## Usage

- Run `:EpiHeader` inside any supported filetype buffer to insert the header at the top.
- Run `:Compile` to select a build command (default is `make`), then it runs `:make`.
- Run `:GotoLine` to jump to a line by number (or execute a raw Ex command if text is provided).

Supported filetypes (no shebang): `c, cpp, make, java, latex/tex, html, lisp, css, pov, pascal, haskell, vim`  
Supported filetypes (with shebang): `sh, bash, zsh, php, perl`
```

examples/lazy_spec.lua
```lua
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
```
